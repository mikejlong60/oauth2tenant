// Code generated from envoy/config/trace/v3/dynamic_ot.proto. DO NOT EDIT.
package v3

import (
	"strings"
)

// DynamicOtConfig was used to dynamically load a tracer from a shared library
// that implements the `OpenTracing dynamic loading API
// <https://github.com/opentracing/opentracing-cpp>`_.
// [#not-implemented-hide:]
#DynamicOtConfig: {
	"@type": "type.googleapis.com/envoy.config.trace.v3.DynamicOtConfig"

	// Dynamic library implementing the `OpenTracing API
	// <https://github.com/opentracing/opentracing-cpp>`_.
	library!: string & strings.MinRunes(1)

	// The configuration to use when creating a tracer from the given dynamic
	// library.
	config?: {...}
}
