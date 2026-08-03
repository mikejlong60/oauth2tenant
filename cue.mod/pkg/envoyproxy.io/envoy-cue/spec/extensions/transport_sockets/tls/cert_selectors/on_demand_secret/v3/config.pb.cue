// Code generated from envoy/extensions/transport_sockets/tls/cert_selectors/on_demand_secret/v3/config.proto. DO NOT EDIT.
package v3

import (
	v3_1 "envoyproxy.io/envoy-cue/spec/config/core/v3"
)

#Config: {
	"@type":             "type.googleapis.com/envoy.extensions.transport_sockets.tls.cert_selectors.on_demand_secret.v3.Config"
	config_source!:      v3_1.#ConfigSource
	certificate_mapper!: v3_1.#TypedExtensionConfig
	prefetch_secret_names?: [...string]
}
