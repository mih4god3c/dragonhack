// Package docs Code generated by swaggo/swag. DO NOT EDIT
package docs

import "github.com/swaggo/swag"

const docTemplate = `{
    "schemes": {{ marshal .Schemes }},
    "swagger": "2.0",
    "info": {
        "description": "{{escape .Description}}",
        "title": "{{.Title}}",
        "contact": {
            "name": "Rok Mokotar",
            "url": "https://www.linkedin.com/in/mokot/",
            "email": "rm6551@student.uni-lj.si"
        },
        "version": "{{.Version}}"
    },
    "host": "{{.Host}}",
    "basePath": "{{.BasePath}}",
    "paths": {
        "/event-tracking/custom-metrics": {
            "get": {
                "description": "Custom Prometheus metrics",
                "produces": [
                    "application/json"
                ],
                "tags": [
                    "metrics"
                ],
                "summary": "Custom Prometheus metrics",
                "operationId": "custom-prometheus-metrics",
                "responses": {}
            }
        },
        "/event-tracking/events": {
            "get": {
                "description": "get events",
                "produces": [
                    "application/json"
                ],
                "tags": [
                    "events"
                ],
                "summary": "List events",
                "operationId": "get-events",
                "responses": {}
            },
            "post": {
                "description": "create event",
                "consumes": [
                    "application/json"
                ],
                "produces": [
                    "application/json"
                ],
                "tags": [
                    "events"
                ],
                "summary": "Create event",
                "operationId": "create-event",
                "parameters": [
                    {
                        "description": "Event",
                        "name": "event",
                        "in": "body",
                        "required": true,
                        "schema": {
                            "$ref": "#/definitions/models.CreateEventRequest"
                        }
                    }
                ],
                "responses": {}
            }
        },
        "/event-tracking/events/{id}": {
            "get": {
                "description": "get event",
                "produces": [
                    "application/json"
                ],
                "tags": [
                    "events"
                ],
                "summary": "Get event",
                "operationId": "get-event",
                "parameters": [
                    {
                        "type": "integer",
                        "description": "Event ID",
                        "name": "id",
                        "in": "path",
                        "required": true
                    }
                ],
                "responses": {}
            },
            "delete": {
                "description": "delete event",
                "produces": [
                    "application/json"
                ],
                "tags": [
                    "events"
                ],
                "summary": "Delete event",
                "operationId": "delete-event",
                "parameters": [
                    {
                        "type": "integer",
                        "description": "Event ID",
                        "name": "id",
                        "in": "path",
                        "required": true
                    }
                ],
                "responses": {}
            },
            "patch": {
                "description": "update event",
                "consumes": [
                    "application/json"
                ],
                "produces": [
                    "application/json"
                ],
                "tags": [
                    "events"
                ],
                "summary": "Update event",
                "operationId": "update-event",
                "parameters": [
                    {
                        "type": "integer",
                        "description": "Event ID",
                        "name": "id",
                        "in": "path",
                        "required": true
                    },
                    {
                        "description": "Event",
                        "name": "event",
                        "in": "body",
                        "required": true,
                        "schema": {
                            "$ref": "#/definitions/models.UpdateEventRequest"
                        }
                    }
                ],
                "responses": {}
            }
        },
        "/event-tracking/health": {
            "get": {
                "description": "health check",
                "produces": [
                    "application/json"
                ],
                "tags": [
                    "health"
                ],
                "summary": "Health check",
                "operationId": "health-check",
                "responses": {}
            }
        },
        "/event-tracking/health/cpu": {
            "get": {
                "description": "cpu health check",
                "produces": [
                    "application/json"
                ],
                "tags": [
                    "health"
                ],
                "summary": "CPU health check",
                "operationId": "health-check-cpu",
                "responses": {}
            }
        },
        "/event-tracking/health/database": {
            "get": {
                "description": "database health check",
                "produces": [
                    "application/json"
                ],
                "tags": [
                    "health"
                ],
                "summary": "Database health check",
                "operationId": "health-check-database",
                "responses": {}
            }
        },
        "/event-tracking/health/disk": {
            "get": {
                "description": "disk health check",
                "produces": [
                    "application/json"
                ],
                "tags": [
                    "health"
                ],
                "summary": "Disk health check",
                "operationId": "health-check-disk",
                "responses": {}
            }
        },
        "/event-tracking/health/general": {
            "get": {
                "description": "general health check",
                "produces": [
                    "application/json"
                ],
                "tags": [
                    "health"
                ],
                "summary": "General health check",
                "operationId": "health-check-general",
                "responses": {}
            }
        },
        "/event-tracking/health/goroutine": {
            "get": {
                "description": "goroutine health check",
                "produces": [
                    "application/json"
                ],
                "tags": [
                    "health"
                ],
                "summary": "Goroutine health check",
                "operationId": "health-check-goroutine",
                "responses": {}
            }
        },
        "/event-tracking/health/kafka": {
            "get": {
                "description": "kafka health check",
                "produces": [
                    "application/json"
                ],
                "tags": [
                    "health"
                ],
                "summary": "Kafka health check",
                "operationId": "health-check-kafka",
                "responses": {}
            }
        },
        "/event-tracking/health/liveness": {
            "get": {
                "description": "liveness health check",
                "produces": [
                    "application/json"
                ],
                "tags": [
                    "health"
                ],
                "summary": "Liveness health check",
                "operationId": "health-check-liveness",
                "responses": {}
            }
        },
        "/event-tracking/health/readiness": {
            "get": {
                "description": "readiness health check",
                "produces": [
                    "application/json"
                ],
                "tags": [
                    "health"
                ],
                "summary": "Readiness health check",
                "operationId": "health-check-readiness",
                "responses": {}
            }
        },
        "/event-tracking/metrics": {
            "get": {
                "description": "Prometheus metrics",
                "produces": [
                    "application/json"
                ],
                "tags": [
                    "metrics"
                ],
                "summary": "Prometheus metrics",
                "operationId": "prometheus-metrics",
                "responses": {}
            }
        }
    },
    "definitions": {
        "models.CreateEventRequest": {
            "type": "object",
            "required": [
                "content",
                "type",
                "user_id"
            ],
            "properties": {
                "content": {
                    "type": "string"
                },
                "type": {
                    "type": "string"
                },
                "user_id": {
                    "type": "string"
                }
            }
        },
        "models.UpdateEventRequest": {
            "type": "object",
            "properties": {
                "content": {
                    "type": "string"
                },
                "type": {
                    "type": "string"
                },
                "user_id": {
                    "type": "string"
                }
            }
        }
    }
}`

// SwaggerInfo holds exported Swagger Info so clients can modify it
var SwaggerInfo = &swag.Spec{
	Version:          "1.0",
	Host:             "",
	BasePath:         "",
	Schemes:          []string{},
	Title:            "Event Tracking API Documentation",
	Description:      "Event tracking documentation for the social networking app focused on sharing vibes.",
	InfoInstanceName: "swagger",
	SwaggerTemplate:  docTemplate,
	LeftDelim:        "{{",
	RightDelim:       "}}",
}

func init() {
	swag.Register(SwaggerInfo.InstanceName(), SwaggerInfo)
}