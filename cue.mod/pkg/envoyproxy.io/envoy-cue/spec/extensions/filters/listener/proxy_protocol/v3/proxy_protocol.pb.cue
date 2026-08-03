// Code generated from envoy/extensions/filters/listener/proxy_protocol/v3/proxy_protocol.proto. DO NOT EDIT.
package v3

import (
	"strings"
	v3_1 "envoyproxy.io/envoy-cue/spec/config/core/v3"
)

#ProxyProtocol: {
	"@type": "type.googleapis.com/envoy.extensions.filters.listener.proxy_protocol.v3.ProxyProtocol"
	rules?: [...#ProxyProtocol_Rule]
	allow_requests_without_proxy_protocol?: bool
	pass_through_tlvs?:                     v3_1.#ProxyProtocolPassThroughTLVs
	disallowed_versions?: [...v3_1.#ProxyProtocolConfig_Version]
	stat_prefix?:  string
	tlv_location?: #ProxyProtocol_TlvLocation
}

#ProxyProtocol_KeyValuePair: {
	"@type":             "type.googleapis.com/envoy.extensions.filters.listener.proxy_protocol.v3.ProxyProtocol.KeyValuePair"
	metadata_namespace?: string
	key!:                string & strings.MinRunes(1)
}

#ProxyProtocol_Rule: {
	"@type":         "type.googleapis.com/envoy.extensions.filters.listener.proxy_protocol.v3.ProxyProtocol.Rule"
	tlv_type?:       uint32 & <256
	on_tlv_present?: #ProxyProtocol_KeyValuePair
}

#ProxyProtocol_TlvLocation: "DYNAMIC_METADATA" | "FILTER_STATE"
