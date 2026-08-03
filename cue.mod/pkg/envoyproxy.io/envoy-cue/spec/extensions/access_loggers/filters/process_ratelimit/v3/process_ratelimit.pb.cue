// Code generated from envoy/extensions/access_loggers/filters/process_ratelimit/v3/process_ratelimit.proto. DO NOT EDIT.
package v3

import (
	"strings"
	v3_1 "envoyproxy.io/envoy-cue/spec/config/core/v3"
)

#ProcessRateLimitFilter: {
	"@type":         "type.googleapis.com/envoy.extensions.access_loggers.filters.process_ratelimit.v3.ProcessRateLimitFilter"
	dynamic_config?: #DynamicTokenBucket
}

#DynamicTokenBucket: {
	"@type":        "type.googleapis.com/envoy.extensions.access_loggers.filters.process_ratelimit.v3.DynamicTokenBucket"
	resource_name!: string & strings.MinRunes(1)
	config_source!: v3_1.#ConfigSource
}
