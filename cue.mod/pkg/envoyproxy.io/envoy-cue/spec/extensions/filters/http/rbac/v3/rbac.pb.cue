// Code generated from envoy/extensions/filters/http/rbac/v3/rbac.proto. DO NOT EDIT.
package v3

import (
	v3_1 "envoyproxy.io/envoy-cue/spec/config/rbac/v3"
	v3_2 "envoyproxy.io/envoy-cue/spec/deps/cncf/xds/go/xds/type/matcher/v3"
)

#RBAC: {
	"@type":                   "type.googleapis.com/envoy.extensions.filters.http.rbac.v3.RBAC"
	rules?:                    v3_1.#RBAC
	rules_stat_prefix?:        string
	matcher?:                  v3_2.#Matcher
	shadow_rules?:             v3_1.#RBAC
	shadow_matcher?:           v3_2.#Matcher
	shadow_rules_stat_prefix?: string
	track_per_rule_stats?:     bool
}

#RBACPerRoute: {
	"@type": "type.googleapis.com/envoy.extensions.filters.http.rbac.v3.RBACPerRoute"
	rbac?:   #RBAC
}
