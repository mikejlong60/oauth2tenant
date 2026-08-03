// Code generated from envoy/extensions/filters/http/kill_request/v3/kill_request.proto. DO NOT EDIT.
package v3

import (
	v3_1 "envoyproxy.io/envoy-cue/spec/type/v3"
)

#KillRequest: {
	"@type":              "type.googleapis.com/envoy.extensions.filters.http.kill_request.v3.KillRequest"
	probability?:         v3_1.#FractionalPercent
	kill_request_header?: string // TODO(pgv): string well-known *validate.StringRules_WellKnownRegex
	direction?:           #KillRequest_Direction
}

#KillRequest_Direction: "REQUEST" | "RESPONSE"
