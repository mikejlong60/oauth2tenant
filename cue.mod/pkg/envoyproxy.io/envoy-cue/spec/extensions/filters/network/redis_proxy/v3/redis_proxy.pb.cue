// Code generated from envoy/extensions/filters/network/redis_proxy/v3/redis_proxy.proto. DO NOT EDIT.
package v3

import (
	"strings"
	v3_1 "envoyproxy.io/envoy-cue/spec/config/core/v3"
	v3_2 "envoyproxy.io/envoy-cue/spec/extensions/common/dynamic_forward_proxy/v3"
	v3_3 "envoyproxy.io/envoy-cue/spec/extensions/common/aws/v3"
)

#RedisProxy: {
	"@type":                   "type.googleapis.com/envoy.extensions.filters.network.redis_proxy.v3.RedisProxy"
	stat_prefix!:              string & strings.MinRunes(1)
	settings!:                 #RedisProxy_ConnPoolSettings
	latency_in_micros?:        bool
	prefix_routes?:            #RedisProxy_PrefixRoutes
	downstream_auth_password?: v3_1.#DataSource
	downstream_auth_passwords?: [...v3_1.#DataSource]
	faults?: [...#RedisProxy_RedisFault]
	downstream_auth_username?: v3_1.#DataSource
	external_auth_provider?:   #RedisExternalAuthProvider
	custom_commands?: [...string]
}

#RedisProxy_ConnPoolSettings: {
	"@type":                           "type.googleapis.com/envoy.extensions.filters.network.redis_proxy.v3.RedisProxy.ConnPoolSettings"
	op_timeout!:                       string
	enable_hashtagging?:               bool
	enable_redirection?:               bool
	dns_cache_config?:                 v3_2.#DnsCacheConfig
	max_buffer_size_before_flush?:     uint32
	buffer_flush_timeout?:             string
	max_upstream_unknown_connections?: uint32
	enable_command_stats?:             bool
	read_policy?:                      #RedisProxy_ConnPoolSettings_ReadPolicy
	connection_rate_limit?:            #RedisProxy_ConnectionRateLimit
}

#RedisProxy_ConnPoolSettings_ReadPolicy: "MASTER" | "PREFER_MASTER" | "REPLICA" | "PREFER_REPLICA" | "ANY"

#RedisProxy_PrefixRoutes: {
	"@type": "type.googleapis.com/envoy.extensions.filters.network.redis_proxy.v3.RedisProxy.PrefixRoutes"
	routes?: [...#RedisProxy_PrefixRoutes_Route]
	case_insensitive?: bool
	catch_all_route?:  #RedisProxy_PrefixRoutes_Route
}

#RedisProxy_PrefixRoutes_Route: {
	"@type":        "type.googleapis.com/envoy.extensions.filters.network.redis_proxy.v3.RedisProxy.PrefixRoutes.Route"
	prefix?:        string
	remove_prefix?: bool
	cluster!:       string & strings.MinRunes(1)
	request_mirror_policy?: [...#RedisProxy_PrefixRoutes_Route_RequestMirrorPolicy]
	key_formatter?:       string
	read_command_policy?: #RedisProxy_PrefixRoutes_Route_ReadCommandPolicy
}

#RedisProxy_PrefixRoutes_Route_RequestMirrorPolicy: {
	"@type":                "type.googleapis.com/envoy.extensions.filters.network.redis_proxy.v3.RedisProxy.PrefixRoutes.Route.RequestMirrorPolicy"
	cluster!:               string & strings.MinRunes(1)
	runtime_fraction?:      v3_1.#RuntimeFractionalPercent
	exclude_read_commands?: bool
}

#RedisProxy_PrefixRoutes_Route_ReadCommandPolicy: {
	"@type":  "type.googleapis.com/envoy.extensions.filters.network.redis_proxy.v3.RedisProxy.PrefixRoutes.Route.ReadCommandPolicy"
	cluster!: string & strings.MinRunes(1)
}

#RedisProxy_RedisFault: {
	"@type":        "type.googleapis.com/envoy.extensions.filters.network.redis_proxy.v3.RedisProxy.RedisFault"
	fault_type?:    #RedisProxy_RedisFault_RedisFaultType
	fault_enabled!: v3_1.#RuntimeFractionalPercent
	delay?:         string
	commands?: [...string]
}

#RedisProxy_RedisFault_RedisFaultType: "DELAY" | "ERROR"

#RedisProxy_ConnectionRateLimit: {
	"@type":                        "type.googleapis.com/envoy.extensions.filters.network.redis_proxy.v3.RedisProxy.ConnectionRateLimit"
	connection_rate_limit_per_sec?: uint32 & >0
}

#RedisProtocolOptions: {
	"@type":        "type.googleapis.com/envoy.extensions.filters.network.redis_proxy.v3.RedisProtocolOptions"
	auth_password?: v3_1.#DataSource
	auth_username?: v3_1.#DataSource
	aws_iam?:       #AwsIam
	credentials?: [...#RedisProtocolOptions_Credential]
}

#RedisProtocolOptions_Credential: {
	"@type":        "type.googleapis.com/envoy.extensions.filters.network.redis_proxy.v3.RedisProtocolOptions.Credential"
	address?:       v3_1.#Address
	auth_password?: v3_1.#DataSource
	auth_username?: v3_1.#DataSource
}

#AwsIam: {
	"@type":              "type.googleapis.com/envoy.extensions.filters.network.redis_proxy.v3.AwsIam"
	credential_provider?: v3_3.#AwsCredentialProvider
	cache_name!:          string & strings.MinRunes(1)
	service_name?:        string
	region?:              string
	expiration_time?:     string // TODO(pgv): duration bounds
}

#RedisExternalAuthProvider: {
	"@type":                 "type.googleapis.com/envoy.extensions.filters.network.redis_proxy.v3.RedisExternalAuthProvider"
	grpc_service?:           v3_1.#GrpcService
	enable_auth_expiration?: bool
}
