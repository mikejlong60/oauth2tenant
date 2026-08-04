// Code generated from envoy/type/matcher/v3/address.proto. DO NOT EDIT.
package v3

import (
	v3_1 "envoyproxy.io/envoy-cue/spec/deps/cncf/xds/go/xds/core/v3"
)

// Match an IP against a repeated CIDR range. This matcher is intended to be
// used in other matchers, for example in the filter state matcher to match a
// filter state object as an IP.
#AddressMatcher: {
	"@type": "type.googleapis.com/envoy.type.matcher.v3.AddressMatcher"
	ranges?: [...v3_1.#CidrRange]
}
