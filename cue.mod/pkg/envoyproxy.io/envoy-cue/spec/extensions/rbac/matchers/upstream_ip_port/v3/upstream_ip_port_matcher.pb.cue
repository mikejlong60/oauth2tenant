// Code generated from envoy/extensions/rbac/matchers/upstream_ip_port/v3/upstream_ip_port_matcher.proto. DO NOT EDIT.
package v3

import (
	v3_1 "envoyproxy.io/envoy-cue/spec/config/core/v3"
	v3_2 "envoyproxy.io/envoy-cue/spec/type/v3"
)

#UpstreamIpPortMatcher: {
	"@type":              "type.googleapis.com/envoy.extensions.rbac.matchers.upstream_ip_port.v3.UpstreamIpPortMatcher"
	upstream_ip?:         v3_1.#CidrRange
	upstream_port_range?: v3_2.#Int64Range
}
