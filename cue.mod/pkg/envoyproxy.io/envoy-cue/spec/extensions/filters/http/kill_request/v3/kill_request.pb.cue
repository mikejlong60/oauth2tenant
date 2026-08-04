// Code generated from envoy/extensions/filters/http/kill_request/v3/kill_request.proto. DO NOT EDIT.
package v3

import (
	v3_1 "envoyproxy.io/envoy-cue/spec/type/v3"
)

// Configuration for KillRequest filter.
#KillRequest: {
	"@type": "type.googleapis.com/envoy.extensions.filters.http.kill_request.v3.KillRequest"

	// The probability that a Kill request will be triggered.
	probability?: v3_1.#FractionalPercent

	// The name of the kill request header. If this field is not empty, it will override the :ref:`default header <config_http_filters_kill_request_http_header>` name. Otherwise the default header name will be used.
	kill_request_header?: string // TODO(pgv): string well-known *validate.StringRules_WellKnownRegex
	direction?:           #KillRequest_Direction
}

// On which direction should the filter check for the ``kill_request_header``.
// Default to ``REQUEST`` if unspecified.
#KillRequest_Direction: "REQUEST" | "RESPONSE"
