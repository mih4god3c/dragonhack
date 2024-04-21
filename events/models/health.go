package models

type HealthStatus string

const (
	HealthStatusUp   HealthStatus = "UP"
	HealthStatusDown HealthStatus = "DOWN"
)

type HealthResponse struct {
	Status     HealthStatus               `json:"status"`
	Components map[string]HealthComponent `json:"components,omitempty"`
}

type HealthComponent struct {
	Status     HealthStatus               `json:"status"`
	Details    interface{}                `json:"details,omitempty"`
	Components map[string]HealthComponent `json:"components,omitempty"`
}
