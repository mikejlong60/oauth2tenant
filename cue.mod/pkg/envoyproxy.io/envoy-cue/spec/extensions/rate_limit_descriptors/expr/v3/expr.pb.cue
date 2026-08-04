// Code generated from envoy/extensions/rate_limit_descriptors/expr/v3/expr.proto. DO NOT EDIT.
package v3

import (
	"strings"
	v1alpha1_1 "envoyproxy.io/envoy-cue/spec/deps/google.golang.org/genproto/googleapis/api/expr/v1alpha1"
)

#Descriptor: {
	"@type":         "type.googleapis.com/envoy.extensions.rate_limit_descriptors.expr.v3.Descriptor"
	descriptor_key!: string & strings.MinRunes(1)
	skip_if_error?:  bool

	// oneof expr_specifier: at most one may be set
	*{} |
	{text!: string & strings.MinRunes(1)} |
	{parsed!: v1alpha1_1.#Expr}
}
