// Code generated from envoy/api/v2/route/route_components.proto. DO NOT EDIT.
package route

import (
	"list"
	core_1 "envoyproxy.io/envoy-cue/spec/api/v2/core"
	matcher_2 "envoyproxy.io/envoy-cue/spec/type/matcher"
	type_3 "envoyproxy.io/envoy-cue/spec/type"
	v2_4 "envoyproxy.io/envoy-cue/spec/type/tracing/v2"
)

#VirtualHost: {
	"@type": "type.googleapis.com/envoy.api.v2.route.VirtualHost"
	name!:   string & !=""
	domains!: [...string] & list.MinItems(1)
	routes?: [...#Route]
	require_tls?: #VirtualHost_TlsRequirementType
	virtual_clusters?: [...#VirtualCluster]
	rate_limits?: [...#RateLimit]
	request_headers_to_add?: [...core_1.#HeaderValueOption] & list.MaxItems(1000)
	request_headers_to_remove?: [...string]
	response_headers_to_add?: [...core_1.#HeaderValueOption] & list.MaxItems(1000)
	response_headers_to_remove?: [...string]
	cors?: #CorsPolicy
	per_filter_config?: {[string]: {...}}
	typed_per_filter_config?: {[string]: {...}}
	include_request_attempt_count?:     bool
	include_attempt_count_in_response?: bool
	retry_policy?:                      #RetryPolicy
	retry_policy_typed_config?: {...}
	hedge_policy?:                   #HedgePolicy
	per_request_buffer_limit_bytes?: uint32
}

#VirtualHost_TlsRequirementType: "NONE" | "EXTERNAL_ONLY" | "ALL"

#FilterAction: {
	"@type": "type.googleapis.com/envoy.api.v2.route.FilterAction"
	action?: {...}
}

#Route: {
	"@type":    "type.googleapis.com/envoy.api.v2.route.Route"
	name?:      string
	match!:     #RouteMatch
	metadata?:  core_1.#Metadata
	decorator?: #Decorator
	per_filter_config?: {[string]: {...}}
	typed_per_filter_config?: {[string]: {...}}
	request_headers_to_add?: [...core_1.#HeaderValueOption] & list.MaxItems(1000)
	request_headers_to_remove?: [...string]
	response_headers_to_add?: [...core_1.#HeaderValueOption] & list.MaxItems(1000)
	response_headers_to_remove?: [...string]
	tracing?:                        #Tracing
	per_request_buffer_limit_bytes?: uint32

	// oneof action: exactly one must be set
	{route!: #RouteAction} |
	{redirect!: #RedirectAction} |
	{direct_response!: #DirectResponseAction} |
	{filter_action!: #FilterAction}
}

#WeightedCluster: {
	"@type": "type.googleapis.com/envoy.api.v2.route.WeightedCluster"
	clusters!: [...#WeightedCluster_ClusterWeight] & list.MinItems(1)
	total_weight?:       uint32 & >=1
	runtime_key_prefix?: string
}

#WeightedCluster_ClusterWeight: {
	"@type":         "type.googleapis.com/envoy.api.v2.route.WeightedCluster.ClusterWeight"
	name!:           string & !=""
	weight?:         uint32
	metadata_match?: core_1.#Metadata
	request_headers_to_add?: [...core_1.#HeaderValueOption] & list.MaxItems(1000)
	request_headers_to_remove?: [...string]
	response_headers_to_add?: [...core_1.#HeaderValueOption] & list.MaxItems(1000)
	response_headers_to_remove?: [...string]
	per_filter_config?: {[string]: {...}}
	typed_per_filter_config?: {[string]: {...}}
}

#RouteMatch: {
	"@type":           "type.googleapis.com/envoy.api.v2.route.RouteMatch"
	case_sensitive?:   bool
	runtime_fraction?: core_1.#RuntimeFractionalPercent
	headers?: [...#HeaderMatcher]
	query_parameters?: [...#QueryParameterMatcher]
	grpc?:        #RouteMatch_GrpcRouteMatchOptions
	tls_context?: #RouteMatch_TlsContextMatchOptions

	// oneof path_specifier: exactly one must be set
	{prefix!: string} |
	{path!: string} |
	{regex!: string} |
	{safe_regex!: matcher_2.#RegexMatcher}
}

#RouteMatch_GrpcRouteMatchOptions: {
	"@type": "type.googleapis.com/envoy.api.v2.route.RouteMatch.GrpcRouteMatchOptions"
}

#RouteMatch_TlsContextMatchOptions: {
	"@type":    "type.googleapis.com/envoy.api.v2.route.RouteMatch.TlsContextMatchOptions"
	presented?: bool
	validated?: bool
}

#CorsPolicy: {
	"@type": "type.googleapis.com/envoy.api.v2.route.CorsPolicy"
	allow_origin?: [...string]
	allow_origin_regex?: [...string]
	allow_origin_string_match?: [...matcher_2.#StringMatcher]
	allow_methods?:     string
	allow_headers?:     string
	expose_headers?:    string
	max_age?:           string
	allow_credentials?: bool
	shadow_enabled?:    core_1.#RuntimeFractionalPercent

	// oneof enabled_specifier: at most one may be set
	*{} |
	{enabled!: bool} |
	{filter_enabled!: core_1.#RuntimeFractionalPercent}
}

#RouteAction: {
	"@type":                          "type.googleapis.com/envoy.api.v2.route.RouteAction"
	cluster_not_found_response_code?: #RouteAction_ClusterNotFoundResponseCode
	metadata_match?:                  core_1.#Metadata
	prefix_rewrite?:                  string // TODO(pgv): string well-known *validate.StringRules_WellKnownRegex
	regex_rewrite?:                   matcher_2.#RegexMatchAndSubstitute
	timeout?:                         string
	idle_timeout?:                    string
	retry_policy?:                    #RetryPolicy
	retry_policy_typed_config?: {...}
	request_mirror_policy?: #RouteAction_RequestMirrorPolicy
	request_mirror_policies?: [...#RouteAction_RequestMirrorPolicy]
	priority?: core_1.#RoutingPriority
	rate_limits?: [...#RateLimit]
	include_vh_rate_limits?: bool
	hash_policy?: [...#RouteAction_HashPolicy]
	cors?:                #CorsPolicy
	max_grpc_timeout?:    string
	grpc_timeout_offset?: string
	upgrade_configs?: [...#RouteAction_UpgradeConfig]
	internal_redirect_action?: #RouteAction_InternalRedirectAction
	max_internal_redirects?:   uint32
	hedge_policy?:             #HedgePolicy

	// oneof cluster_specifier: exactly one must be set
	// TODO(pgv): cluster_header.string well-known *validate.StringRules_WellKnownRegex
	{cluster!: string & !=""} |
	{cluster_header!: string & !=""} |
	{weighted_clusters!: #WeightedCluster}

	// oneof host_rewrite_specifier: at most one may be set
	// TODO(pgv): host_rewrite.string well-known *validate.StringRules_WellKnownRegex, auto_host_rewrite_header.string well-known *validate.StringRules_WellKnownRegex
	*{} |
	{host_rewrite!: string} |
	{auto_host_rewrite!: bool} |
	{auto_host_rewrite_header!: string}
}

#RouteAction_RequestMirrorPolicy: {
	"@type":           "type.googleapis.com/envoy.api.v2.route.RouteAction.RequestMirrorPolicy"
	cluster!:          string & !=""
	runtime_key?:      string
	runtime_fraction?: core_1.#RuntimeFractionalPercent
	trace_sampled?:    bool
}

#RouteAction_HashPolicy: {
	"@type":   "type.googleapis.com/envoy.api.v2.route.RouteAction.HashPolicy"
	terminal?: bool

	// oneof policy_specifier: exactly one must be set
	{header!: #RouteAction_HashPolicy_Header} |
	{cookie!: #RouteAction_HashPolicy_Cookie} |
	{connection_properties!: #RouteAction_HashPolicy_ConnectionProperties} |
	{query_parameter!: #RouteAction_HashPolicy_QueryParameter} |
	{filter_state!: #RouteAction_HashPolicy_FilterState}
}

#RouteAction_HashPolicy_Header: {
	"@type":      "type.googleapis.com/envoy.api.v2.route.RouteAction.HashPolicy.Header"
	header_name!: string & !="" // TODO(pgv): string well-known *validate.StringRules_WellKnownRegex
}

#RouteAction_HashPolicy_Cookie: {
	"@type": "type.googleapis.com/envoy.api.v2.route.RouteAction.HashPolicy.Cookie"
	name!:   string & !=""
	ttl?:    string
	path?:   string
}

#RouteAction_HashPolicy_ConnectionProperties: {
	"@type":    "type.googleapis.com/envoy.api.v2.route.RouteAction.HashPolicy.ConnectionProperties"
	source_ip?: bool
}

#RouteAction_HashPolicy_QueryParameter: {
	"@type": "type.googleapis.com/envoy.api.v2.route.RouteAction.HashPolicy.QueryParameter"
	name!:   string & !=""
}

#RouteAction_HashPolicy_FilterState: {
	"@type": "type.googleapis.com/envoy.api.v2.route.RouteAction.HashPolicy.FilterState"
	key!:    string & !=""
}

#RouteAction_UpgradeConfig: {
	"@type":       "type.googleapis.com/envoy.api.v2.route.RouteAction.UpgradeConfig"
	upgrade_type?: string // TODO(pgv): string well-known *validate.StringRules_WellKnownRegex
	enabled?:      bool
}

#RouteAction_ClusterNotFoundResponseCode: "SERVICE_UNAVAILABLE" | "NOT_FOUND"

#RouteAction_InternalRedirectAction: "PASS_THROUGH_INTERNAL_REDIRECT" | "HANDLE_INTERNAL_REDIRECT"

#RetryPolicy: {
	"@type":          "type.googleapis.com/envoy.api.v2.route.RetryPolicy"
	retry_on?:        string
	num_retries?:     uint32
	per_try_timeout?: string
	retry_priority?:  #RetryPolicy_RetryPriority
	retry_host_predicate?: [...#RetryPolicy_RetryHostPredicate]
	host_selection_retry_max_attempts?: int64
	retriable_status_codes?: [...uint32]
	retry_back_off?: #RetryPolicy_RetryBackOff
	retriable_headers?: [...#HeaderMatcher]
	retriable_request_headers?: [...#HeaderMatcher]
}

#RetryPolicy_RetryPriority: {
	"@type": "type.googleapis.com/envoy.api.v2.route.RetryPolicy.RetryPriority"
	name!:   string & !=""

	// oneof config_type: at most one may be set
	*{} |
	{config!: {...}} |
	{typed_config!: {...}}
}

#RetryPolicy_RetryHostPredicate: {
	"@type": "type.googleapis.com/envoy.api.v2.route.RetryPolicy.RetryHostPredicate"
	name!:   string & !=""

	// oneof config_type: at most one may be set
	*{} |
	{config!: {...}} |
	{typed_config!: {...}}
}

#RetryPolicy_RetryBackOff: {
	"@type":        "type.googleapis.com/envoy.api.v2.route.RetryPolicy.RetryBackOff"
	base_interval!: string // TODO(pgv): duration bounds
	max_interval?:  string // TODO(pgv): duration bounds
}

#HedgePolicy: {
	"@type":                    "type.googleapis.com/envoy.api.v2.route.HedgePolicy"
	initial_requests?:          uint32 & >=1
	additional_request_chance?: type_3.#FractionalPercent
	hedge_on_per_try_timeout?:  bool
}

#RedirectAction: {
	"@type":        "type.googleapis.com/envoy.api.v2.route.RedirectAction"
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
	{prefix_rewrite!: string}
}

#RedirectAction_RedirectResponseCode: "MOVED_PERMANENTLY" | "FOUND" | "SEE_OTHER" | "TEMPORARY_REDIRECT" | "PERMANENT_REDIRECT"

#DirectResponseAction: {
	"@type": "type.googleapis.com/envoy.api.v2.route.DirectResponseAction"
	status?: uint32 & >=100 & <600
	body?:   core_1.#DataSource
}

#Decorator: {
	"@type":    "type.googleapis.com/envoy.api.v2.route.Decorator"
	operation!: string & !=""
	propagate?: bool
}

#Tracing: {
	"@type":           "type.googleapis.com/envoy.api.v2.route.Tracing"
	client_sampling?:  type_3.#FractionalPercent
	random_sampling?:  type_3.#FractionalPercent
	overall_sampling?: type_3.#FractionalPercent
	custom_tags?: [...v2_4.#CustomTag]
}

#VirtualCluster: {
	"@type":  "type.googleapis.com/envoy.api.v2.route.VirtualCluster"
	pattern?: string
	headers?: [...#HeaderMatcher]
	name!:   string & !=""
	method?: core_1.#RequestMethod
}

#RateLimit: {
	"@type":      "type.googleapis.com/envoy.api.v2.route.RateLimit"
	stage?:       uint32 & <=10
	disable_key?: string
	actions!: [...#RateLimit_Action] & list.MinItems(1)
}

#RateLimit_Action: {
	"@type": "type.googleapis.com/envoy.api.v2.route.RateLimit.Action"

	// oneof action_specifier: exactly one must be set
	{source_cluster!: #RateLimit_Action_SourceCluster} |
	{destination_cluster!: #RateLimit_Action_DestinationCluster} |
	{request_headers!: #RateLimit_Action_RequestHeaders} |
	{remote_address!: #RateLimit_Action_RemoteAddress} |
	{generic_key!: #RateLimit_Action_GenericKey} |
	{header_value_match!: #RateLimit_Action_HeaderValueMatch}
}

#RateLimit_Action_SourceCluster: {
	"@type": "type.googleapis.com/envoy.api.v2.route.RateLimit.Action.SourceCluster"
}

#RateLimit_Action_DestinationCluster: {
	"@type": "type.googleapis.com/envoy.api.v2.route.RateLimit.Action.DestinationCluster"
}

#RateLimit_Action_RequestHeaders: {
	"@type":         "type.googleapis.com/envoy.api.v2.route.RateLimit.Action.RequestHeaders"
	header_name!:    string & !="" // TODO(pgv): string well-known *validate.StringRules_WellKnownRegex
	descriptor_key!: string & !=""
}

#RateLimit_Action_RemoteAddress: {
	"@type": "type.googleapis.com/envoy.api.v2.route.RateLimit.Action.RemoteAddress"
}

#RateLimit_Action_GenericKey: {
	"@type":           "type.googleapis.com/envoy.api.v2.route.RateLimit.Action.GenericKey"
	descriptor_value!: string & !=""
}

#RateLimit_Action_HeaderValueMatch: {
	"@type":           "type.googleapis.com/envoy.api.v2.route.RateLimit.Action.HeaderValueMatch"
	descriptor_value!: string & !=""
	expect_match?:     bool
	headers!: [...#HeaderMatcher] & list.MinItems(1)
}

#HeaderMatcher: {
	"@type":       "type.googleapis.com/envoy.api.v2.route.HeaderMatcher"
	name!:         string & !="" // TODO(pgv): string well-known *validate.StringRules_WellKnownRegex
	invert_match?: bool

	// oneof header_match_specifier: at most one may be set
	*{} |
	{exact_match!: string} |
	{regex_match!: string} |
	{safe_regex_match!: matcher_2.#RegexMatcher} |
	{range_match!: type_3.#Int64Range} |
	{present_match!: bool} |
	{prefix_match!: string & !=""} |
	{suffix_match!: string & !=""}
}

#QueryParameterMatcher: {
	"@type": "type.googleapis.com/envoy.api.v2.route.QueryParameterMatcher"
	name!:   string & !=""
	value?:  string
	regex?:  bool

	// oneof query_parameter_match_specifier: at most one may be set
	*{} |
	{string_match!: matcher_2.#StringMatcher} |
	{present_match!: bool}
}
