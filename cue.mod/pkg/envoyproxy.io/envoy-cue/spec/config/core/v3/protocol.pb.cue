// Code generated from envoy/config/core/v3/protocol.proto. DO NOT EDIT.
package v3

import (
	"strings"
	v3_1 "envoyproxy.io/envoy-cue/spec/type/matcher/v3"
	v3_2 "envoyproxy.io/envoy-cue/spec/type/v3"
)

#TcpProtocolOptions: {
	"@type": "type.googleapis.com/envoy.config.core.v3.TcpProtocolOptions"
}

#QuicKeepAliveSettings: {
	"@type":           "type.googleapis.com/envoy.config.core.v3.QuicKeepAliveSettings"
	max_interval?:     string
	initial_interval?: string // TODO(pgv): duration bounds
}

#QuicProtocolOptions: {
	"@type":                                 "type.googleapis.com/envoy.config.core.v3.QuicProtocolOptions"
	max_concurrent_streams?:                 uint32 & >=1
	initial_stream_window_size?:             uint32 & >=1 & <=16777216
	initial_connection_window_size?:         uint32 & >=1 & <=25165824
	num_timeouts_to_trigger_port_migration?: uint32 & >=0 & <=5
	connection_keepalive?:                   #QuicKeepAliveSettings
	connection_options?:                     string
	client_connection_options?:              string
	idle_network_timeout?:                   string // TODO(pgv): duration bounds
	max_packet_length?:                      uint64
	client_packet_writer?:                   #TypedExtensionConfig
	connection_migration?:                   #QuicProtocolOptions_ConnectionMigrationSettings
}

#QuicProtocolOptions_ConnectionMigrationSettings: {
	"@type":                          "type.googleapis.com/envoy.config.core.v3.QuicProtocolOptions.ConnectionMigrationSettings"
	migrate_idle_connections?:        #QuicProtocolOptions_ConnectionMigrationSettings_MigrateIdleConnectionSettings
	max_time_on_non_default_network?: string // TODO(pgv): duration bounds
}

#QuicProtocolOptions_ConnectionMigrationSettings_MigrateIdleConnectionSettings: {
	"@type":                         "type.googleapis.com/envoy.config.core.v3.QuicProtocolOptions.ConnectionMigrationSettings.MigrateIdleConnectionSettings"
	max_idle_time_before_migration?: string // TODO(pgv): duration bounds
}

#UpstreamHttpProtocolOptions: {
	"@type":                   "type.googleapis.com/envoy.config.core.v3.UpstreamHttpProtocolOptions"
	auto_sni?:                 bool
	auto_san_validation?:      bool
	override_auto_sni_header?: string // TODO(pgv): string well-known *validate.StringRules_WellKnownRegex
}

#AlternateProtocolsCacheOptions: {
	"@type":                 "type.googleapis.com/envoy.config.core.v3.AlternateProtocolsCacheOptions"
	name!:                   string & strings.MinRunes(1)
	max_entries?:            uint32 & >0
	key_value_store_config?: #TypedExtensionConfig
	prepopulated_entries?: [...#AlternateProtocolsCacheOptions_AlternateProtocolsCacheEntry]
	canonical_suffixes?: [...string]
}

#AlternateProtocolsCacheOptions_AlternateProtocolsCacheEntry: {
	"@type":   "type.googleapis.com/envoy.config.core.v3.AlternateProtocolsCacheOptions.AlternateProtocolsCacheEntry"
	hostname?: string // TODO(pgv): string well-known *validate.StringRules_WellKnownRegex
	port?:     uint32 & >0 & <65535
}

#HttpProtocolOptions: {
	"@type":                          "type.googleapis.com/envoy.config.core.v3.HttpProtocolOptions"
	idle_timeout?:                    string
	max_connection_duration?:         string
	max_headers_count?:               uint32 & >=1
	max_response_headers_kb?:         uint32 & >0 & <=8192
	max_stream_duration?:             string
	headers_with_underscores_action?: #HttpProtocolOptions_HeadersWithUnderscoresAction
	max_requests_per_connection?:     uint32
}

#HttpProtocolOptions_HeadersWithUnderscoresAction: "ALLOW" | "REJECT_REQUEST" | "DROP_HEADER"

#Http1ProtocolOptions: {
	"@type":                                        "type.googleapis.com/envoy.config.core.v3.Http1ProtocolOptions"
	allow_absolute_url?:                            bool
	accept_http_10?:                                bool
	default_host_for_http_10?:                      string
	header_key_format?:                             #Http1ProtocolOptions_HeaderKeyFormat
	enable_trailers?:                               bool
	allow_chunked_length?:                          bool
	override_stream_error_on_invalid_http_message?: bool
	send_fully_qualified_url?:                      bool
	use_balsa_parser?:                              bool
	allow_custom_methods?:                          bool
	ignore_http_11_upgrade?: [...v3_1.#StringMatcher]
}

#Http1ProtocolOptions_HeaderKeyFormat: {
	"@type": "type.googleapis.com/envoy.config.core.v3.Http1ProtocolOptions.HeaderKeyFormat"

	// oneof header_format: exactly one must be set
	{proper_case_words!: #Http1ProtocolOptions_HeaderKeyFormat_ProperCaseWords} |
	{stateful_formatter!: #TypedExtensionConfig}
}

#Http1ProtocolOptions_HeaderKeyFormat_ProperCaseWords: {
	"@type": "type.googleapis.com/envoy.config.core.v3.Http1ProtocolOptions.HeaderKeyFormat.ProperCaseWords"
}

#KeepaliveSettings: {
	"@type":                   "type.googleapis.com/envoy.config.core.v3.KeepaliveSettings"
	interval?:                 string // TODO(pgv): duration bounds
	timeout!:                  string // TODO(pgv): duration bounds
	interval_jitter?:          v3_2.#Percent
	connection_idle_interval?: string // TODO(pgv): duration bounds
}

#Http2ProtocolOptions: {
	"@type":                                               "type.googleapis.com/envoy.config.core.v3.Http2ProtocolOptions"
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
	override_stream_error_on_invalid_http_message?:        bool
	custom_settings_parameters?: [...#Http2ProtocolOptions_SettingsParameter]
	connection_keepalive?:    #KeepaliveSettings
	use_oghttp2_codec?:       bool
	max_metadata_size?:       uint64
	enable_huffman_encoding?: bool
}

#Http2ProtocolOptions_SettingsParameter: {
	"@type":     "type.googleapis.com/envoy.config.core.v3.Http2ProtocolOptions.SettingsParameter"
	identifier!: uint32 & >=0 & <=65535
	value!:      uint32
}

#GrpcProtocolOptions: {
	"@type":                 "type.googleapis.com/envoy.config.core.v3.GrpcProtocolOptions"
	http2_protocol_options?: #Http2ProtocolOptions
}

#Http3ProtocolOptions: {
	"@type":                                        "type.googleapis.com/envoy.config.core.v3.Http3ProtocolOptions"
	quic_protocol_options?:                         #QuicProtocolOptions
	override_stream_error_on_invalid_http_message?: bool
	allow_extended_connect?:                        bool
	allow_metadata?:                                bool
	disable_qpack?:                                 bool
	disable_connection_flow_control_for_streams?:   bool
}

#SchemeHeaderTransformation: {
	"@type":         "type.googleapis.com/envoy.config.core.v3.SchemeHeaderTransformation"
	match_upstream?: bool

	// oneof transformation: at most one may be set
	*{} |
	{scheme_to_overwrite!: string & ("http" | "https")}
}
