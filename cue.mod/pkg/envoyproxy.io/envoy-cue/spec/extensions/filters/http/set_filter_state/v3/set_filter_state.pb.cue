// Code generated from envoy/extensions/filters/http/set_filter_state/v3/set_filter_state.proto. DO NOT EDIT.
package v3

import (
	v3_1 "envoyproxy.io/envoy-cue/spec/extensions/filters/common/set_filter_state/v3"
)

#Config: {
	"@type": "type.googleapis.com/envoy.extensions.filters.http.set_filter_state.v3.Config"

	// A sequence of the filter state values to apply in the specified order
	// when a new request is received.
	on_request_headers?: [...v3_1.#FilterStateValue]
}
