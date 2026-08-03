// Code generated from envoy/extensions/router/cluster_specifiers/matcher/v3/matcher.proto. DO NOT EDIT.
package v3

import (
	"strings"
	v3_1 "envoyproxy.io/envoy-cue/spec/deps/cncf/xds/go/xds/type/matcher/v3"
)

#ClusterAction: {
	"@type":  "type.googleapis.com/envoy.extensions.router.cluster_specifiers.matcher.v3.ClusterAction"
	cluster!: string & strings.MinRunes(1)
}

#MatcherClusterSpecifier: {
	"@type":          "type.googleapis.com/envoy.extensions.router.cluster_specifiers.matcher.v3.MatcherClusterSpecifier"
	cluster_matcher!: v3_1.#Matcher
}
