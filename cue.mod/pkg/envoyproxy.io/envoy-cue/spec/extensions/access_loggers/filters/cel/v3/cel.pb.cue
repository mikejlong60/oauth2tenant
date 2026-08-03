// Code generated from envoy/extensions/access_loggers/filters/cel/v3/cel.proto. DO NOT EDIT.
package v3

import (
	v3_1 "envoyproxy.io/envoy-cue/spec/config/core/v3"
)

#ExpressionFilter: {
	"@type":     "type.googleapis.com/envoy.extensions.access_loggers.filters.cel.v3.ExpressionFilter"
	expression?: string
	cel_config?: v3_1.#CelExpressionConfig
}
