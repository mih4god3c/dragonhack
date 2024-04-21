package utils

import (
	"event-tracking/metrics"
	"event-tracking/models"
)

func TriggerHttpRequestsTotal(method string, path string, status string) {
	// Increment HTTP requests total
	metrics.TotalHttpRequests.WithLabelValues(method, path, status).Inc()
}

func Trigger2xxHttpRequestsTotal(method string, path string) {
	// Increment 2XX HTTP requests total
	metrics.Total2xxHttpRequests.WithLabelValues(method, path).Inc()
}

func Trigger3xxHttpRequestsTotal(method string, path string) {
	// Increment 3XX HTTP requests total
	metrics.Total3xxHttpRequests.WithLabelValues(method, path).Inc()
}

func Trigger4xxHttpRequestsTotal(method string, path string) {
	// Increment 4XX HTTP requests total
	metrics.Total4xxHttpRequests.WithLabelValues(method, path).Inc()
}

func Trigger5xxHttpRequestsTotal(method string, path string) {
	// Increment 5XX HTTP requests total
	metrics.Total5xxHttpRequests.WithLabelValues(method, path).Inc()
}

func TriggerMemoryUsageBytes(bytes float64) {
	// Set memory usage in bytes
	metrics.MemoryUsageBytes.Set(bytes)
}

func TriggerMemoryUsagePercentage(percentage float64) {
	// Set memory usage in percentage
	metrics.MemoryUsagePercentage.Set(percentage)
}

func TriggerCPUUsagePercentage(percentage float64) {
	// Set CPU usage in percentage
	metrics.CPUUsagePercentage.Set(percentage)
}

func TriggerTotalGoroutines(goroutines float64) {
	// Set total goroutines
	metrics.TotalGoroutines.Set(goroutines)
}

func TriggerTotalThreads(threads float64) {
	// Set total threads
	metrics.TotalThreads.Set(threads)
}

func TriggerTotalEventProcessed(eventType models.EventType) {
	// Increment total event processed
	metrics.TotalEventProcessed.WithLabelValues(string(eventType)).Inc()
}

func TriggerEventProcessingDuration(eventType models.EventType, duration float64) {
	// Observe event processing duration
	metrics.EventProcessingDuration.WithLabelValues(string(eventType)).Observe(duration)
}

func TriggerDatabaseConnectionPool(pool float64) {
	// Set database connection pool
	metrics.DatabaseConnectionPool.Set(pool)
}

func TriggerDatabaseQueryDuration(query_type string, query string, duration float64) {
	// Observe database query duration
	metrics.DatabaseQueryDuration.WithLabelValues(query_type, query).Observe(duration)
}

func TriggerDatabaseErrors(query string) {
	// Increment database errors
	metrics.DatabaseErrors.WithLabelValues(query).Inc()
}

func TriggerKafkaOutgoingRequests(topic string) {
	// Increment Kafka outgoing requests
	metrics.KafkaOutgoingRequests.WithLabelValues(topic).Inc()
}

func TriggerKafkaOutgoingBytes(topic string, bytes float64) {
	// Set Kafka outgoing bytes
	metrics.KafkaOutgoingBytes.WithLabelValues(topic).Set(bytes)
}

func TriggerKafkaOutgoingErrors(topic string) {
	// Increment Kafka outgoing errors
	metrics.KafkaOutgoingErrors.WithLabelValues(topic).Inc()
}

func TriggerLatency(method string, path string, status string, latency float64) {
	// Observe latency
	metrics.Latency.WithLabelValues(method, path, status).Observe(latency)
}
