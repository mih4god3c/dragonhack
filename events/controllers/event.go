package controllers

import (
	"context"
	"log"
	"net/http"
	"time"

	"event-tracking/database"
	"event-tracking/kafka"
	"event-tracking/models"
	"event-tracking/proto"
	"event-tracking/utils"

	eventhub "github.com/Azure/azure-event-hubs-go"
	"github.com/avast/retry-go"
	"github.com/gin-gonic/gin"
	"github.com/spf13/viper"
)

// @Tags			events
// @ID				get-events
// @Summary		List events
// @Description	get events
// @Produce		json
// @Router			/event-tracking/events [get]
func FindEvents(context *gin.Context) {
	var events []models.Event
	database.DB.Find(&events)

	context.JSON(http.StatusOK, gin.H{"data": events})
}

// @Tags			events
// @ID				get-event
// @Summary		Get event
// @Description	get event
// @Produce		json
// @Param			id	path	int	true	"Event ID"
// @Router			/event-tracking/events/{id} [get]
func FindEvent(context *gin.Context) {
	var event models.Event
	if err := database.DB.Where("id = ?", context.Param("id")).First(&event).Error; err != nil {
		context.JSON(http.StatusBadRequest, gin.H{"error": "Record not found!"})
		return
	}

	context.JSON(http.StatusOK, gin.H{"data": event})
}

// @Tags			events
// @ID				create-event
// @Summary		Create event
// @Description	create event
// @Accept			json
// @Produce		json
// @Param			event	body	models.CreateEventRequest	true	"Event"
// @Router			/event-tracking/events [post]
func CreateEvent(context *gin.Context) {
	// Start measuring the time
	timer := time.Now()

	var request models.CreateEventRequest
	if err := context.ShouldBindJSON(&request); err != nil {
		context.JSON(http.StatusBadRequest, gin.H{"error": err.Error()})
		return
	}

	event := models.Event{Type: models.EventType(request.Type), UserId: request.UserId, Content: request.Content}
	database.DB.Create(&event)

	context.JSON(http.StatusOK, gin.H{"data": event})

	// Stop measuring the time and calculate the duration
	duration := time.Since(timer).Seconds()

	// Trigger the total event processed metric
	utils.TriggerTotalEventProcessed(models.EventType(event.Type))

	// Trigger the event processing duration metric
	utils.TriggerEventProcessingDuration(models.EventType(event.Type), duration)
}

// @Tags			events
// @ID				update-event
// @Summary		Update event
// @Description	update event
// @Accept			json
// @Produce		json
// @Param			id		path	int							true	"Event ID"
// @Param			event	body	models.UpdateEventRequest	true	"Event"
// @Router			/event-tracking/events/{id} [patch]
func UpdateEvent(context *gin.Context) {
	var event models.Event
	if err := database.DB.Where("id = ?", context.Param("id")).First(&event).Error; err != nil {
		context.JSON(http.StatusBadRequest, gin.H{"error": "Record not found!"})
		return
	}

	var request models.UpdateEventRequest
	if err := context.ShouldBindJSON(&request); err != nil {
		context.JSON(http.StatusBadRequest, gin.H{"error": err.Error()})
		return
	}

	database.DB.Model(&event).Updates(request)

	context.JSON(http.StatusOK, gin.H{"data": event})
}

// @Tags			events
// @ID				delete-event
// @Summary		Delete event
// @Description	delete event
// @Produce		json
// @Param			id	path	int	true	"Event ID"
// @Router			/event-tracking/events/{id} [delete]
func DeleteEvent(context *gin.Context) {
	// Get model if exist
	var event models.Event
	if err := database.DB.Where("id = ?", context.Param("id")).First(&event).Error; err != nil {
		context.JSON(http.StatusBadRequest, gin.H{"error": "Record not found!"})
		return
	}

	database.DB.Delete(&event)

	context.JSON(http.StatusOK, gin.H{"data": true})
}

type Server struct{}

// @Tags			events
// @ID				create-event-grpc
// @Summary		Create event
// @Description	create event
func (s *Server) CreateEvent(ctx context.Context, event *proto.Event) (*proto.Event, error) {
	// Log the incoming event
	log.Printf("[gRPC] %s Received event: %v", time.Now().Format(time.RFC3339), event)

	// Set the timeout
	ctxTimeout, cancel := context.WithTimeout(context.Background(), viper.GetDuration("EVENT_TRACKING_GRPC_SERVER_TIMEOUT"))
	defer cancel()

	// Get the Kafka runtime information
	kafkaRuntime, err := kafka.EH.GetRuntimeInformation(ctxTimeout)
	if err != nil {
		return nil, err
	}

	// Start measuring the time
	timer := time.Now()

	// Convert event to byte[]
	eventBytes := []byte(event.String())

	// Define the retry logic
	err = retry.Do(
		func() error {
			// Send the event to Azure Event Hub
			return kafka.EH.Send(ctxTimeout, eventhub.NewEvent(eventBytes))
		},
		retry.Attempts(3),
		retry.Delay(1*time.Second),
		retry.OnRetry(func(n uint, err error) {
			log.Printf("[gRPC] %s Retry #%d: %s", time.Now().Format(time.RFC3339), n, err)
		}),
	)

	// Stop measuring the time and calculate the duration
	duration := time.Since(timer).Seconds()

	// Trigger the total event processed metric
	utils.TriggerTotalEventProcessed(models.EventType(event.Type))

	// Trigger the event processing duration metric
	utils.TriggerEventProcessingDuration(models.EventType(event.Type), duration)

	if err != nil {
		// Trigger the Kafka outgoing errors metric
		utils.TriggerKafkaOutgoingErrors(kafkaRuntime.Path)
		return nil, err
	} else {
		// Trigger the Kafka outgoing requests metric
		utils.TriggerKafkaOutgoingRequests(kafkaRuntime.Path)

		// Trigger the Kafka outgoing bytes metric
		utils.TriggerKafkaOutgoingBytes(kafkaRuntime.Path, float64(len(eventBytes)))
	}

	return event, nil
}
