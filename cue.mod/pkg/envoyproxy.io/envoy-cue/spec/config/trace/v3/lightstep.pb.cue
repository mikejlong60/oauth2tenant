// Code generated from envoy/config/trace/v3/lightstep.proto. DO NOT EDIT.
package v3

import (
	"strings"
	v3_1 "envoyproxy.io/envoy-cue/spec/config/core/v3"
)

// Configuration for the LightStep tracer.
// [#extension: envoy.tracers.lightstep]
// [#not-implemented-hide:]
#LightstepConfig: {
	"@type": "type.googleapis.com/envoy.config.trace.v3.LightstepConfig"

	// The cluster manager cluster that hosts the LightStep collectors.
	collector_cluster!: string & strings.MinRunes(1)

	// File containing the access token to the `LightStep
	// <https://lightstep.com/>`_ API.
	access_token_file?: string

	// Access token to the `LightStep <https://lightstep.com/>`_ API.
	access_token?: v3_1.#DataSource

	// Propagation modes to use by LightStep's tracer.
	propagation_modes?: [...#LightstepConfig_PropagationMode]
}

// Available propagation modes
#LightstepConfig_PropagationMode:
	// Propagate trace context in the single header x-ot-span-context.
	"ENVOY" |

	// Propagate trace context using LightStep's native format.
	"LIGHTSTEP" |

	// Propagate trace context using the b3 format.
	"B3" |

	// Propagation trace context using the w3 trace-context standard.
	"TRACE_CONTEXT"
