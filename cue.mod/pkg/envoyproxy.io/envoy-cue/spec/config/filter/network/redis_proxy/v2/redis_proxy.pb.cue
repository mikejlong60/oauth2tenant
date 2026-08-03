// Code generated from envoy/config/filter/network/redis_proxy/v2/redis_proxy.proto. DO NOT EDIT.
package v2

import (
	core_1 "envoyproxy.io/envoy-cue/spec/api/v2/core"
)

#RedisProxy: {
	"@type":                   "type.googleapis.com/envoy.config.filter.network.redis_proxy.v2.RedisProxy"
	stat_prefix!:              string & !=""
	cluster?:                  string
	settings!:                 #RedisProxy_ConnPoolSettings
	latency_in_micros?:        bool
	prefix_routes?:            #RedisProxy_PrefixRoutes
	downstream_auth_password?: core_1.#DataSource
}

#RedisProxy_ConnPoolSettings: {
	"@type":                           "type.googleapis.com/envoy.config.filter.network.redis_proxy.v2.RedisProxy.ConnPoolSettings"
	op_timeout!:                       string
	enable_hashtagging?:               bool
	enable_redirection?:               bool
	max_buffer_size_before_flush?:     uint32
	buffer_flush_timeout?:             string
	max_upstream_unknown_connections?: uint32
	enable_command_stats?:             bool
	read_policy?:                      #RedisProxy_ConnPoolSettings_ReadPolicy
}

#RedisProxy_ConnPoolSettings_ReadPolicy: "MASTER" | "PREFER_MASTER" | "REPLICA" | "PREFER_REPLICA" | "ANY"

#RedisProxy_PrefixRoutes: {
	"@type": "type.googleapis.com/envoy.config.filter.network.redis_proxy.v2.RedisProxy.PrefixRoutes"
	routes?: [...#RedisProxy_PrefixRoutes_Route]
	case_insensitive?:  bool
	catch_all_cluster?: string
	catch_all_route?:   #RedisProxy_PrefixRoutes_Route
}

#RedisProxy_PrefixRoutes_Route: {
	"@type":        "type.googleapis.com/envoy.config.filter.network.redis_proxy.v2.RedisProxy.PrefixRoutes.Route"
	prefix?:        string
	remove_prefix?: bool
	cluster!:       string & !=""
	request_mirror_policy?: [...#RedisProxy_PrefixRoutes_Route_RequestMirrorPolicy]
}

#RedisProxy_PrefixRoutes_Route_RequestMirrorPolicy: {
	"@type":                "type.googleapis.com/envoy.config.filter.network.redis_proxy.v2.RedisProxy.PrefixRoutes.Route.RequestMirrorPolicy"
	cluster!:               string & !=""
	runtime_fraction?:      core_1.#RuntimeFractionalPercent
	exclude_read_commands?: bool
}

#RedisProtocolOptions: {
	"@type":        "type.googleapis.com/envoy.config.filter.network.redis_proxy.v2.RedisProtocolOptions"
	auth_password?: core_1.#DataSource
}
