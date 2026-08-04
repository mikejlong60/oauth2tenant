// Code generated from envoy/extensions/common/matching/v3/extension_matcher.proto. DO NOT EDIT.
package v3

import (
	v3_1 "envoyproxy.io/envoy-cue/spec/config/common/matcher/v3"
	v3_2 "envoyproxy.io/envoy-cue/spec/deps/cncf/xds/go/xds/type/matcher/v3"
	v3_3 "envoyproxy.io/envoy-cue/spec/config/core/v3"
)

// Wrapper around an existing extension that provides an associated matcher. This allows
// decorating an existing extension with a matcher, which can be used to match against
// relevant protocol data.
#ExtensionWithMatcher: {
	"@type": "type.googleapis.com/envoy.extensions.common.matching.v3.ExtensionWithMatcher"

	// The associated matcher. This is deprecated in favor of xds_matcher.
	matcher?: v3_1.#Matcher

	// The associated matcher.
	xds_matcher?: v3_2.#Matcher

	// The underlying extension config.
	extension_config!: v3_3.#TypedExtensionConfig
}

// Extra settings on a per virtualhost/route/weighted-cluster level.
#ExtensionWithMatcherPerRoute: {
	"@type": "type.googleapis.com/envoy.extensions.common.matching.v3.ExtensionWithMatcherPerRoute"

	// Matcher override.
	xds_matcher?: v3_2.#Matcher
}
