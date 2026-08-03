// Code generated from envoy/extensions/filters/network/connection_limit/v3/connection_limit.proto. DO NOT EDIT.
package v3

import (
	"strings"
	v3_1 "envoyproxy.io/envoy-cue/spec/config/core/v3"
)

#ConnectionLimit: {
	"@type":          "type.googleapis.com/envoy.extensions.filters.network.connection_limit.v3.ConnectionLimit"
	stat_prefix!:     string & strings.MinRunes(1)
	max_connections?: uint64 & >=1
	delay?:           string
	runtime_enabled?: v3_1.#RuntimeFeatureFlag
}
