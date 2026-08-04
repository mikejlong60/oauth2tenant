// Code generated from envoy/extensions/health_check/event_sinks/file/v3/file.proto. DO NOT EDIT.
package v3

import (
	"strings"
)

// Health check event file sink.
// The health check event will be converted to JSON.
#HealthCheckEventFileSink: {
	"@type": "type.googleapis.com/envoy.extensions.health_check.event_sinks.file.v3.HealthCheckEventFileSink"

	// Specifies the path to the health check event log.
	event_log_path!: string & strings.MinRunes(1)
}
