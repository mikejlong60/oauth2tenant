// Code generated from envoy/data/core/v3/health_check_event.proto. DO NOT EDIT.
package v3

import (
	"strings"
	v3_1 "envoyproxy.io/envoy-cue/spec/config/core/v3"
)

#HealthCheckEvent: {
	"@type":                        "type.googleapis.com/envoy.data.core.v3.HealthCheckEvent"
	health_checker_type?:           #HealthCheckerType
	host?:                          v3_1.#Address
	cluster_name!:                  string & strings.MinRunes(1)
	eject_unhealthy_event?:         #HealthCheckEjectUnhealthy
	add_healthy_event?:             #HealthCheckAddHealthy
	successful_health_check_event?: #HealthCheckSuccessful
	health_check_failure_event?:    #HealthCheckFailure
	degraded_healthy_host?:         #DegradedHealthyHost
	no_longer_degraded_host?:       #NoLongerDegradedHost
	timestamp?:                     string
	metadata?:                      v3_1.#Metadata
	locality?:                      v3_1.#Locality
}

#HealthCheckEjectUnhealthy: {
	"@type":       "type.googleapis.com/envoy.data.core.v3.HealthCheckEjectUnhealthy"
	failure_type?: #HealthCheckFailureType
}

#HealthCheckAddHealthy: {
	"@type":      "type.googleapis.com/envoy.data.core.v3.HealthCheckAddHealthy"
	first_check?: bool
}

#HealthCheckSuccessful: {
	"@type": "type.googleapis.com/envoy.data.core.v3.HealthCheckSuccessful"
}

#HealthCheckFailure: {
	"@type":       "type.googleapis.com/envoy.data.core.v3.HealthCheckFailure"
	failure_type?: #HealthCheckFailureType
	first_check?:  bool
}

#DegradedHealthyHost: {
	"@type": "type.googleapis.com/envoy.data.core.v3.DegradedHealthyHost"
}

#NoLongerDegradedHost: {
	"@type": "type.googleapis.com/envoy.data.core.v3.NoLongerDegradedHost"
}

#HealthCheckFailureType: "ACTIVE" | "PASSIVE" | "NETWORK" | "NETWORK_TIMEOUT"

#HealthCheckerType: "HTTP" | "TCP" | "GRPC" | "REDIS" | "THRIFT"
