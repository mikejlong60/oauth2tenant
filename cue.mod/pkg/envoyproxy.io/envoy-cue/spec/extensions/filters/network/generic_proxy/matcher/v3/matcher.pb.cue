// Code generated from envoy/extensions/filters/network/generic_proxy/matcher/v3/matcher.proto. DO NOT EDIT.
package v3

import (
	"strings"
	v3_1 "envoyproxy.io/envoy-cue/spec/type/matcher/v3"
)

#ServiceMatchInput: {
	"@type": "type.googleapis.com/envoy.extensions.filters.network.generic_proxy.matcher.v3.ServiceMatchInput"
}

#HostMatchInput: {
	"@type": "type.googleapis.com/envoy.extensions.filters.network.generic_proxy.matcher.v3.HostMatchInput"
}

#PathMatchInput: {
	"@type": "type.googleapis.com/envoy.extensions.filters.network.generic_proxy.matcher.v3.PathMatchInput"
}

#MethodMatchInput: {
	"@type": "type.googleapis.com/envoy.extensions.filters.network.generic_proxy.matcher.v3.MethodMatchInput"
}

#PropertyMatchInput: {
	"@type":        "type.googleapis.com/envoy.extensions.filters.network.generic_proxy.matcher.v3.PropertyMatchInput"
	property_name!: string & strings.MinRunes(1)
}

#RequestMatchInput: {
	"@type": "type.googleapis.com/envoy.extensions.filters.network.generic_proxy.matcher.v3.RequestMatchInput"
}

#KeyValueMatchEntry: {
	"@type":       "type.googleapis.com/envoy.extensions.filters.network.generic_proxy.matcher.v3.KeyValueMatchEntry"
	name!:         string & strings.MinRunes(1)
	string_match!: v3_1.#StringMatcher
}

#RequestMatcher: {
	"@type": "type.googleapis.com/envoy.extensions.filters.network.generic_proxy.matcher.v3.RequestMatcher"
	host?:   v3_1.#StringMatcher
	path?:   v3_1.#StringMatcher
	method?: v3_1.#StringMatcher
	properties?: [...#KeyValueMatchEntry]
}
