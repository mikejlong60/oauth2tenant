// Code generated from envoy/config/core/v3/proxy_protocol.proto. DO NOT EDIT.
package v3

#ProxyProtocolPassThroughTLVs: {
	"@type":     "type.googleapis.com/envoy.config.core.v3.ProxyProtocolPassThroughTLVs"
	match_type?: #ProxyProtocolPassThroughTLVs_PassTLVsMatchType
	tlv_type?: [...uint32]
}

#ProxyProtocolPassThroughTLVs_PassTLVsMatchType: "INCLUDE_ALL" | "INCLUDE"

#TlvEntry: {
	"@type":        "type.googleapis.com/envoy.config.core.v3.TlvEntry"
	type?:          uint32 & <256
	value?:         bytes
	format_string?: #SubstitutionFormatString
}

#ProxyProtocolConfig: {
	"@type":            "type.googleapis.com/envoy.config.core.v3.ProxyProtocolConfig"
	version?:           #ProxyProtocolConfig_Version
	pass_through_tlvs?: #ProxyProtocolPassThroughTLVs
	added_tlvs?: [...#TlvEntry]
}

#ProxyProtocolConfig_Version: "V1" | "V2"

#PerHostConfig: {
	"@type": "type.googleapis.com/envoy.config.core.v3.PerHostConfig"
	added_tlvs?: [...#TlvEntry]
}
