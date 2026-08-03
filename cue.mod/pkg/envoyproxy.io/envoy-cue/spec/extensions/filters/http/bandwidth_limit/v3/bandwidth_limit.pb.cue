// Code generated from envoy/extensions/filters/http/bandwidth_limit/v3/bandwidth_limit.proto. DO NOT EDIT.
package v3

import (
	"strings"
	v3_1 "envoyproxy.io/envoy-cue/spec/config/core/v3"
)

#BandwidthLimit: {
	"@type":                   "type.googleapis.com/envoy.extensions.filters.http.bandwidth_limit.v3.BandwidthLimit"
	stat_prefix!:              string & strings.MinRunes(1)
	enable_mode?:              #BandwidthLimit_EnableMode
	limit_kbps?:               uint64 & >=1
	fill_interval?:            string // TODO(pgv): duration bounds
	runtime_enabled?:          v3_1.#RuntimeFeatureFlag
	enable_response_trailers?: bool
	response_trailer_prefix?:  string // TODO(pgv): string well-known *validate.StringRules_WellKnownRegex
}

#BandwidthLimit_EnableMode: "DISABLED" | "REQUEST" | "RESPONSE" | "REQUEST_AND_RESPONSE"
