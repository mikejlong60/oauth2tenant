// Code generated from envoy/extensions/filters/network/set_filter_state/v3/set_filter_state.proto. DO NOT EDIT.
package v3

import (
	v3_1 "envoyproxy.io/envoy-cue/spec/extensions/filters/common/set_filter_state/v3"
)

#Config: {
	"@type": "type.googleapis.com/envoy.extensions.filters.network.set_filter_state.v3.Config"
	on_new_connection?: [...v3_1.#FilterStateValue]
	on_downstream_tls_handshake?: [...v3_1.#FilterStateValue]
}
