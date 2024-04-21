package database

import (
	"context"
	"event-tracking/metrics"
	"time"

	"github.com/spf13/viper"
	"gorm.io/driver/postgres"
	"gorm.io/gorm"
)

var DB *gorm.DB

func ConnectDatabase() {
	dsn := viper.GetString("SUPABASE_DSN")
	database, err := gorm.Open(postgres.Open(dsn), &gorm.Config{})
	if err != nil {
		panic("Failed to connect to database!")
	}

	DB = database

	// Register callback for metrics
	DB.Callback().Query().Before("gorm:before_query").Register("log:before_query", func(database *gorm.DB) {
		database.WithContext(context.WithValue(database.Statement.Context, "prometheus_query_start_time", time.Now()))
	})
	DB.Callback().Query().After("gorm:after_query").Register("log:after_query", func(database *gorm.DB) {
		queryStartTime, _ := database.Statement.Context.Value("prometheus_query_start_time").(time.Time)
		duration := time.Since(queryStartTime).Seconds()
		metrics.DatabaseQueryDuration.WithLabelValues("query", database.Statement.SQL.String()).Observe(duration)
	})
	DB.Callback().Create().Before("gorm:before_create").Register("log:before_create", func(database *gorm.DB) {
		database.WithContext(context.WithValue(database.Statement.Context, "prometheus_create_start_time", time.Now()))
	})
	DB.Callback().Create().After("gorm:after_create").Register("log:after_create", func(database *gorm.DB) {
		queryStartTime, _ := database.Statement.Context.Value("prometheus_create_start_time").(time.Time)
		duration := time.Since(queryStartTime).Seconds()
		metrics.DatabaseQueryDuration.WithLabelValues("create", database.Statement.SQL.String()).Observe(duration)
	})
	DB.Callback().Update().Before("gorm:before_update").Register("log:before_update", func(database *gorm.DB) {
		database.WithContext(context.WithValue(database.Statement.Context, "prometheus_update_start_time", time.Now()))
	})
	DB.Callback().Update().After("gorm:after_update").Register("log:after_update", func(database *gorm.DB) {
		queryStartTime, _ := database.Statement.Context.Value("prometheus_update_start_time").(time.Time)
		duration := time.Since(queryStartTime).Seconds()
		metrics.DatabaseQueryDuration.WithLabelValues("update", database.Statement.SQL.String()).Observe(duration)
	})
	DB.Callback().Delete().Before("gorm:before_delete").Register("log:before_delete", func(database *gorm.DB) {
		database.WithContext(context.WithValue(database.Statement.Context, "prometheus_delete_start_time", time.Now()))
	})
	DB.Callback().Delete().After("gorm:after_delete").Register("log:after_delete", func(database *gorm.DB) {
		queryStartTime, _ := database.Statement.Context.Value("prometheus_delete_start_time").(time.Time)
		duration := time.Since(queryStartTime).Seconds()
		metrics.DatabaseQueryDuration.WithLabelValues("delete", database.Statement.SQL.String()).Observe(duration)
	})
	DB.Callback().Raw().After("gorm:error").Register("log:error", func(database *gorm.DB) {
		if database.Error != nil {
			metrics.DatabaseErrors.WithLabelValues(database.Error.Error()).Inc()
		}
	})
}
