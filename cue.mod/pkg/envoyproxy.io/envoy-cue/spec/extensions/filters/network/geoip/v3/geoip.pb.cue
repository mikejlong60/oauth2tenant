// Code generated from envoy/extensions/filters/network/geoip/v3/geoip.proto. DO NOT EDIT.
package v3

import (
	v3_1 "envoyproxy.io/envoy-cue/spec/config/core/v3"
)

#Geoip: {
	"@type":      "type.googleapis.com/envoy.extensions.filters.network.geoip.v3.Geoip"
	stat_prefix?: string
	provider!:    v3_1.#TypedExtensionConfig
	client_ip?:   string
}
