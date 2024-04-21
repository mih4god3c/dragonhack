package models

import "time"

type EventType string

const (
	EventTypeUnknown  EventType = "unknown"
	EventTypeLogin    EventType = "login"
	EventTypeLogout   EventType = "logout"
	EventTypeRegister EventType = "register"
	EventTypePurchase EventType = "purchase"
	EventTypeView     EventType = "view"
)

type Event struct {
	Id        string    `json:"id" gorm:"primaryKey;autoIncrement"`
	Timestamp time.Time `json:"timestamp" gorm:"autoCreateTime"`
	Type      EventType `json:"type" gorm:"not null"`
	Content   string    `json:"content" gorm:"not null"`
	UserId    string    `json:"user_id" gorm:"not null"`
}

type CreateEventRequest struct {
	Type    string `json:"type" binding:"required"`
	UserId  string `json:"user_id" binding:"required"`
	Content string `json:"content" binding:"required"`
}

type UpdateEventRequest struct {
	Type    string `json:"type"`
	UserId  string `json:"user_id"`
	Content string `json:"content"`
}
