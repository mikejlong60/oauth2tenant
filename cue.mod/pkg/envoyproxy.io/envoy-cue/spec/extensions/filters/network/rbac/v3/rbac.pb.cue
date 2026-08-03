// Code generated from envoy/extensions/filters/network/rbac/v3/rbac.proto. DO NOT EDIT.
package v3

import (
	"strings"
	v3_1 "envoyproxy.io/envoy-cue/spec/config/rbac/v3"
	v3_2 "envoyproxy.io/envoy-cue/spec/deps/cncf/xds/go/xds/type/matcher/v3"
)

#RBAC: {
	"@type":                   "type.googleapis.com/envoy.extensions.filters.network.rbac.v3.RBAC"
	rules?:                    v3_1.#RBAC
	matcher?:                  v3_2.#Matcher
	shadow_rules?:             v3_1.#RBAC
	shadow_matcher?:           v3_2.#Matcher
	shadow_rules_stat_prefix?: string
	stat_prefix!:              string & strings.MinRunes(1)
	enforcement_type?:         #RBAC_EnforcementType
	delay_deny?:               string
}

#RBAC_EnforcementType: "ONE_TIME_ON_FIRST_BYTE" | "CONTINUOUS"
