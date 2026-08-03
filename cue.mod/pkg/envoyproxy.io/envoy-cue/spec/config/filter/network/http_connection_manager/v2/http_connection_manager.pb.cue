// Code generated from envoy/config/filter/network/http_connection_manager/v2/http_connection_manager.proto. DO NOT EDIT.
package v2

import (
	"list"
	core_2 "envoyproxy.io/envoy-cue/spec/api/v2/core"
	type_4 "envoyproxy.io/envoy-cue/spec/type"
	v2_1 "envoyproxy.io/envoy-cue/spec/api/v2"
	v2_3 "envoyproxy.io/envoy-cue/spec/config/filter/accesslog/v2"
	v2_5 "envoyproxy.io/envoy-cue/spec/type/tracing/v2"
	v2_6 "envoyproxy.io/envoy-cue/spec/config/trace/v2"
)

#HttpConnectionManager: {
	"@type":        "type.googleapis.com/envoy.config.filter.network.http_connection_manager.v2.HttpConnectionManager"
	codec_type?:    #HttpConnectionManager_CodecType
	stat_prefix!:   string & !=""
	rds?:           #Rds
	route_config?:  v2_1.#RouteConfiguration
	scoped_routes?: #ScopedRoutes
	http_filters?: [...#HttpFilter]
	add_user_agent?:               bool
	tracing?:                      #HttpConnectionManager_Tracing
	common_http_protocol_options?: core_2.#HttpProtocolOptions
	http_protocol_options?:        core_2.#Http1ProtocolOptions
	http2_protocol_options?:       core_2.#Http2ProtocolOptions
	server_name?:                  string
	server_header_transformation?: #HttpConnectionManager_ServerHeaderTransformation
	max_request_headers_kb?:       uint32 & >0 & <=8192
	idle_timeout?:                 string
	stream_idle_timeout?:          string
	request_timeout?:              string
	drain_timeout?:                string
	delayed_close_timeout?:        string
	access_log?: [...v2_3.#AccessLog]
	use_remote_address?:                                bool
	xff_num_trusted_hops?:                              uint32
	internal_address_config?:                           #HttpConnectionManager_InternalAddressConfig
	skip_xff_append?:                                   bool
	via?:                                               string
	generate_request_id?:                               bool
	preserve_external_request_id?:                      bool
	forward_client_cert_details?:                       #HttpConnectionManager_ForwardClientCertDetails
	set_current_client_cert_details?:                   #HttpConnectionManager_SetCurrentClientCertDetails
	proxy_100_continue?:                                bool
	represent_ipv4_remote_address_as_ipv4_mapped_ipv6?: bool
	upgrade_configs?: [...#HttpConnectionManager_UpgradeConfig]
	normalize_path?:       bool
	merge_slashes?:        bool
	request_id_extension?: #RequestIDExtension
}

#HttpConnectionManager_Tracing: {
	"@type":         "type.googleapis.com/envoy.config.filter.network.http_connection_manager.v2.HttpConnectionManager.Tracing"
	operation_name?: #HttpConnectionManager_Tracing_OperationName
	request_headers_for_tags?: [...string]
	client_sampling?:     type_4.#Percent
	random_sampling?:     type_4.#Percent
	overall_sampling?:    type_4.#Percent
	verbose?:             bool
	max_path_tag_length?: uint32
	custom_tags?: [...v2_5.#CustomTag]
	provider?: v2_6.#Tracing_Http
}

#HttpConnectionManager_Tracing_OperationName: "INGRESS" | "EGRESS"

#HttpConnectionManager_InternalAddressConfig: {
	"@type":       "type.googleapis.com/envoy.config.filter.network.http_connection_manager.v2.HttpConnectionManager.InternalAddressConfig"
	unix_sockets?: bool
}

#HttpConnectionManager_SetCurrentClientCertDetails: {
	"@type":  "type.googleapis.com/envoy.config.filter.network.http_connection_manager.v2.HttpConnectionManager.SetCurrentClientCertDetails"
	subject?: bool
	cert?:    bool
	chain?:   bool
	dns?:     bool
	uri?:     bool
}

#HttpConnectionManager_UpgradeConfig: {
	"@type":       "type.googleapis.com/envoy.config.filter.network.http_connection_manager.v2.HttpConnectionManager.UpgradeConfig"
	upgrade_type?: string
	filters?: [...#HttpFilter]
	enabled?: bool
}

#HttpConnectionManager_CodecType: "AUTO" | "HTTP1" | "HTTP2" | "HTTP3"

#HttpConnectionManager_ServerHeaderTransformation: "OVERWRITE" | "APPEND_IF_ABSENT" | "PASS_THROUGH"

#HttpConnectionManager_ForwardClientCertDetails: "SANITIZE" | "FORWARD_ONLY" | "APPEND_FORWARD" | "SANITIZE_SET" | "ALWAYS_FORWARD_ONLY"

#Rds: {
	"@type":            "type.googleapis.com/envoy.config.filter.network.http_connection_manager.v2.Rds"
	config_source!:     core_2.#ConfigSource
	route_config_name!: string & !=""
}

#ScopedRouteConfigurationsList: {
	"@type": "type.googleapis.com/envoy.config.filter.network.http_connection_manager.v2.ScopedRouteConfigurationsList"
	scoped_route_configurations!: [...v2_1.#ScopedRouteConfiguration] & list.MinItems(1)
}

#ScopedRoutes: {
	"@type":                           "type.googleapis.com/envoy.config.filter.network.http_connection_manager.v2.ScopedRoutes"
	name!:                             string & !=""
	scope_key_builder!:                #ScopedRoutes_ScopeKeyBuilder
	rds_config_source!:                core_2.#ConfigSource
	scoped_route_configurations_list?: #ScopedRouteConfigurationsList
	scoped_rds?:                       #ScopedRds
}

#ScopedRoutes_ScopeKeyBuilder: {
	"@type": "type.googleapis.com/envoy.config.filter.network.http_connection_manager.v2.ScopedRoutes.ScopeKeyBuilder"
	fragments!: [...#ScopedRoutes_ScopeKeyBuilder_FragmentBuilder] & list.MinItems(1)
}

#ScopedRoutes_ScopeKeyBuilder_FragmentBuilder: {
	"@type":                 "type.googleapis.com/envoy.config.filter.network.http_connection_manager.v2.ScopedRoutes.ScopeKeyBuilder.FragmentBuilder"
	header_value_extractor?: #ScopedRoutes_ScopeKeyBuilder_FragmentBuilder_HeaderValueExtractor
}

#ScopedRoutes_ScopeKeyBuilder_FragmentBuilder_HeaderValueExtractor: {
	"@type":            "type.googleapis.com/envoy.config.filter.network.http_connection_manager.v2.ScopedRoutes.ScopeKeyBuilder.FragmentBuilder.HeaderValueExtractor"
	name!:              string & !=""
	element_separator?: string
	index?:             uint32
	element?:           #ScopedRoutes_ScopeKeyBuilder_FragmentBuilder_HeaderValueExtractor_KvElement
}

#ScopedRoutes_ScopeKeyBuilder_FragmentBuilder_HeaderValueExtractor_KvElement: {
	"@type":    "type.googleapis.com/envoy.config.filter.network.http_connection_manager.v2.ScopedRoutes.ScopeKeyBuilder.FragmentBuilder.HeaderValueExtractor.KvElement"
	separator!: string & !=""
	key!:       string & !=""
}

#ScopedRds: {
	"@type":                   "type.googleapis.com/envoy.config.filter.network.http_connection_manager.v2.ScopedRds"
	scoped_rds_config_source!: core_2.#ConfigSource
}

#HttpFilter: {
	"@type": "type.googleapis.com/envoy.config.filter.network.http_connection_manager.v2.HttpFilter"
	name!:   string & !=""
	config?: {...}
	typed_config?: {...}
}

#RequestIDExtension: {
	"@type": "type.googleapis.com/envoy.config.filter.network.http_connection_manager.v2.RequestIDExtension"
	typed_config?: {...}
}
