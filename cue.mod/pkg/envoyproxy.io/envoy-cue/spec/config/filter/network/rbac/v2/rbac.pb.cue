// Code generated from envoy/config/filter/network/rbac/v2/rbac.proto. DO NOT EDIT.
package v2

import (
	v2_1 "envoyproxy.io/envoy-cue/spec/config/rbac/v2"
)

#RBAC: {
	"@type":           "type.googleapis.com/envoy.config.filter.network.rbac.v2.RBAC"
	rules?:            v2_1.#RBAC
	shadow_rules?:     v2_1.#RBAC
	stat_prefix!:      string & !=""
	enforcement_type?: #RBAC_EnforcementType
}

#RBAC_EnforcementType: "ONE_TIME_ON_FIRST_BYTE" | "CONTINUOUS"
