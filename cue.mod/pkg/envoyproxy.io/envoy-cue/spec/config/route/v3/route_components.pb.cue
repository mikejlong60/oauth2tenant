// Code generated from envoy/config/route/v3/route_components.proto. DO NOT EDIT.
package v3

import (
	"list"
	"strings"
	v3_1 "envoyproxy.io/envoy-cue/spec/deps/cncf/xds/go/xds/type/matcher/v3"
	v3_2 "envoyproxy.io/envoy-cue/spec/config/core/v3"
	v3_3 "envoyproxy.io/envoy-cue/spec/type/matcher/v3"
	v3_4 "envoyproxy.io/envoy-cue/spec/config/common/mutation_rules/v3"
	v3_5 "envoyproxy.io/envoy-cue/spec/type/v3"
	v3_6 "envoyproxy.io/envoy-cue/spec/type/tracing/v3"
	v3_7 "envoyproxy.io/envoy-cue/spec/type/metadata/v3"
)

#VirtualHost: {
	"@type": "type.googleapis.com/envoy.config.route.v3.VirtualHost"
	name!:   string & strings.MinRunes(1)
	domains!: [...string] & list.MinItems(1)
	routes?: [...#Route]
	matcher?:     v3_1.#Matcher
	require_tls?: #VirtualHost_TlsRequirementType
	virtual_clusters?: [...#VirtualCluster]
	rate_limits?: [...#RateLimit]
	request_headers_to_add?: [...v3_2.#HeaderValueOption] & list.MaxItems(1000)
	request_headers_to_remove?: [...string]
	response_headers_to_add?: [...v3_2.#HeaderValueOption] & list.MaxItems(1000)
	response_headers_to_remove?: [...string]
	cors?: #CorsPolicy
	typed_per_filter_config?: {[string]: {...}}
	include_request_attempt_count?:     bool
	include_attempt_count_in_response?: bool
	retry_policy?:                      #RetryPolicy
	retry_policy_typed_config?: {...}
	hedge_policy?:                    #HedgePolicy
	include_is_timeout_retry_header?: bool
	per_request_buffer_limit_bytes?:  uint32
	request_body_buffer_limit?:       uint64
	request_mirror_policies?: [...#RouteAction_RequestMirrorPolicy]
	metadata?: v3_2.#Metadata
}

#VirtualHost_TlsRequirementType: "NONE" | "EXTERNAL_ONLY" | "ALL"

#FilterAction: {
	"@type": "type.googleapis.com/envoy.config.route.v3.FilterAction"
	action?: {...}
}

#RouteList: {
	"@type": "type.googleapis.com/envoy.config.route.v3.RouteList"
	routes?: [...#Route]
}

#Route: {
	"@type":    "type.googleapis.com/envoy.config.route.v3.Route"
	name?:      string
	match!:     #RouteMatch
	metadata?:  v3_2.#Metadata
	decorator?: #Decorator
	typed_per_filter_config?: {[string]: {...}}
	request_headers_to_add?: [...v3_2.#HeaderValueOption] & list.MaxItems(1000)
	request_headers_to_remove?: [...string]
	response_headers_to_add?: [...v3_2.#HeaderValueOption] & list.MaxItems(1000)
	response_headers_to_remove?: [...string]
	tracing?:                        #Tracing
	per_request_buffer_limit_bytes?: uint32
	stat_prefix?:                    string
	request_body_buffer_limit?:      uint64

	// oneof action: exactly one must be set
	{route!: #RouteAction} |
	{redirect!: #RedirectAction} |
	{direct_response!: #DirectResponseAction} |
	{filter_action!: #FilterAction} |
	{non_forwarding_action!: #NonForwardingAction}
}

#WeightedCluster: {
	"@type": "type.googleapis.com/envoy.config.route.v3.WeightedCluster"
	clusters!: [...#WeightedCluster_ClusterWeight] & list.MinItems(1)
	total_weight?:       uint32
	runtime_key_prefix?: string

	// oneof random_value_specifier: at most one may be set
	// TODO(pgv): header_name.string well-known *validate.StringRules_WellKnownRegex
	*{} |
	{header_name!: string} |
	{use_hash_policy!: bool}
}

#WeightedCluster_ClusterWeight: {
	"@type":         "type.googleapis.com/envoy.config.route.v3.WeightedCluster.ClusterWeight"
	name?:           string
	cluster_header?: string // TODO(pgv): string well-known *validate.StringRules_WellKnownRegex
	weight?:         uint32
	metadata_match?: v3_2.#Metadata
	request_headers_to_add?: [...v3_2.#HeaderValueOption] & list.MaxItems(1000)
	request_headers_to_remove?: [...string]
	response_headers_to_add?: [...v3_2.#HeaderValueOption] & list.MaxItems(1000)
	response_headers_to_remove?: [...string]
	typed_per_filter_config?: {[string]: {...}}

	// oneof host_rewrite_specifier: at most one may be set
	// TODO(pgv): host_rewrite_literal.string well-known *validate.StringRules_WellKnownRegex
	*{} |
	{host_rewrite_literal!: string}
}

#ClusterSpecifierPlugin: {
	"@type":      "type.googleapis.com/envoy.config.route.v3.ClusterSpecifierPlugin"
	extension!:   v3_2.#TypedExtensionConfig
	is_optional?: bool
}

#RouteMatch: {
	"@type":           "type.googleapis.com/envoy.config.route.v3.RouteMatch"
	case_sensitive?:   bool
	runtime_fraction?: v3_2.#RuntimeFractionalPercent
	headers?: [...#HeaderMatcher]
	query_parameters?: [...#QueryParameterMatcher]
	cookies?: [...#CookieMatcher]
	grpc?:        #RouteMatch_GrpcRouteMatchOptions
	tls_context?: #RouteMatch_TlsContextMatchOptions
	dynamic_metadata?: [...v3_3.#MetadataMatcher]
	filter_state?: [...v3_3.#FilterStateMatcher]

	// oneof path_specifier: exactly one must be set
	// TODO(pgv): path_separated_prefix.string.pattern
	{prefix!: string} |
	{path!: string} |
	{safe_regex!: v3_3.#RegexMatcher} |
	{connect_matcher!: #RouteMatch_ConnectMatcher} |
	{path_separated_prefix!: string} |
	{path_match_policy!: v3_2.#TypedExtensionConfig}
}

#RouteMatch_GrpcRouteMatchOptions: {
	"@type": "type.googleapis.com/envoy.config.route.v3.RouteMatch.GrpcRouteMatchOptions"
}

#RouteMatch_TlsContextMatchOptions: {
	"@type":    "type.googleapis.com/envoy.config.route.v3.RouteMatch.TlsContextMatchOptions"
	presented?: bool
	validated?: bool
}

#RouteMatch_ConnectMatcher: {
	"@type": "type.googleapis.com/envoy.config.route.v3.RouteMatch.ConnectMatcher"
}

#CorsPolicy: {
	"@type": "type.googleapis.com/envoy.config.route.v3.CorsPolicy"
	allow_origin_string_match?: [...v3_3.#StringMatcher]
	allow_methods?:                   string
	allow_headers?:                   string
	expose_headers?:                  string
	max_age?:                         string
	allow_credentials?:               bool
	shadow_enabled?:                  v3_2.#RuntimeFractionalPercent
	allow_private_network_access?:    bool
	forward_not_matching_preflights?: bool

	// oneof enabled_specifier: at most one may be set
	*{} |
	{filter_enabled!: v3_2.#RuntimeFractionalPercent}
}

#RouteAction: {
	"@type":                          "type.googleapis.com/envoy.config.route.v3.RouteAction"
	cluster_not_found_response_code?: #RouteAction_ClusterNotFoundResponseCode
	metadata_match?:                  v3_2.#Metadata
	prefix_rewrite?:                  string // TODO(pgv): string well-known *validate.StringRules_WellKnownRegex
	regex_rewrite?:                   v3_3.#RegexMatchAndSubstitute
	path_rewrite_policy?:             v3_2.#TypedExtensionConfig
	path_rewrite?:                    string
	append_x_forwarded_host?:         bool
	timeout?:                         string
	idle_timeout?:                    string
	flush_timeout?:                   string
	early_data_policy?:               v3_2.#TypedExtensionConfig
	retry_policy?:                    #RetryPolicy
	retry_policy_typed_config?: {...}
	request_mirror_policies?: [...#RouteAction_RequestMirrorPolicy]
	priority?: v3_2.#RoutingPriority
	rate_limits?: [...#RateLimit]
	include_vh_rate_limits?: bool
	hash_policy?: [...#RouteAction_HashPolicy]
	cors?:                #CorsPolicy
	max_grpc_timeout?:    string
	grpc_timeout_offset?: string
	upgrade_configs?: [...#RouteAction_UpgradeConfig]
	internal_redirect_policy?: #InternalRedirectPolicy
	internal_redirect_action?: #RouteAction_InternalRedirectAction
	max_internal_redirects?:   uint32
	hedge_policy?:             #HedgePolicy
	max_stream_duration?:      #RouteAction_MaxStreamDuration

	// oneof cluster_specifier: exactly one must be set
	// TODO(pgv): cluster_header.string well-known *validate.StringRules_WellKnownRegex
	{cluster!: string & strings.MinRunes(1)} |
	{cluster_header!: string & strings.MinRunes(1)} |
	{weighted_clusters!: #WeightedCluster} |
	{cluster_specifier_plugin!: string} |
	{inline_cluster_specifier_plugin!: #ClusterSpecifierPlugin}

	// oneof host_rewrite_specifier: at most one may be set
	// TODO(pgv): host_rewrite_literal.string well-known *validate.StringRules_WellKnownRegex, host_rewrite_header.string well-known *validate.StringRules_WellKnownRegex
	*{} |
	{host_rewrite_literal!: string} |
	{auto_host_rewrite!: bool} |
	{host_rewrite_header!: string} |
	{host_rewrite_path_regex!: v3_3.#RegexMatchAndSubstitute} |
	{host_rewrite!: string}
}

#RouteAction_RequestMirrorPolicy: {
	"@type":                            "type.googleapis.com/envoy.config.route.v3.RouteAction.RequestMirrorPolicy"
	cluster?:                           string
	cluster_header?:                    string // TODO(pgv): string well-known *validate.StringRules_WellKnownRegex
	runtime_fraction?:                  v3_2.#RuntimeFractionalPercent
	trace_sampled?:                     bool
	disable_shadow_host_suffix_append?: bool
	request_headers_mutations?: [...v3_4.#HeaderMutation] & list.MaxItems(1000)
	host_rewrite_literal?: string // TODO(pgv): string well-known *validate.StringRules_WellKnownRegex
}

#RouteAction_HashPolicy: {
	"@type":   "type.googleapis.com/envoy.config.route.v3.RouteAction.HashPolicy"
	terminal?: bool

	// oneof policy_specifier: exactly one must be set
	{header!: #RouteAction_HashPolicy_Header} |
	{cookie!: #RouteAction_HashPolicy_Cookie} |
	{connection_properties!: #RouteAction_HashPolicy_ConnectionProperties} |
	{query_parameter!: #RouteAction_HashPolicy_QueryParameter} |
	{filter_state!: #RouteAction_HashPolicy_FilterState}
}

#RouteAction_HashPolicy_Header: {
	"@type":        "type.googleapis.com/envoy.config.route.v3.RouteAction.HashPolicy.Header"
	header_name!:   string & strings.MinRunes(1) // TODO(pgv): string well-known *validate.StringRules_WellKnownRegex
	regex_rewrite?: v3_3.#RegexMatchAndSubstitute
}

#RouteAction_HashPolicy_CookieAttribute: {
	"@type": "type.googleapis.com/envoy.config.route.v3.RouteAction.HashPolicy.CookieAttribute"
	name!:   string & strings.MinRunes(1) // TODO(pgv): string well-known *validate.StringRules_WellKnownRegex
	value?:  string                       // TODO(pgv): string well-known *validate.StringRules_WellKnownRegex
}

#RouteAction_HashPolicy_Cookie: {
	"@type": "type.googleapis.com/envoy.config.route.v3.RouteAction.HashPolicy.Cookie"
	name!:   string & strings.MinRunes(1)
	ttl?:    string
	path?:   string
	attributes?: [...#RouteAction_HashPolicy_CookieAttribute]
}

#RouteAction_HashPolicy_ConnectionProperties: {
	"@type":    "type.googleapis.com/envoy.config.route.v3.RouteAction.HashPolicy.ConnectionProperties"
	source_ip?: bool
}

#RouteAction_HashPolicy_QueryParameter: {
	"@type": "type.googleapis.com/envoy.config.route.v3.RouteAction.HashPolicy.QueryParameter"
	name!:   string & strings.MinRunes(1)
}

#RouteAction_HashPolicy_FilterState: {
	"@type": "type.googleapis.com/envoy.config.route.v3.RouteAction.HashPolicy.FilterState"
	key!:    string & strings.MinRunes(1)
}

#RouteAction_UpgradeConfig: {
	"@type":         "type.googleapis.com/envoy.config.route.v3.RouteAction.UpgradeConfig"
	upgrade_type!:   string & strings.MinRunes(1) // TODO(pgv): string well-known *validate.StringRules_WellKnownRegex
	enabled?:        bool
	connect_config?: #RouteAction_UpgradeConfig_ConnectConfig
}

#RouteAction_UpgradeConfig_ConnectConfig: {
	"@type":                "type.googleapis.com/envoy.config.route.v3.RouteAction.UpgradeConfig.ConnectConfig"
	proxy_protocol_config?: v3_2.#ProxyProtocolConfig
	allow_post?:            bool
}

#RouteAction_MaxStreamDuration: {
	"@type":                     "type.googleapis.com/envoy.config.route.v3.RouteAction.MaxStreamDuration"
	max_stream_duration?:        string
	grpc_timeout_header_max?:    string
	grpc_timeout_header_offset?: string
}

#RouteAction_ClusterNotFoundResponseCode: "SERVICE_UNAVAILABLE" | "NOT_FOUND" | "INTERNAL_SERVER_ERROR"

#RouteAction_InternalRedirectAction: "PASS_THROUGH_INTERNAL_REDIRECT" | "HANDLE_INTERNAL_REDIRECT"

#RetryPolicy: {
	"@type":               "type.googleapis.com/envoy.config.route.v3.RetryPolicy"
	retry_on?:             string
	num_retries?:          uint32
	per_try_timeout?:      string
	per_try_idle_timeout?: string
	retry_priority?:       #RetryPolicy_RetryPriority
	retry_host_predicate?: [...#RetryPolicy_RetryHostPredicate]
	retry_options_predicates?: [...v3_2.#TypedExtensionConfig]
	host_selection_retry_max_attempts?: int64
	retriable_status_codes?: [...uint32]
	retry_back_off?:              #RetryPolicy_RetryBackOff
	rate_limited_retry_back_off?: #RetryPolicy_RateLimitedRetryBackOff
	retriable_headers?: [...#HeaderMatcher]
	retriable_request_headers?: [...#HeaderMatcher]
}

#RetryPolicy_RetryPriority: {
	"@type": "type.googleapis.com/envoy.config.route.v3.RetryPolicy.RetryPriority"
	name!:   string & strings.MinRunes(1)

	// oneof config_type: at most one may be set
	*{} |
	{typed_config!: {...}}
}

#RetryPolicy_RetryHostPredicate: {
	"@type": "type.googleapis.com/envoy.config.route.v3.RetryPolicy.RetryHostPredicate"
	name!:   string & strings.MinRunes(1)

	// oneof config_type: at most one may be set
	*{} |
	{typed_config!: {...}}
}

#RetryPolicy_RetryBackOff: {
	"@type":        "type.googleapis.com/envoy.config.route.v3.RetryPolicy.RetryBackOff"
	base_interval!: string // TODO(pgv): duration bounds
	max_interval?:  string // TODO(pgv): duration bounds
}

#RetryPolicy_ResetHeader: {
	"@type": "type.googleapis.com/envoy.config.route.v3.RetryPolicy.ResetHeader"
	name!:   string & strings.MinRunes(1) // TODO(pgv): string well-known *validate.StringRules_WellKnownRegex
	format?: #RetryPolicy_ResetHeaderFormat
}

#RetryPolicy_RateLimitedRetryBackOff: {
	"@type": "type.googleapis.com/envoy.config.route.v3.RetryPolicy.RateLimitedRetryBackOff"
	reset_headers!: [...#RetryPolicy_ResetHeader] & list.MinItems(1)
	max_interval?: string // TODO(pgv): duration bounds
}

#RetryPolicy_ResetHeaderFormat: "SECONDS" | "UNIX_TIMESTAMP"

#HedgePolicy: {
	"@type":                    "type.googleapis.com/envoy.config.route.v3.HedgePolicy"
	initial_requests?:          uint32 & >=1
	additional_request_chance?: v3_5.#FractionalPercent
	hedge_on_per_try_timeout?:  bool
}

#RedirectAction: {
	"@type":        "type.googleapis.com/envoy.config.route.v3.RedirectAction"
	host_redirect?: string // TODO(pgv): string well-known *validate.StringRules_WellKnownRegex
	port_redirect?: uint32
	response_code?: #RedirectAction_RedirectResponseCode
	strip_query?:   bool

	// oneof scheme_rewrite_specifier: at most one may be set
	*{} |
	{https_redirect!: bool} |
	{scheme_redirect!: string}

	// oneof path_rewrite_specifier: at most one may be set
	// TODO(pgv): path_redirect.string well-known *validate.StringRules_WellKnownRegex, prefix_rewrite.string well-known *validate.StringRules_WellKnownRegex
	*{} |
	{path_redirect!: string} |
	{prefix_rewrite!: string} |
	{regex_rewrite!: v3_3.#RegexMatchAndSubstitute}
}

#RedirectAction_RedirectResponseCode: "MOVED_PERMANENTLY" | "FOUND" | "SEE_OTHER" | "TEMPORARY_REDIRECT" | "PERMANENT_REDIRECT"

#DirectResponseAction: {
	"@type":      "type.googleapis.com/envoy.config.route.v3.DirectResponseAction"
	status?:      uint32 & >=200 & <600
	body?:        v3_2.#DataSource
	body_format?: v3_2.#SubstitutionFormatString
}

#NonForwardingAction: {
	"@type": "type.googleapis.com/envoy.config.route.v3.NonForwardingAction"
}

#Decorator: {
	"@type":    "type.googleapis.com/envoy.config.route.v3.Decorator"
	operation!: string & strings.MinRunes(1)
	propagate?: bool
}

#Tracing: {
	"@type":           "type.googleapis.com/envoy.config.route.v3.Tracing"
	client_sampling?:  v3_5.#FractionalPercent
	random_sampling?:  v3_5.#FractionalPercent
	overall_sampling?: v3_5.#FractionalPercent
	custom_tags?: [...v3_6.#CustomTag]
	operation?:          string
	upstream_operation?: string
}

#VirtualCluster: {
	"@type": "type.googleapis.com/envoy.config.route.v3.VirtualCluster"
	headers?: [...#HeaderMatcher]
	name!: string & strings.MinRunes(1)
}

#RateLimit: {
	"@type":      "type.googleapis.com/envoy.config.route.v3.RateLimit"
	stage?:       uint32 & <=10
	disable_key?: string
	actions!: [...#RateLimit_Action] & list.MinItems(1)
	limit?:                #RateLimit_Override
	hits_addend?:          #RateLimit_HitsAddend
	apply_on_stream_done?: bool
	x_ratelimit_option?:   #RateLimit_XRateLimitOption
}

#RateLimit_Action: {
	"@type": "type.googleapis.com/envoy.config.route.v3.RateLimit.Action"

	// oneof action_specifier: exactly one must be set
	{source_cluster!: #RateLimit_Action_SourceCluster} |
	{destination_cluster!: #RateLimit_Action_DestinationCluster} |
	{request_headers!: #RateLimit_Action_RequestHeaders} |
	{query_parameters!: #RateLimit_Action_QueryParameters} |
	{remote_address!: #RateLimit_Action_RemoteAddress} |
	{generic_key!: #RateLimit_Action_GenericKey} |
	{header_value_match!: #RateLimit_Action_HeaderValueMatch} |
	{dynamic_metadata!: #RateLimit_Action_DynamicMetaData} |
	{metadata!: #RateLimit_Action_MetaData} |
	{extension!: v3_2.#TypedExtensionConfig} |
	{masked_remote_address!: #RateLimit_Action_MaskedRemoteAddress} |
	{query_parameter_value_match!: #RateLimit_Action_QueryParameterValueMatch}
}

#RateLimit_Action_SourceCluster: {
	"@type": "type.googleapis.com/envoy.config.route.v3.RateLimit.Action.SourceCluster"
}

#RateLimit_Action_DestinationCluster: {
	"@type": "type.googleapis.com/envoy.config.route.v3.RateLimit.Action.DestinationCluster"
}

#RateLimit_Action_RequestHeaders: {
	"@type":         "type.googleapis.com/envoy.config.route.v3.RateLimit.Action.RequestHeaders"
	header_name!:    string & strings.MinRunes(1) // TODO(pgv): string well-known *validate.StringRules_WellKnownRegex
	descriptor_key!: string & strings.MinRunes(1)
	skip_if_absent?: bool
}

#RateLimit_Action_QueryParameters: {
	"@type":               "type.googleapis.com/envoy.config.route.v3.RateLimit.Action.QueryParameters"
	query_parameter_name!: string & strings.MinRunes(1)
	descriptor_key!:       string & strings.MinRunes(1)
	skip_if_absent?:       bool
}

#RateLimit_Action_RemoteAddress: {
	"@type": "type.googleapis.com/envoy.config.route.v3.RateLimit.Action.RemoteAddress"
}

#RateLimit_Action_MaskedRemoteAddress: {
	"@type":             "type.googleapis.com/envoy.config.route.v3.RateLimit.Action.MaskedRemoteAddress"
	v4_prefix_mask_len?: uint32 & <=32
	v6_prefix_mask_len?: uint32 & <=128
}

#RateLimit_Action_GenericKey: {
	"@type":           "type.googleapis.com/envoy.config.route.v3.RateLimit.Action.GenericKey"
	descriptor_value!: string & strings.MinRunes(1)
	default_value?:    string
	descriptor_key?:   string
}

#RateLimit_Action_HeaderValueMatch: {
	"@type":           "type.googleapis.com/envoy.config.route.v3.RateLimit.Action.HeaderValueMatch"
	descriptor_value!: string & strings.MinRunes(1)
	default_value?:    string
	descriptor_key?:   string
	expect_match?:     bool
	headers!: [...#HeaderMatcher] & list.MinItems(1)
}

#RateLimit_Action_DynamicMetaData: {
	"@type":         "type.googleapis.com/envoy.config.route.v3.RateLimit.Action.DynamicMetaData"
	descriptor_key!: string & strings.MinRunes(1)
	metadata_key!:   v3_7.#MetadataKey
	default_value?:  string
}

#RateLimit_Action_MetaData: {
	"@type":         "type.googleapis.com/envoy.config.route.v3.RateLimit.Action.MetaData"
	descriptor_key!: string & strings.MinRunes(1)
	metadata_key!:   v3_7.#MetadataKey
	default_value?:  string
	source?:         #RateLimit_Action_MetaData_Source
	skip_if_absent?: bool
}

#RateLimit_Action_MetaData_Source: "DYNAMIC" | "ROUTE_ENTRY"

#RateLimit_Action_QueryParameterValueMatch: {
	"@type":           "type.googleapis.com/envoy.config.route.v3.RateLimit.Action.QueryParameterValueMatch"
	descriptor_value!: string & strings.MinRunes(1)
	default_value?:    string
	descriptor_key?:   string
	expect_match?:     bool
	query_parameters!: [...#QueryParameterMatcher] & list.MinItems(1)
}

#RateLimit_Override: {
	"@type": "type.googleapis.com/envoy.config.route.v3.RateLimit.Override"

	// oneof override_specifier: exactly one must be set
	{dynamic_metadata!: #RateLimit_Override_DynamicMetadata}
}

#RateLimit_Override_DynamicMetadata: {
	"@type":       "type.googleapis.com/envoy.config.route.v3.RateLimit.Override.DynamicMetadata"
	metadata_key!: v3_7.#MetadataKey
}

#RateLimit_HitsAddend: {
	"@type": "type.googleapis.com/envoy.config.route.v3.RateLimit.HitsAddend"
	number?: uint64 & <=1000000000
	format?: string
}

#RateLimit_XRateLimitOption: "UNSPECIFIED" | "OFF" | "DRAFT_VERSION_03"

#HeaderMatcher: {
	"@type":                        "type.googleapis.com/envoy.config.route.v3.HeaderMatcher"
	name!:                          string & strings.MinRunes(1) // TODO(pgv): string well-known *validate.StringRules_WellKnownRegex
	invert_match?:                  bool
	treat_missing_header_as_empty?: bool

	// oneof header_match_specifier: at most one may be set
	*{} |
	{exact_match!: string} |
	{safe_regex_match!: v3_3.#RegexMatcher} |
	{range_match!: v3_5.#Int64Range} |
	{present_match!: bool} |
	{prefix_match!: string & strings.MinRunes(1)} |
	{suffix_match!: string & strings.MinRunes(1)} |
	{contains_match!: string & strings.MinRunes(1)} |
	{string_match!: v3_3.#StringMatcher}
}

#QueryParameterMatcher: {
	"@type": "type.googleapis.com/envoy.config.route.v3.QueryParameterMatcher"
	name!:   string & strings.MinRunes(1)

	// oneof query_parameter_match_specifier: at most one may be set
	*{} |
	{string_match!: v3_3.#StringMatcher} |
	{present_match!: bool}
}

#CookieMatcher: {
	"@type":       "type.googleapis.com/envoy.config.route.v3.CookieMatcher"
	name!:         string & strings.MinRunes(1)
	string_match!: v3_3.#StringMatcher
	invert_match?: bool
}

#InternalRedirectPolicy: {
	"@type":                 "type.googleapis.com/envoy.config.route.v3.InternalRedirectPolicy"
	max_internal_redirects?: uint32
	redirect_response_codes?: [...uint32] & list.MaxItems(5)
	predicates?: [...v3_2.#TypedExtensionConfig]
	allow_cross_scheme_redirect?: bool
	response_headers_to_copy?: [...string] // TODO(pgv): repeated.unique
}

#FilterConfig: {
	"@type": "type.googleapis.com/envoy.config.route.v3.FilterConfig"
	config?: {...}
	is_optional?: bool
	disabled?:    bool
}
