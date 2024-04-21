package controllers

import (
	"event-tracking/metrics"

	"github.com/gin-gonic/gin"
	"github.com/prometheus/client_golang/prometheus"
	"github.com/prometheus/client_golang/prometheus/promhttp"
)

// Define Prometheus custom registry
var (
	customRegistry = prometheus.NewRegistry()
)

func init() {
	// Register custom metrics with Prometheus
	prometheus.MustRegister(metrics.TotalHttpRequests)
	prometheus.MustRegister(metrics.Total2xxHttpRequests)
	prometheus.MustRegister(metrics.Total3xxHttpRequests)
	prometheus.MustRegister(metrics.Total4xxHttpRequests)
	prometheus.MustRegister(metrics.Total5xxHttpRequests)
	prometheus.MustRegister(metrics.MemoryUsageBytes)
	prometheus.MustRegister(metrics.MemoryUsagePercentage)
	prometheus.MustRegister(metrics.CPUUsagePercentage)
	prometheus.MustRegister(metrics.TotalGoroutines)
	prometheus.MustRegister(metrics.TotalThreads)
	prometheus.MustRegister(metrics.TotalEventProcessed)
	prometheus.MustRegister(metrics.EventProcessingDuration)
	prometheus.MustRegister(metrics.DatabaseConnectionPool)
	prometheus.MustRegister(metrics.DatabaseQueryDuration)
	prometheus.MustRegister(metrics.DatabaseErrors)
	prometheus.MustRegister(metrics.KafkaOutgoingRequests)
	prometheus.MustRegister(metrics.KafkaOutgoingBytes)
	prometheus.MustRegister(metrics.KafkaOutgoingErrors)
	prometheus.MustRegister(metrics.Latency)

	// Register custom metrics with custom registry
	customRegistry.MustRegister(metrics.TotalHttpRequests)
	customRegistry.MustRegister(metrics.Total2xxHttpRequests)
	customRegistry.MustRegister(metrics.Total3xxHttpRequests)
	customRegistry.MustRegister(metrics.Total4xxHttpRequests)
	customRegistry.MustRegister(metrics.Total5xxHttpRequests)
	customRegistry.MustRegister(metrics.MemoryUsageBytes)
	customRegistry.MustRegister(metrics.MemoryUsagePercentage)
	customRegistry.MustRegister(metrics.CPUUsagePercentage)
	customRegistry.MustRegister(metrics.TotalGoroutines)
	customRegistry.MustRegister(metrics.TotalThreads)
	customRegistry.MustRegister(metrics.TotalEventProcessed)
	customRegistry.MustRegister(metrics.EventProcessingDuration)
	customRegistry.MustRegister(metrics.DatabaseConnectionPool)
	customRegistry.MustRegister(metrics.DatabaseQueryDuration)
	customRegistry.MustRegister(metrics.DatabaseErrors)
	customRegistry.MustRegister(metrics.KafkaOutgoingRequests)
	customRegistry.MustRegister(metrics.KafkaOutgoingBytes)
	customRegistry.MustRegister(metrics.KafkaOutgoingErrors)
	customRegistry.MustRegister(metrics.Latency)
}

// @Tags			metrics
// @ID				prometheus-metrics
// @Summary		Prometheus metrics
// @Description	Prometheus metrics
// @Produce		json
// @Router			/event-tracking/metrics [get]
func PrometheusHandler() gin.HandlerFunc {
	handler := promhttp.Handler()

	return func(context *gin.Context) {
		handler.ServeHTTP(context.Writer, context.Request)
	}
}

// @Tags			metrics
// @ID				custom-prometheus-metrics
// @Summary		Custom Prometheus metrics
// @Description	Custom Prometheus metrics
// @Produce		json
// @Router			/event-tracking/custom-metrics [get]
func CustomPrometheusHandler() gin.HandlerFunc {
	return func(context *gin.Context) {
		promhttp.HandlerFor(customRegistry, promhttp.HandlerOpts{}).ServeHTTP(context.Writer, context.Request)
	}
}
