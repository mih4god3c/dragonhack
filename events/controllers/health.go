package controllers

import (
	"event-tracking/models"
	"event-tracking/utils"
	"net/http"

	"github.com/gin-gonic/gin"
)

// @Tags			health
// @ID				health-check
// @Summary		Health check
// @Description	health check
// @Produce		json
// @Router			/event-tracking/health [get]
func CheckHealth(context *gin.Context) {
	// General Health
	generalHealthStatus, generalHealthComponents := utils.CheckHealthGeneral(context)

	// Disk Health
	diskHealthStatus, diskHealthComponent := utils.CheckHealthDisk(context)

	// CPU Health
	cpuHealthStatus, cpuHealthComponent := utils.CheckHealthCPU(context)

	// Check goroutine health
	goroutineHealthStatus, goroutineHealthComponent := utils.CheckHealthGoroutine(context)

	// Check database health
	databaseHealthStatus, databaseHealthComponent := utils.CheckHealthDatabase(context)

	// Check kafka health
	kafkaHealthStatus, kafkaHealthComponent := utils.CheckHealthKafka(context)

	// Check the global health status
	globalHealthStatus := models.HealthStatusUp
	if generalHealthStatus != models.HealthStatusUp ||
		diskHealthStatus != models.HealthStatusUp ||
		cpuHealthStatus != models.HealthStatusUp ||
		goroutineHealthStatus != models.HealthStatusUp ||
		databaseHealthStatus != models.HealthStatusUp ||
		kafkaHealthStatus != models.HealthStatusUp {
		globalHealthStatus = models.HealthStatusDown
	}

	// Update the global HTTP status
	globalHTTPStatus := http.StatusOK
	if globalHealthStatus != models.HealthStatusUp {
		globalHTTPStatus = http.StatusInternalServerError
	}

	context.JSON(globalHTTPStatus, models.HealthResponse{
		Status: globalHealthStatus,
		Components: map[string]models.HealthComponent{
			"general":   generalHealthComponents,
			"disk":      diskHealthComponent,
			"cpu":       cpuHealthComponent,
			"goroutine": goroutineHealthComponent,
			"database":  databaseHealthComponent,
			"kafka":     kafkaHealthComponent,
		},
	})
}

// @Tags			health
// @ID				health-check-general
// @Summary		General health check
// @Description	general health check
// @Produce		json
// @Router			/event-tracking/health/general [get]
func CheckHealthGeneral(context *gin.Context) {
	// Check the general health
	generalHealthStatus, generalHealthComponent := utils.CheckHealthGeneral(context)

	// Update the general HTTP status
	generalHTTPStatus := http.StatusOK
	if generalHealthStatus != models.HealthStatusUp {
		generalHTTPStatus = http.StatusInternalServerError
	}

	context.JSON(generalHTTPStatus, models.HealthResponse{
		Status:     generalHealthStatus,
		Components: map[string]models.HealthComponent{"general": generalHealthComponent},
	})
}

// @Tags			health
// @ID				health-check-disk
// @Summary		Disk health check
// @Description	disk health check
// @Produce		json
// @Router			/event-tracking/health/disk [get]
func CheckHealthDisk(context *gin.Context) {
	// Check the disk health
	diskHealthStatus, diskHealthComponent := utils.CheckHealthDisk(context)

	// Update the disk HTTP status
	diskHTTPStatus := http.StatusOK
	if diskHealthStatus != models.HealthStatusUp {
		diskHTTPStatus = http.StatusInternalServerError
	}

	context.JSON(diskHTTPStatus, models.HealthResponse{
		Status:     diskHealthStatus,
		Components: map[string]models.HealthComponent{"disk": diskHealthComponent},
	})
}

// @Tags			health
// @ID				health-check-cpu
// @Summary		CPU health check
// @Description	cpu health check
// @Produce		json
// @Router			/event-tracking/health/cpu [get]
func CheckHealthCPU(context *gin.Context) {
	// Check the CPU health
	cpuHealthStatus, cpuHealthComponent := utils.CheckHealthCPU(context)

	// Update the CPU HTTP status
	cpuHTTPStatus := http.StatusOK
	if cpuHealthStatus != models.HealthStatusUp {
		cpuHTTPStatus = http.StatusInternalServerError
	}

	context.JSON(cpuHTTPStatus, models.HealthResponse{
		Status:     cpuHealthStatus,
		Components: map[string]models.HealthComponent{"cpu": cpuHealthComponent},
	})
}

// @Tags			health
// @ID				health-check-goroutine
// @Summary		Goroutine health check
// @Description	goroutine health check
// @Produce		json
// @Router			/event-tracking/health/goroutine [get]
func CheckHealthGoroutine(context *gin.Context) {
	// Check the goroutine health
	goroutineHealthStatus, goroutineHealthComponent := utils.CheckHealthGoroutine(context)

	// Update the goroutine HTTP status
	goroutineHTTPStatus := http.StatusOK
	if goroutineHealthStatus != models.HealthStatusUp {
		goroutineHTTPStatus = http.StatusInternalServerError
	}

	context.JSON(goroutineHTTPStatus, models.HealthResponse{
		Status:     goroutineHealthStatus,
		Components: map[string]models.HealthComponent{"goroutine": goroutineHealthComponent},
	})
}

// @Tags			health
// @ID				health-check-database
// @Summary		Database health check
// @Description	database health check
// @Produce		json
// @Router			/event-tracking/health/database [get]
func CheckHealthDatabase(context *gin.Context) {
	// Check the database health
	databaseHealthStatus, databaseHealthComponent := utils.CheckHealthDatabase(context)

	// Update the database HTTP status
	databaseHTTPStatus := http.StatusOK
	if databaseHealthStatus != models.HealthStatusUp {
		databaseHTTPStatus = http.StatusInternalServerError
	}

	context.JSON(databaseHTTPStatus, models.HealthResponse{
		Status:     databaseHealthStatus,
		Components: map[string]models.HealthComponent{"database": databaseHealthComponent},
	})
}

// @Tags			health
// @ID				health-check-kafka
// @Summary		Kafka health check
// @Description	kafka health check
// @Produce		json
// @Router			/event-tracking/health/kafka [get]
func CheckHealthKafka(context *gin.Context) {
	// Check the kafka health
	kafkaHealthStatus, kafkaHealthComponent := utils.CheckHealthKafka(context)

	// Update the kafka HTTP status
	kafkaHTTPStatus := http.StatusOK
	if kafkaHealthStatus != models.HealthStatusUp {
		kafkaHTTPStatus = http.StatusInternalServerError
	}

	context.JSON(kafkaHTTPStatus, models.HealthResponse{
		Status:     kafkaHealthStatus,
		Components: map[string]models.HealthComponent{"kafka": kafkaHealthComponent},
	})
}

// @Tags			health
// @ID				health-check-liveness
// @Summary		Liveness health check
// @Description	liveness health check
// @Produce		json
// @Router			/event-tracking/health/liveness [get]
func CheckHealthLiveness(context *gin.Context) {
	CheckHealthGeneral(context)
}

// @Tags			health
// @ID				health-check-readiness
// @Summary		Readiness health check
// @Description	readiness health check
// @Produce		json
// @Router			/event-tracking/health/readiness [get]
func CheckHealthReadiness(context *gin.Context) {
	CheckHealth(context)
}
