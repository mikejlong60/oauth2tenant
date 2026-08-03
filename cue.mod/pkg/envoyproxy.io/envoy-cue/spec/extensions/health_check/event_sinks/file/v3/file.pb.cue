// Code generated from envoy/extensions/health_check/event_sinks/file/v3/file.proto. DO NOT EDIT.
package v3

import (
	"strings"
)

#HealthCheckEventFileSink: {
	"@type":         "type.googleapis.com/envoy.extensions.health_check.event_sinks.file.v3.HealthCheckEventFileSink"
	event_log_path!: string & strings.MinRunes(1)
}
