// Code generated from envoy/data/core/v2alpha/health_check_event.proto. DO NOT EDIT.
package v2alpha

import (
	core_1 "envoyproxy.io/envoy-cue/spec/api/v2/core"
)

#HealthCheckEvent: {
	"@type":              "type.googleapis.com/envoy.data.core.v2alpha.HealthCheckEvent"
	health_checker_type?: #HealthCheckerType
	host?:                core_1.#Address
	cluster_name!:        string & !=""
	timestamp?:           string

	// oneof event: exactly one must be set
	{eject_unhealthy_event!: #HealthCheckEjectUnhealthy} |
	{add_healthy_event!: #HealthCheckAddHealthy} |
	{health_check_failure_event!: #HealthCheckFailure} |
	{degraded_healthy_host!: #DegradedHealthyHost} |
	{no_longer_degraded_host!: #NoLongerDegradedHost}
}

#HealthCheckEjectUnhealthy: {
	"@type":       "type.googleapis.com/envoy.data.core.v2alpha.HealthCheckEjectUnhealthy"
	failure_type?: #HealthCheckFailureType
}

#HealthCheckAddHealthy: {
	"@type":      "type.googleapis.com/envoy.data.core.v2alpha.HealthCheckAddHealthy"
	first_check?: bool
}

#HealthCheckFailure: {
	"@type":       "type.googleapis.com/envoy.data.core.v2alpha.HealthCheckFailure"
	failure_type?: #HealthCheckFailureType
	first_check?:  bool
}

#DegradedHealthyHost: {
	"@type": "type.googleapis.com/envoy.data.core.v2alpha.DegradedHealthyHost"
}

#NoLongerDegradedHost: {
	"@type": "type.googleapis.com/envoy.data.core.v2alpha.NoLongerDegradedHost"
}

#HealthCheckFailureType: "ACTIVE" | "PASSIVE" | "NETWORK"

#HealthCheckerType: "HTTP" | "TCP" | "GRPC" | "REDIS"
