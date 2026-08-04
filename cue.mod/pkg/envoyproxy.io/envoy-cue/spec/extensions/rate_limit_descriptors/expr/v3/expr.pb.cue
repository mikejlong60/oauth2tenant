// Code generated from envoy/extensions/rate_limit_descriptors/expr/v3/expr.proto. DO NOT EDIT.
package v3

import (
	"strings"
	v1alpha1_1 "envoyproxy.io/envoy-cue/spec/deps/google.golang.org/genproto/googleapis/api/expr/v1alpha1"
)

// The following descriptor entry is appended with a value computed
// from a symbolic Common Expression Language expression.
// See :ref:`attributes <arch_overview_attributes>` for the set of
// available attributes.
//
// .. code-block:: cpp
//
//   ("<descriptor_key>", "<expression_value>")
#Descriptor: {
	"@type": "type.googleapis.com/envoy.extensions.rate_limit_descriptors.expr.v3.Descriptor"

	// The key to use in the descriptor entry.
	descriptor_key!: string & strings.MinRunes(1)

	// If set to true, Envoy skips the descriptor if the expression evaluates to an error.
	// By default, the rate limit is not applied when an expression produces an error.
	skip_if_error?: bool

	// oneof expr_specifier: at most one may be set
	*{} |
	{

		// Expression in a text form, e.g. "connection.requested_server_name".
		text!: string & strings.MinRunes(1)
	} |
	{

		// Parsed expression in AST form.
		parsed!: v1alpha1_1.#Expr
	}
}
