package middleware

import (
	"event-tracking/database"
	"event-tracking/utils"
	"runtime"
	"strconv"
	"time"

	"github.com/gin-gonic/gin"
)

func PrometheusMiddleware() gin.HandlerFunc {
	return func(context *gin.Context) {
		// Start timer
		timer := time.Now()

		// Get memory stats
		memoryStats := new(runtime.MemStats)
		runtime.ReadMemStats(memoryStats)

		// Get database stats
		db, _ := database.DB.DB()
		databaseStats := db.Stats()

		// Trigger HTTP requests total
		utils.TriggerHttpRequestsTotal(context.Request.Method, context.Request.URL.Path, strconv.Itoa(context.Writer.Status()))

		// Trigger 2XX HTTP requests total
		if context.Writer.Status() >= 200 && context.Writer.Status() < 300 {
			utils.Trigger2xxHttpRequestsTotal(context.Request.Method, context.Request.URL.Path)
		}

		// Trigger 3XX HTTP requests total
		if context.Writer.Status() >= 300 && context.Writer.Status() < 400 {
			utils.Trigger3xxHttpRequestsTotal(context.Request.Method, context.Request.URL.Path)
		}

		// Trigger 4XX HTTP requests total
		if context.Writer.Status() >= 400 && context.Writer.Status() < 500 {
			utils.Trigger4xxHttpRequestsTotal(context.Request.Method, context.Request.URL.Path)
		}

		// Trigger 5XX HTTP requests total
		if context.Writer.Status() >= 500 && context.Writer.Status() < 600 {
			utils.Trigger5xxHttpRequestsTotal(context.Request.Method, context.Request.URL.Path)
		}

		// Trigger memory usage in bytes
		utils.TriggerMemoryUsageBytes(float64(memoryStats.Alloc))

		// Trigger memory usage in percentage
		utils.TriggerMemoryUsagePercentage(float64(memoryStats.Alloc) / float64(memoryStats.Sys) * 100)

		// Trigger CPU usage in percentage
		utils.TriggerCPUUsagePercentage(float64(runtime.NumCPU()) / float64(runtime.NumCPU()) * 100)

		// Trigger total goroutines
		utils.TriggerTotalGoroutines(float64(runtime.NumGoroutine()))

		// Trigger total threads
		utils.TriggerTotalThreads(float64(runtime.NumCPU()))

		// Trigger database connection pool
		utils.TriggerDatabaseConnectionPool(float64(databaseStats.OpenConnections))

		// Continue with the next middleware or route handler
		context.Next()

		// Measure latency
		latency := time.Since(timer).Seconds()

		// Trigger latency
		utils.TriggerLatency(context.Request.Method, context.Request.URL.Path, strconv.Itoa(context.Writer.Status()), latency)
	}
}
