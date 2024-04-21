package kafka

import (
	eventhub "github.com/Azure/azure-event-hubs-go"
	"github.com/spf13/viper"
)

var EH *eventhub.Hub

func ConnectEventHub() {
	connStr := viper.GetString("EVENT_HUB_CONNECTION_STRING")
	hub, err := eventhub.NewHubFromConnectionString(connStr)
	if err != nil {
		panic("Failed to connect to Event Hub!")
	}

	EH = hub
}
