package metrics

import "github.com/prometheus/client_golang/prometheus"

// Define Prometheus custom metrics
var (
	// Total HTTP requests
	TotalHttpRequests = prometheus.NewCounterVec(
		prometheus.CounterOpts{
			Name: "http_requests_total",
			Help: "Total number of HTTP requests",
		},
		[]string{"method", "path", "status"},
	)

	// Total 2XX HTTP requests
	Total2xxHttpRequests = prometheus.NewCounterVec(
		prometheus.CounterOpts{
			Name: "http_requests_2xx_total",
			Help: "Total number of 2XX HTTP requests",
		},
		[]string{"method", "path"},
	)

	// Total 3XX HTTP requests
	Total3xxHttpRequests = prometheus.NewCounterVec(
		prometheus.CounterOpts{
			Name: "http_requests_3xx_total",
			Help: "Total number of 3XX HTTP requests",
		},
		[]string{"method", "path"},
	)

	// Total 4XX HTTP requests
	Total4xxHttpRequests = prometheus.NewCounterVec(
		prometheus.CounterOpts{
			Name: "http_requests_4xx_total",
			Help: "Total number of 4XX HTTP requests",
		},
		[]string{"method", "path"},
	)

	// Total 5XX HTTP requests
	Total5xxHttpRequests = prometheus.NewCounterVec(
		prometheus.CounterOpts{
			Name: "http_requests_5xx_total",
			Help: "Total number of 5XX HTTP requests",
		},
		[]string{"method", "path"},
	)

	// Memory usage in bytes
	MemoryUsageBytes = prometheus.NewGauge(
		prometheus.GaugeOpts{
			Name: "memory_usage_bytes",
			Help: "Memory usage in bytes",
		},
	)

	// Memory usage in percentage
	MemoryUsagePercentage = prometheus.NewGauge(
		prometheus.GaugeOpts{
			Name: "memory_usage_percentage",
			Help: "Memory usage in percentage",
		},
	)

	// CPU usage in percentage
	CPUUsagePercentage = prometheus.NewGauge(
		prometheus.GaugeOpts{
			Name: "cpu_usage_percentage",
			Help: "CPU usage in percentage",
		},
	)

	// Total goroutines
	TotalGoroutines = prometheus.NewGauge(
		prometheus.GaugeOpts{
			Name: "goroutines_total",
			Help: "Total number of goroutines",
		},
	)

	// Total threads
	TotalThreads = prometheus.NewGauge(
		prometheus.GaugeOpts{
			Name: "threads_total",
			Help: "Total number of threads",
		},
	)

	// Total event processed
	TotalEventProcessed = prometheus.NewCounterVec(
		prometheus.CounterOpts{
			Name: "event_processed_total",
			Help: "Total number of events processed",
		},
		[]string{"event_type"},
	)

	// Event processing duration
	EventProcessingDuration = prometheus.NewHistogramVec(
		prometheus.HistogramOpts{
			Name:    "event_processing_duration",
			Help:    "Event processing duration",
			Buckets: prometheus.DefBuckets,
		},
		[]string{"event_type"},
	)

	// Database connection pool
	DatabaseConnectionPool = prometheus.NewGauge(
		prometheus.GaugeOpts{
			Name: "database_connection_pool",
			Help: "Database connection pool",
		},
	)

	// Database query duration
	DatabaseQueryDuration = prometheus.NewHistogramVec(
		prometheus.HistogramOpts{
			Name:    "database_query_duration",
			Help:    "Database query duration",
			Buckets: prometheus.DefBuckets,
		},
		[]string{"type", "query"},
	)

	// Database errors
	DatabaseErrors = prometheus.NewCounterVec(
		prometheus.CounterOpts{
			Name: "database_errors",
			Help: "Database errors",
		},
		[]string{"error"},
	)

	// Kafka outgoing requests
	KafkaOutgoingRequests = prometheus.NewCounterVec(
		prometheus.CounterOpts{
			Name: "kafka_outgoing_requests",
			Help: "Kafka outgoing requests",
		},
		[]string{"topic"},
	)

	// Kafka outgoing bytes
	KafkaOutgoingBytes = prometheus.NewGaugeVec(
		prometheus.GaugeOpts{
			Name: "kafka_outgoing_bytes",
			Help: "Kafka outgoing bytes",
		},
		[]string{"topic"},
	)

	// Kafka outgoing errors
	KafkaOutgoingErrors = prometheus.NewCounterVec(
		prometheus.CounterOpts{
			Name: "kafka_outgoing_errors",
			Help: "Kafka outgoing errors",
		},
		[]string{"topic"},
	)

	// Latency of HTTP requests
	Latency = prometheus.NewHistogramVec(
		prometheus.HistogramOpts{
			Name:    "latency",
			Help:    "Latency of HTTP requests",
			Buckets: prometheus.DefBuckets,
		},
		[]string{"method", "path", "status"},
	)
)
