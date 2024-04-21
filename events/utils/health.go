package utils

import (
	"event-tracking/database"
	"event-tracking/kafka"
	"event-tracking/models"
	"fmt"
	"runtime"

	"github.com/gin-gonic/gin"
	"github.com/shirou/gopsutil/cpu"
	"github.com/shirou/gopsutil/disk"
)

func CheckHealthGeneral(context *gin.Context) (models.HealthStatus, models.HealthComponent) {
	return models.HealthStatusUp, models.HealthComponent{
		Status: models.HealthStatusUp,
		Details: map[string]interface{}{
			"maintainer":  "Rok Mokotar",
			"contact":     "https://www.linkedin.com/in/mokot/",
			"version":     "1.0.0",
			"description": "Event tracking service for the social networking app focused on sharing vibes.",
		},
	}
}

func CheckHealthDisk(context *gin.Context) (models.HealthStatus, models.HealthComponent) {
	// Check dist usage
	diskUsageHealthStatus := models.HealthStatusUp
	diskUsageHealthComponent := models.HealthComponent{
		Status: models.HealthStatusUp,
	}
	diskUsage, err := disk.Usage("/")
	if err != nil {
		diskUsageHealthStatus = models.HealthStatusDown
		diskUsageHealthComponent.Status = models.HealthStatusDown
		diskUsageHealthComponent.Details = err.Error()
	}
	diskUsageHealthComponent.Details = map[string]interface{}{
		"total":       diskUsage.Total,
		"free":        diskUsage.Free,
		"used":        diskUsage.Used,
		"usedPercent": diskUsage.UsedPercent,
	}

	// Check if the disk usage is above the threshold
	diskUsageThreshold := 90.0
	diskUsageThresholdStatus := models.HealthStatusUp
	diskUsageThresholdComponent := models.HealthComponent{
		Status: models.HealthStatusUp,
	}
	if diskUsage.UsedPercent > diskUsageThreshold {
		diskUsageThresholdStatus = models.HealthStatusDown
		diskUsageThresholdComponent.Status = models.HealthStatusDown
		diskUsageThresholdComponent.Details = "Disk usage is above the threshold of " + fmt.Sprintf("%f", diskUsageThreshold) + "%."
	}

	// Check IO counters
	diskIOHealthStatus := models.HealthStatusUp
	diskIOHealthComponent := models.HealthComponent{
		Status: models.HealthStatusUp,
	}
	diskIOCounters, err := disk.IOCounters()
	if err != nil {
		diskIOHealthStatus = models.HealthStatusDown
		diskIOHealthComponent.Status = models.HealthStatusDown
		diskIOHealthComponent.Details = err.Error()
	}
	diskIOHealthComponent.Details = diskIOCounters

	// Check the disk health status
	diskHealthStatus := models.HealthStatusUp
	if diskUsageHealthStatus == models.HealthStatusDown ||
		diskUsageThresholdStatus == models.HealthStatusDown ||
		diskIOHealthStatus == models.HealthStatusDown {
		diskHealthStatus = models.HealthStatusDown
	}

	return diskHealthStatus, models.HealthComponent{
		Status: diskHealthStatus,
		Components: map[string]models.HealthComponent{
			"disk-usage":           diskUsageHealthComponent,
			"disk-usage-threshold": diskUsageThresholdComponent,
			"disk-io":              diskIOHealthComponent,
		},
	}
}

func CheckHealthCPU(context *gin.Context) (models.HealthStatus, models.HealthComponent) {
	// Check CPU usage
	cpuUsageHealthStatus := models.HealthStatusUp
	cpuUsageHealthComponent := models.HealthComponent{
		Status: models.HealthStatusUp,
	}
	cpuUsage, err := cpu.Percent(0, false)
	if err != nil {
		cpuUsageHealthStatus = models.HealthStatusDown
		cpuUsageHealthComponent.Status = models.HealthStatusDown
		cpuUsageHealthComponent.Details = err.Error()
	}
	cpuUsageHealthComponent.Details = map[string]interface{}{
		"usage": cpuUsage,
	}

	// Check if the CPU usage is above the threshold
	cpuUsageThreshold := 90.0
	cpuUsageThresholdStatus := models.HealthStatusUp
	cpuUsageThresholdComponent := models.HealthComponent{
		Status:  models.HealthStatusUp,
		Details: []interface{}{},
	}
	for _, usage := range cpuUsage {
		if usage > cpuUsageThreshold {
			cpuUsageThresholdStatus = models.HealthStatusDown
			cpuUsageThresholdComponent.Status = models.HealthStatusDown
			cpuUsageThresholdComponent.Details = "CPU usage is above the threshold of " + fmt.Sprintf("%f", cpuUsageThreshold) + "%."
		}
	}

	// Check CPU count
	cpuCountHealthStatus := models.HealthStatusUp
	cpuCountHealthComponent := models.HealthComponent{
		Status: models.HealthStatusUp,
	}
	cpuCount, err := cpu.Counts(false)
	if err != nil {
		cpuCountHealthStatus = models.HealthStatusDown
		cpuCountHealthComponent.Status = models.HealthStatusDown
		cpuCountHealthComponent.Details = err.Error()
	}
	cpuCountHealthComponent.Details = map[string]interface{}{
		"count": cpuCount,
	}

	// Check the CPU health status
	cpuHealthStatus := models.HealthStatusUp
	if cpuUsageHealthStatus == models.HealthStatusDown ||
		cpuUsageThresholdStatus == models.HealthStatusDown ||
		cpuCountHealthStatus == models.HealthStatusDown {
		cpuHealthStatus = models.HealthStatusDown
	}

	return cpuHealthStatus, models.HealthComponent{
		Status: cpuHealthStatus,
		Components: map[string]models.HealthComponent{
			"cpu-usage":           cpuUsageHealthComponent,
			"cpu-usage-threshold": cpuUsageThresholdComponent,
			"cpu-count":           cpuCountHealthComponent,
		},
	}
}

func CheckHealthGoroutine(context *gin.Context) (models.HealthStatus, models.HealthComponent) {
	// Check the goroutine count
	goroutineCountHealthStatus := models.HealthStatusUp
	goroutineCountHealthComponent := models.HealthComponent{
		Status: models.HealthStatusUp,
	}
	goroutineCount := runtime.NumGoroutine()
	goroutineCountHealthComponent.Details = map[string]interface{}{
		"count": goroutineCount,
	}

	// Check the goroutine health status
	goroutineHealthStatus := models.HealthStatusUp
	if goroutineCountHealthStatus == models.HealthStatusDown {
		goroutineHealthStatus = models.HealthStatusDown
	}

	return goroutineHealthStatus, models.HealthComponent{
		Status: goroutineHealthStatus,
		Components: map[string]models.HealthComponent{
			"goroutine-count": goroutineCountHealthComponent,
		},
	}
}

func CheckHealthDatabase(context *gin.Context) (models.HealthStatus, models.HealthComponent) {
	// Check if the database connection is open
	databaseConnectionHealthStatus := models.HealthStatusUp
	databaseConnectionHealthComponent := models.HealthComponent{
		Status: models.HealthStatusUp,
	}
	db, err := database.DB.DB()
	if err != nil {
		databaseConnectionHealthStatus = models.HealthStatusDown
		databaseConnectionHealthComponent.Status = models.HealthStatusDown
		databaseConnectionHealthComponent.Details = err.Error()
	}

	// Check if the connection on the database is alive
	databasePingHealthStatus := models.HealthStatusUp
	databasePingHealthComponent := models.HealthComponent{
		Status: models.HealthStatusUp,
	}
	err = db.Ping()
	if err != nil {
		databasePingHealthStatus = models.HealthStatusDown
		databasePingHealthComponent.Status = models.HealthStatusDown
		databasePingHealthComponent.Details = err.Error()
	}

	// Check if the events table exists
	databaseEventsTableHealthStatus := models.HealthStatusUp
	databaseEventsTableHealthComponent := models.HealthComponent{
		Status: models.HealthStatusUp,
	}
	hasEventsTable := database.DB.Migrator().HasTable("events")
	if !hasEventsTable {
		databaseEventsTableHealthStatus = models.HealthStatusDown
		databaseEventsTableHealthComponent.Status = models.HealthStatusDown
		databaseEventsTableHealthComponent.Details = "The events table does not exist."
	}

	// Check if the events table is empty
	databaseEventsTableEmptyHealthStatus := models.HealthStatusUp
	databaseEventsTableEmptyHealthComponent := models.HealthComponent{
		Status: models.HealthStatusUp,
	}
	var count int64
	database.DB.Table("events").Count(&count)
	if count == 0 {
		databaseEventsTableEmptyHealthStatus = models.HealthStatusDown
		databaseEventsTableEmptyHealthComponent.Status = models.HealthStatusDown
		databaseEventsTableEmptyHealthComponent.Details = "The events table is empty."
	}

	// Check the database health status
	databaseHealthStatus := models.HealthStatusUp
	if databaseConnectionHealthStatus == models.HealthStatusDown ||
		databasePingHealthStatus == models.HealthStatusDown ||
		databaseEventsTableHealthStatus == models.HealthStatusDown ||
		databaseEventsTableEmptyHealthStatus == models.HealthStatusDown {
		databaseHealthStatus = models.HealthStatusDown
	}

	return databaseHealthStatus, models.HealthComponent{
		Status: databaseHealthStatus,
		Components: map[string]models.HealthComponent{
			"database-connection":         databaseConnectionHealthComponent,
			"database-ping":               databasePingHealthComponent,
			"database-events-table":       databaseEventsTableHealthComponent,
			"database-events-table-empty": databaseEventsTableEmptyHealthComponent,
		},
	}

}

func CheckHealthKafka(context *gin.Context) (models.HealthStatus, models.HealthComponent) {
	// Check the Kafka runtime health
	kafkaRuntimeHealthStatus := models.HealthStatusUp
	kafkaRuntimeHealthComponent := models.HealthComponent{
		Status: models.HealthStatusUp,
	}
	kafkaRuntime, err := kafka.EH.GetRuntimeInformation(context.Request.Context())
	if err != nil {
		kafkaRuntimeHealthStatus = models.HealthStatusDown
		kafkaRuntimeHealthComponent.Status = models.HealthStatusDown
		kafkaRuntimeHealthComponent.Details = err.Error()
	}
	kafkaRuntimeHealthComponent.Details = kafkaRuntime

	// Check the Kafka partition health
	kafkaPartitionHealthStatus := models.HealthStatusUp
	kafkaPartitionHealthComponent := models.HealthComponent{
		Status:  models.HealthStatusUp,
		Details: []interface{}{},
	}
	// Loop over partitions and check their health
	for _, partition := range kafkaRuntime.PartitionIDs {
		kafkaPartition, err := kafka.EH.GetPartitionInformation(context.Request.Context(), partition)
		if err != nil {
			kafkaPartitionHealthStatus = models.HealthStatusDown
			kafkaPartitionHealthComponent.Status = models.HealthStatusDown
			kafkaPartitionHealthComponent.Details = err.Error()
		}
		kafkaPartitionHealthComponent.Details = append(kafkaPartitionHealthComponent.Details.([]interface{}), kafkaPartition)
	}

	// Check the Kafka health status
	kafkaHealthStatus := models.HealthStatusUp
	if kafkaRuntimeHealthStatus == models.HealthStatusDown ||
		kafkaPartitionHealthStatus == models.HealthStatusDown {
		kafkaHealthStatus = models.HealthStatusDown
	}

	return kafkaHealthStatus, models.HealthComponent{
		Status: kafkaHealthStatus,
		Components: map[string]models.HealthComponent{
			"kafka-runtime":   kafkaRuntimeHealthComponent,
			"kafka-partition": kafkaPartitionHealthComponent,
		},
	}
}
