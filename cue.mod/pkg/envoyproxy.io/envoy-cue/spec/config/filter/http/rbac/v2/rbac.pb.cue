// Code generated from envoy/config/filter/http/rbac/v2/rbac.proto. DO NOT EDIT.
package v2

import (
	v2_1 "envoyproxy.io/envoy-cue/spec/config/rbac/v2"
)

// RBAC filter config.
#RBAC: {
	"@type": "type.googleapis.com/envoy.config.filter.http.rbac.v2.RBAC"

	// Specify the RBAC rules to be applied globally.
	// If absent, no enforcing RBAC policy will be applied.
	rules?: v2_1.#RBAC

	// Shadow rules are not enforced by the filter (i.e., returning a 403)
	// but will emit stats and logs and can be used for rule testing.
	// If absent, no shadow RBAC policy will be applied.
	shadow_rules?: v2_1.#RBAC
}

#RBACPerRoute: {
	"@type": "type.googleapis.com/envoy.config.filter.http.rbac.v2.RBACPerRoute"

	// Override the global configuration of the filter with this new config.
	// If absent, the global RBAC policy will be disabled for this route.
	rbac?: #RBAC
}
