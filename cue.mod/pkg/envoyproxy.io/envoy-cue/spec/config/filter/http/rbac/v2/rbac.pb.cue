// Code generated from envoy/config/filter/http/rbac/v2/rbac.proto. DO NOT EDIT.
package v2

import (
	v2_1 "envoyproxy.io/envoy-cue/spec/config/rbac/v2"
)

#RBAC: {
	"@type":       "type.googleapis.com/envoy.config.filter.http.rbac.v2.RBAC"
	rules?:        v2_1.#RBAC
	shadow_rules?: v2_1.#RBAC
}

#RBACPerRoute: {
	"@type": "type.googleapis.com/envoy.config.filter.http.rbac.v2.RBACPerRoute"
	rbac?:   #RBAC
}
