package main

import (
	"context"
	"event-tracking/configs"
	"event-tracking/controllers"
	"event-tracking/database"
	"event-tracking/kafka"
	"event-tracking/middleware"
	"event-tracking/proto"
	"fmt"
	"log"
	"net"
	"net/http"
	"sync"
	"time"

	_ "event-tracking/docs"

	"github.com/gin-gonic/gin"
	"github.com/spf13/viper"
	swaggerFiles "github.com/swaggo/files"
	ginSwagger "github.com/swaggo/gin-swagger"
	"google.golang.org/grpc"
	"google.golang.org/grpc/reflection"
)

// @title			Event Tracking API Documentation
// @description	Event tracking documentation for the social networking app focused on sharing vibes.
// @version		1.0
// @contact.name	Rok Mokotar
// @contact.url	https://www.linkedin.com/in/mokot/
// @contact.email	rm6551@student.uni-lj.si
func main() {
	event_tracking := "event-tracking"

	// Set configuration parameters
	configs.LoadConfig()

	// Set the server mode
	serverMode := viper.GetString("EVENT_TRACKING_SERVER_MODE")
	if serverMode == "release" {
		gin.SetMode(gin.ReleaseMode)
	} else if serverMode == "test" {
		gin.SetMode(gin.TestMode)
	} else {
		gin.SetMode(gin.DebugMode)
	}

	// Create the HTTP server
	httpRouter := gin.Default()

	// Set the API prefix
	httpRouterGroup := httpRouter.Group(event_tracking)

	// Create the gRPC server
	server := controllers.Server{}
	grpcServer := grpc.NewServer()

	// Connect to database
	database.ConnectDatabase()

	// Connect to Azure Event Hub
	kafka.ConnectEventHub()

	// Apply the retry middleware
	httpRouter.Use(middleware.RetryMiddleware())

	// Apply the circuit breaker middleware
	httpRouter.Use(middleware.CircuitBreakerMiddleware())

	// Apply the Prometheus middleware
	httpRouter.Use(middleware.PrometheusMiddleware())

	// Swagger documentation endpoint
	httpRouterGroup.GET("/openapi/*any", ginSwagger.WrapHandler(swaggerFiles.Handler))

	// Prometheus metrics endpoints
	httpRouterGroup.GET("/metrics", controllers.PrometheusHandler())
	httpRouterGroup.GET("/metrics/custom", controllers.CustomPrometheusHandler())

	// Specify the HTTP health endpoints and the controllers
	httpRouterGroup.GET("/health", controllers.CheckHealth)
	httpRouterGroup.GET("/health/general", controllers.CheckHealthGeneral)
	httpRouterGroup.GET("/health/disk", controllers.CheckHealthDisk)
	httpRouterGroup.GET("/health/cpu", controllers.CheckHealthCPU)
	httpRouterGroup.GET("/health/goroutine", controllers.CheckHealthGoroutine)
	httpRouterGroup.GET("/health/database", controllers.CheckHealthDatabase)
	httpRouterGroup.GET("/health/kafka", controllers.CheckHealthKafka)
	httpRouterGroup.GET("/health/live", controllers.CheckHealthLiveness)
	httpRouterGroup.GET("/health/ready", controllers.CheckHealthReadiness)

	// Specify the HTTP events endpoints and the controllers
	httpRouterGroup.GET("/events", controllers.FindEvents)
	httpRouterGroup.GET("/events/:id", controllers.FindEvent)
	httpRouterGroup.POST("/events", controllers.CreateEvent)
	httpRouterGroup.PATCH("/events/:id", controllers.UpdateEvent)
	httpRouterGroup.DELETE("/events/:id", controllers.DeleteEvent)

	// Specify the gRPC events endpoints and the controllers
	proto.RegisterEventServiceServer(grpcServer, &server)

	// Register reflection service on gRPC server
	reflection.Register(grpcServer)

	// Create a WaitGroup and add a count of two, one for each goroutine
	var waitGroup sync.WaitGroup

	// Get the context
	ctx := context.Background()

	// Run the HTTP server in a separate goroutine
	waitGroup.Add(1)
	go func() {
		defer waitGroup.Done()
		httpAddress := fmt.Sprintf(":%d", viper.GetInt("EVENT_TRACKING_HTTP_SERVER_PORT"))
		httpServer := &http.Server{
			Addr:         httpAddress,
			Handler:      httpRouter,
			ReadTimeout:  viper.GetDuration("EVENT_TRACKING_HTTP_SERVER_TIMEOUT"),
			WriteTimeout: viper.GetDuration("EVENT_TRACKING_HTTP_SERVER_TIMEOUT"),
		}
		log.Printf("HTTP server listening on port %s", httpAddress)

		go func() {
			if err := httpServer.ListenAndServe(); err != nil && err != http.ErrServerClosed {
				log.Fatal(err)
			}
		}()

		// Wait for interrupt signal to initiate graceful shutdown
		<-ctx.Done()

		// Create a context with a timeout to allow existing requests to finish
		shutdownCtx, cancel := context.WithTimeout(context.Background(), 10*time.Second)
		defer cancel()

		if err := httpServer.Shutdown(shutdownCtx); err != nil {
			log.Printf("HTTP server shutdown error: %v", err)
		}
	}()

	// Run the gRPC server in a separate goroutine
	waitGroup.Add(1)
	go func() {
		defer waitGroup.Done()
		grpcAddress := fmt.Sprintf(":%d", viper.GetInt("EVENT_TRACKING_GRPC_SERVER_PORT"))
		log.Printf("gRPC server listening on port %s", grpcAddress)
		grpcListener, err := net.Listen("tcp", grpcAddress)
		if err != nil {
			log.Fatal(err)
		}
		if err := grpcServer.Serve(grpcListener); err != nil {
			log.Fatal(err)
		}
	}()

	// Wait for all goroutines to complete
	waitGroup.Wait()
}
