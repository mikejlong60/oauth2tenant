// Code generated from envoy/extensions/common/matching/v3/extension_matcher.proto. DO NOT EDIT.
package v3

import (
	v3_1 "envoyproxy.io/envoy-cue/spec/config/common/matcher/v3"
	v3_2 "envoyproxy.io/envoy-cue/spec/deps/cncf/xds/go/xds/type/matcher/v3"
	v3_3 "envoyproxy.io/envoy-cue/spec/config/core/v3"
)

#ExtensionWithMatcher: {
	"@type":           "type.googleapis.com/envoy.extensions.common.matching.v3.ExtensionWithMatcher"
	matcher?:          v3_1.#Matcher
	xds_matcher?:      v3_2.#Matcher
	extension_config!: v3_3.#TypedExtensionConfig
}

#ExtensionWithMatcherPerRoute: {
	"@type":      "type.googleapis.com/envoy.extensions.common.matching.v3.ExtensionWithMatcherPerRoute"
	xds_matcher?: v3_2.#Matcher
}
