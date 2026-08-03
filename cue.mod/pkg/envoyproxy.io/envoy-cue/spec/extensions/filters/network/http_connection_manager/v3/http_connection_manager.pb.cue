// Code generated from envoy/extensions/filters/network/http_connection_manager/v3/http_connection_manager.proto. DO NOT EDIT.
package v3

import (
	"list"
	"strings"
	v3_1 "envoyproxy.io/envoy-cue/spec/config/route/v3"
	v3_2 "envoyproxy.io/envoy-cue/spec/config/core/v3"
	v3_3 "envoyproxy.io/envoy-cue/spec/config/accesslog/v3"
	v3_4 "envoyproxy.io/envoy-cue/spec/deps/cncf/xds/go/xds/type/matcher/v3"
	v3_5 "envoyproxy.io/envoy-cue/spec/type/v3"
	v3_6 "envoyproxy.io/envoy-cue/spec/type/tracing/v3"
	v3_7 "envoyproxy.io/envoy-cue/spec/config/trace/v3"
	v3_8 "envoyproxy.io/envoy-cue/spec/type/http/v3"
)

#HttpConnectionManager: {
	"@type":        "type.googleapis.com/envoy.extensions.filters.network.http_connection_manager.v3.HttpConnectionManager"
	codec_type?:    #HttpConnectionManager_CodecType
	stat_prefix!:   string & strings.MinRunes(1)
	rds?:           #Rds
	route_config?:  v3_1.#RouteConfiguration
	scoped_routes?: #ScopedRoutes
	http_filters?: [...#HttpFilter]
	add_user_agent?:                     bool
	tracing?:                            #HttpConnectionManager_Tracing
	common_http_protocol_options?:       v3_2.#HttpProtocolOptions
	http1_safe_max_connection_duration?: bool
	http_protocol_options?:              v3_2.#Http1ProtocolOptions
	http2_protocol_options?:             v3_2.#Http2ProtocolOptions
	http3_protocol_options?:             v3_2.#Http3ProtocolOptions
	server_name?:                        string // TODO(pgv): string well-known *validate.StringRules_WellKnownRegex
	server_header_transformation?:       #HttpConnectionManager_ServerHeaderTransformation
	scheme_header_transformation?:       v3_2.#SchemeHeaderTransformation
	max_request_headers_kb?:             uint32 & >0 & <=8192
	stream_idle_timeout?:                string
	stream_flush_timeout?:               string
	request_timeout?:                    string
	request_headers_timeout?:            string // TODO(pgv): duration bounds
	drain_timeout?:                      string
	delayed_close_timeout?:              string
	access_log?: [...v3_3.#AccessLog]
	access_log_flush_interval?:       string // TODO(pgv): duration bounds
	flush_access_log_on_new_request?: bool
	access_log_options?:              #HttpConnectionManager_HcmAccessLogOptions
	use_remote_address?:              bool
	xff_num_trusted_hops?:            uint32
	original_ip_detection_extensions?: [...v3_2.#TypedExtensionConfig]
	early_header_mutation_extensions?: [...v3_2.#TypedExtensionConfig]
	internal_address_config?:                           #HttpConnectionManager_InternalAddressConfig
	skip_xff_append?:                                   bool
	via?:                                               string // TODO(pgv): string well-known *validate.StringRules_WellKnownRegex
	generate_request_id?:                               bool
	preserve_external_request_id?:                      bool
	always_set_request_id_in_response?:                 bool
	forward_client_cert_details?:                       #HttpConnectionManager_ForwardClientCertDetails
	set_current_client_cert_details?:                   #HttpConnectionManager_SetCurrentClientCertDetails
	forward_client_cert_matcher?:                       v3_4.#Matcher
	proxy_100_continue?:                                bool
	represent_ipv4_remote_address_as_ipv4_mapped_ipv6?: bool
	upgrade_configs?: [...#HttpConnectionManager_UpgradeConfig]
	normalize_path?:                       bool
	merge_slashes?:                        bool
	path_with_escaped_slashes_action?:     #HttpConnectionManager_PathWithEscapedSlashesAction
	request_id_extension?:                 #RequestIDExtension
	local_reply_config?:                   #LocalReplyConfig
	strip_matching_host_port?:             bool
	strip_any_host_port?:                  bool
	stream_error_on_invalid_http_message?: bool
	path_normalization_options?:           #HttpConnectionManager_PathNormalizationOptions
	strip_trailing_host_dot?:              bool
	proxy_status_config?:                  #HttpConnectionManager_ProxyStatusConfig
	typed_header_validation_config?:       v3_2.#TypedExtensionConfig
	append_x_forwarded_port?:              bool
	append_local_overload?:                bool
	add_proxy_protocol_connection_state?:  bool
	forward_proto_config?:                 #ForwardProtoConfig
}

#HttpConnectionManager_Tracing: {
	"@type":              "type.googleapis.com/envoy.extensions.filters.network.http_connection_manager.v3.HttpConnectionManager.Tracing"
	client_sampling?:     v3_5.#Percent
	random_sampling?:     v3_5.#Percent
	overall_sampling?:    v3_5.#Percent
	verbose?:             bool
	max_path_tag_length?: uint32
	custom_tags?: [...v3_6.#CustomTag]
	provider?:            v3_7.#Tracing_Http
	spawn_upstream_span?: bool
	operation?:           string
	upstream_operation?:  string
}

#HttpConnectionManager_Tracing_OperationName: "INGRESS" | "EGRESS"

#HttpConnectionManager_InternalAddressConfig: {
	"@type":       "type.googleapis.com/envoy.extensions.filters.network.http_connection_manager.v3.HttpConnectionManager.InternalAddressConfig"
	unix_sockets?: bool
	cidr_ranges?: [...v3_2.#CidrRange]
}

#HttpConnectionManager_SetCurrentClientCertDetails: {
	"@type":  "type.googleapis.com/envoy.extensions.filters.network.http_connection_manager.v3.HttpConnectionManager.SetCurrentClientCertDetails"
	subject?: bool
	cert?:    bool
	chain?:   bool
	dns?:     bool
	uri?:     bool
}

#HttpConnectionManager_ForwardClientCertConfig: {
	"@type":                          "type.googleapis.com/envoy.extensions.filters.network.http_connection_manager.v3.HttpConnectionManager.ForwardClientCertConfig"
	forward_client_cert_details?:     #HttpConnectionManager_ForwardClientCertDetails
	set_current_client_cert_details?: #HttpConnectionManager_SetCurrentClientCertDetails
}

#HttpConnectionManager_UpgradeConfig: {
	"@type":       "type.googleapis.com/envoy.extensions.filters.network.http_connection_manager.v3.HttpConnectionManager.UpgradeConfig"
	upgrade_type?: string
	filters?: [...#HttpFilter]
	enabled?: bool
}

#HttpConnectionManager_PathNormalizationOptions: {
	"@type":                     "type.googleapis.com/envoy.extensions.filters.network.http_connection_manager.v3.HttpConnectionManager.PathNormalizationOptions"
	forwarding_transformation?:  v3_8.#PathTransformation
	http_filter_transformation?: v3_8.#PathTransformation
}

#HttpConnectionManager_ProxyStatusConfig: {
	"@type":                                "type.googleapis.com/envoy.extensions.filters.network.http_connection_manager.v3.HttpConnectionManager.ProxyStatusConfig"
	remove_details?:                        bool
	remove_connection_termination_details?: bool
	remove_response_flags?:                 bool
	set_recommended_response_code?:         bool
	use_node_id?:                           bool
	literal_proxy_name?:                    string
}

#HttpConnectionManager_HcmAccessLogOptions: {
	"@type":                                       "type.googleapis.com/envoy.extensions.filters.network.http_connection_manager.v3.HttpConnectionManager.HcmAccessLogOptions"
	access_log_flush_interval?:                    string // TODO(pgv): duration bounds
	flush_access_log_on_new_request?:              bool
	flush_log_on_tunnel_successfully_established?: bool
}

#HttpConnectionManager_CodecType: "AUTO" | "HTTP1" | "HTTP2" | "HTTP3"

#HttpConnectionManager_ServerHeaderTransformation: "OVERWRITE" | "APPEND_IF_ABSENT" | "PASS_THROUGH"

#HttpConnectionManager_ForwardClientCertDetails: "SANITIZE" | "FORWARD_ONLY" | "APPEND_FORWARD" | "SANITIZE_SET" | "ALWAYS_FORWARD_ONLY"

#HttpConnectionManager_PathWithEscapedSlashesAction: "IMPLEMENTATION_SPECIFIC_DEFAULT" | "KEEP_UNCHANGED" | "REJECT_REQUEST" | "UNESCAPE_AND_REDIRECT" | "UNESCAPE_AND_FORWARD"

#ForwardProtoConfig: {
	"@type": "type.googleapis.com/envoy.extensions.filters.network.http_connection_manager.v3.ForwardProtoConfig"
	https_destination_ports?: [...uint32]
	http_destination_ports?: [...uint32]
}

#LocalReplyConfig: {
	"@type": "type.googleapis.com/envoy.extensions.filters.network.http_connection_manager.v3.LocalReplyConfig"
	mappers?: [...#ResponseMapper]
	body_format?: v3_2.#SubstitutionFormatString
}

#ResponseMapper: {
	"@type":               "type.googleapis.com/envoy.extensions.filters.network.http_connection_manager.v3.ResponseMapper"
	filter!:               v3_3.#AccessLogFilter
	status_code?:          uint32 & >=200 & <600
	body?:                 v3_2.#DataSource
	body_format_override?: v3_2.#SubstitutionFormatString
	headers_to_add?: [...v3_2.#HeaderValueOption] & list.MaxItems(1000)
}

#Rds: {
	"@type":            "type.googleapis.com/envoy.extensions.filters.network.http_connection_manager.v3.Rds"
	config_source?:     v3_2.#ConfigSource
	route_config_name?: string
}

#ScopedRouteConfigurationsList: {
	"@type": "type.googleapis.com/envoy.extensions.filters.network.http_connection_manager.v3.ScopedRouteConfigurationsList"
	scoped_route_configurations!: [...v3_1.#ScopedRouteConfiguration] & list.MinItems(1)
}

#ScopedRoutes: {
	"@type":                           "type.googleapis.com/envoy.extensions.filters.network.http_connection_manager.v3.ScopedRoutes"
	name!:                             string & strings.MinRunes(1)
	scope_key_builder!:                #ScopedRoutes_ScopeKeyBuilder
	rds_config_source?:                v3_2.#ConfigSource
	scoped_route_configurations_list?: #ScopedRouteConfigurationsList
	scoped_rds?:                       #ScopedRds
}

#ScopedRoutes_ScopeKeyBuilder: {
	"@type": "type.googleapis.com/envoy.extensions.filters.network.http_connection_manager.v3.ScopedRoutes.ScopeKeyBuilder"
	fragments!: [...#ScopedRoutes_ScopeKeyBuilder_FragmentBuilder] & list.MinItems(1)
}

#ScopedRoutes_ScopeKeyBuilder_FragmentBuilder: {
	"@type":                 "type.googleapis.com/envoy.extensions.filters.network.http_connection_manager.v3.ScopedRoutes.ScopeKeyBuilder.FragmentBuilder"
	header_value_extractor?: #ScopedRoutes_ScopeKeyBuilder_FragmentBuilder_HeaderValueExtractor
}

#ScopedRoutes_ScopeKeyBuilder_FragmentBuilder_HeaderValueExtractor: {
	"@type":            "type.googleapis.com/envoy.extensions.filters.network.http_connection_manager.v3.ScopedRoutes.ScopeKeyBuilder.FragmentBuilder.HeaderValueExtractor"
	name!:              string & strings.MinRunes(1) // TODO(pgv): string well-known *validate.StringRules_WellKnownRegex
	element_separator?: string
	index?:             uint32
	element?:           #ScopedRoutes_ScopeKeyBuilder_FragmentBuilder_HeaderValueExtractor_KvElement
}

#ScopedRoutes_ScopeKeyBuilder_FragmentBuilder_HeaderValueExtractor_KvElement: {
	"@type":    "type.googleapis.com/envoy.extensions.filters.network.http_connection_manager.v3.ScopedRoutes.ScopeKeyBuilder.FragmentBuilder.HeaderValueExtractor.KvElement"
	separator!: string & strings.MinRunes(1)
	key!:       string & strings.MinRunes(1)
}

#ScopedRds: {
	"@type":                   "type.googleapis.com/envoy.extensions.filters.network.http_connection_manager.v3.ScopedRds"
	scoped_rds_config_source!: v3_2.#ConfigSource
	srds_resources_locator?:   string
}

#HttpFilter: {
	"@type": "type.googleapis.com/envoy.extensions.filters.network.http_connection_manager.v3.HttpFilter"
	name!:   string & strings.MinRunes(1)
	typed_config?: {...}
	config_discovery?: v3_2.#ExtensionConfigSource
	is_optional?:      bool
	disabled?:         bool
}

#RequestIDExtension: {
	"@type": "type.googleapis.com/envoy.extensions.filters.network.http_connection_manager.v3.RequestIDExtension"
	typed_config?: {...}
}

#EnvoyMobileHttpConnectionManager: {
	"@type": "type.googleapis.com/envoy.extensions.filters.network.http_connection_manager.v3.EnvoyMobileHttpConnectionManager"
	config?: #HttpConnectionManager
}
