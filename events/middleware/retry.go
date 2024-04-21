package middleware

import (
	"net/http"
	"time"

	"github.com/avast/retry-go"
	"github.com/gin-gonic/gin"
)

func RetryMiddleware() gin.HandlerFunc {
	return func(context *gin.Context) {
		// Define the retry logic
		err := retry.Do(
			func() error {
				// Continue with the next middleware or route handler
				context.Next()
				return nil
			},
			retry.Attempts(3),
			retry.Delay(1*time.Second),
			retry.DelayType(retry.FixedDelay),
		)

		if err != nil {
			// Handle retriable error
			context.JSON(http.StatusInternalServerError, gin.H{"error": "Retriable error occurred"})
			return
		}

		// Continue processing if no retriable error occurred
	}
}
