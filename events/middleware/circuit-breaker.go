package middleware

import (
	"fmt"
	"net/http"

	"github.com/gin-gonic/gin"
	"github.com/sony/gobreaker"
)

func CircuitBreakerMiddleware() gin.HandlerFunc {
	return func(context *gin.Context) {
		// Define circuit breaker settings
		settings := gobreaker.Settings{
			Name:        "vibe-social-event-tracking-circuit-breaker",
			MaxRequests: 3,  // Maximum number of requests before tripping the circuit
			Interval:    5,  // Reset the circuit after this duration (seconds)
			Timeout:     10, // Timeout for each request (seconds)
			OnStateChange: func(name string, from gobreaker.State, to gobreaker.State) {
				fmt.Printf("Circuit breaker state changed for %s: %s -> %s\n", name, from, to)
			},
		}

		// Create a circuit breaker instance
		circuitBreaker := gobreaker.NewCircuitBreaker(settings)

		// Execute the circuit breaker
		_, err := circuitBreaker.Execute(func() (interface{}, error) {
			// Continue with the next middleware or route handler
			context.Next()
			return nil, nil
		})

		if err != nil {
			// Handle circuit breaker error
			context.JSON(http.StatusInternalServerError, gin.H{"error": "Circuit breaker is open"})
			return
		}

		// Continue processing if no circuit breaker error occurred
	}
}
