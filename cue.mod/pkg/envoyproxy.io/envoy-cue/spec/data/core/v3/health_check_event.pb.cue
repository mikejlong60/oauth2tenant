// Code generated from envoy/data/core/v3/health_check_event.proto. DO NOT EDIT.
package v3

import (
	"strings"
	v3_1 "envoyproxy.io/envoy-cue/spec/config/core/v3"
)

// [#next-free-field: 13]
#HealthCheckEvent: {
	"@type":              "type.googleapis.com/envoy.data.core.v3.HealthCheckEvent"
	health_checker_type?: #HealthCheckerType
	host?:                v3_1.#Address
	cluster_name!:        string & strings.MinRunes(1)

	// Timestamp for event.
	timestamp?: string

	// Host metadata
	metadata?: v3_1.#Metadata

	// Host locality
	locality?: v3_1.#Locality

	// oneof event: exactly one must be set
	// Host ejection.
	{eject_unhealthy_event!: #HealthCheckEjectUnhealthy} |
	{

		// Host addition.
		add_healthy_event!: #HealthCheckAddHealthy
	} |
	{

		// A health check was successful. Note: a host will be considered healthy either if it is
		// the first ever health check, or if the healthy threshold is reached. This kind of event
		// indicate that a health check was successful, but does not indicates that the host is
		// considered healthy. A host is considered healthy if HealthCheckAddHealthy kind of event is sent.
		successful_health_check_event!: #HealthCheckSuccessful
	} |
	{

		// Host failure.
		health_check_failure_event!: #HealthCheckFailure
	} |
	{

		// Healthy host became degraded.
		degraded_healthy_host!: #DegradedHealthyHost
	} |
	{

		// A degraded host returned to being healthy.
		no_longer_degraded_host!: #NoLongerDegradedHost
	}
}

#HealthCheckEjectUnhealthy: {
	"@type": "type.googleapis.com/envoy.data.core.v3.HealthCheckEjectUnhealthy"

	// The type of failure that caused this ejection.
	failure_type?: #HealthCheckFailureType
}

#HealthCheckAddHealthy: {
	"@type": "type.googleapis.com/envoy.data.core.v3.HealthCheckAddHealthy"

	// Whether this addition is the result of the first ever health check on a host, in which case
	// the configured :ref:`healthy threshold <envoy_v3_api_field_config.core.v3.HealthCheck.healthy_threshold>`
	// is bypassed and the host is immediately added.
	first_check?: bool
}

#HealthCheckSuccessful: {
	"@type": "type.googleapis.com/envoy.data.core.v3.HealthCheckSuccessful"
}

#HealthCheckFailure: {
	"@type": "type.googleapis.com/envoy.data.core.v3.HealthCheckFailure"

	// The type of failure that caused this event.
	failure_type?: #HealthCheckFailureType

	// Whether this event is the result of the first ever health check on a host.
	first_check?: bool
}

#DegradedHealthyHost: {
	"@type": "type.googleapis.com/envoy.data.core.v3.DegradedHealthyHost"
}

#NoLongerDegradedHost: {
	"@type": "type.googleapis.com/envoy.data.core.v3.NoLongerDegradedHost"
}

#HealthCheckFailureType: "ACTIVE" | "PASSIVE" | "NETWORK" | "NETWORK_TIMEOUT"

#HealthCheckerType: "HTTP" | "TCP" | "GRPC" | "REDIS" | "THRIFT"
