// Code generated from envoy/api/v2/core/protocol.proto. DO NOT EDIT.
package core

#TcpProtocolOptions: {
	"@type": "type.googleapis.com/envoy.api.v2.core.TcpProtocolOptions"
}

#UpstreamHttpProtocolOptions: {
	"@type":              "type.googleapis.com/envoy.api.v2.core.UpstreamHttpProtocolOptions"
	auto_sni?:            bool
	auto_san_validation?: bool
}

#HttpProtocolOptions: {
	"@type":                          "type.googleapis.com/envoy.api.v2.core.HttpProtocolOptions"
	idle_timeout?:                    string
	max_connection_duration?:         string
	max_headers_count?:               uint32 & >=1
	max_stream_duration?:             string
	headers_with_underscores_action?: #HttpProtocolOptions_HeadersWithUnderscoresAction
}

#HttpProtocolOptions_HeadersWithUnderscoresAction: "ALLOW" | "REJECT_REQUEST" | "DROP_HEADER"

#Http1ProtocolOptions: {
	"@type":                   "type.googleapis.com/envoy.api.v2.core.Http1ProtocolOptions"
	allow_absolute_url?:       bool
	accept_http_10?:           bool
	default_host_for_http_10?: string
	header_key_format?:        #Http1ProtocolOptions_HeaderKeyFormat
	enable_trailers?:          bool
}

#Http1ProtocolOptions_HeaderKeyFormat: {
	"@type":            "type.googleapis.com/envoy.api.v2.core.Http1ProtocolOptions.HeaderKeyFormat"
	proper_case_words?: #Http1ProtocolOptions_HeaderKeyFormat_ProperCaseWords
}

#Http1ProtocolOptions_HeaderKeyFormat_ProperCaseWords: {
	"@type": "type.googleapis.com/envoy.api.v2.core.Http1ProtocolOptions.HeaderKeyFormat.ProperCaseWords"
}

#Http2ProtocolOptions: {
	"@type":                                               "type.googleapis.com/envoy.api.v2.core.Http2ProtocolOptions"
	hpack_table_size?:                                     uint32
	max_concurrent_streams?:                               uint32 & >=1 & <=2147483647
	initial_stream_window_size?:                           uint32 & >=65535 & <=2147483647
	initial_connection_window_size?:                       uint32 & >=65535 & <=2147483647
	allow_connect?:                                        bool
	allow_metadata?:                                       bool
	max_outbound_frames?:                                  uint32 & >=1
	max_outbound_control_frames?:                          uint32 & >=1
	max_consecutive_inbound_frames_with_empty_payload?:    uint32
	max_inbound_priority_frames_per_stream?:               uint32
	max_inbound_window_update_frames_per_data_frame_sent?: uint32 & >=1
	stream_error_on_invalid_http_messaging?:               bool
	custom_settings_parameters?: [...#Http2ProtocolOptions_SettingsParameter]
}

#Http2ProtocolOptions_SettingsParameter: {
	"@type":     "type.googleapis.com/envoy.api.v2.core.Http2ProtocolOptions.SettingsParameter"
	identifier!: uint32 & >=1 & <=65536
	value!:      uint32
}

#GrpcProtocolOptions: {
	"@type":                 "type.googleapis.com/envoy.api.v2.core.GrpcProtocolOptions"
	http2_protocol_options?: #Http2ProtocolOptions
}
