// Code generated from xds/type/v3/cel.proto. DO NOT EDIT.
package v3

import (
	expr_1 "envoyproxy.io/envoy-cue/spec/deps/cel.dev/expr"
	v1alpha1_2 "envoyproxy.io/envoy-cue/spec/deps/google.golang.org/genproto/googleapis/api/expr/v1alpha1"
)

// Either parsed or checked representation of the `Common Expression Language
// <https://github.com/google/cel-spec>`_ (CEL) program.
#CelExpression: {
	"@type": "type.googleapis.com/xds.type.v3.CelExpression"

	// Parsed expression in abstract syntax tree (AST) form.
	//
	// If ``cel_expr_checked`` is set, this field is not used.
	cel_expr_parsed?: expr_1.#ParsedExpr

	// Parsed expression in abstract syntax tree (AST) form that has been successfully type checked.
	//
	// If set, takes precedence over ``cel_expr_parsed``.
	cel_expr_checked?: expr_1.#CheckedExpr

	// Unparsed expression in string form. For example, ``request.headers['x-env'] == 'prod'`` will
	// get ``x-env`` header value and compare it with ``prod``.
	// Check the `Common Expression Language <https://github.com/google/cel-spec>`_ for more details.
	//
	// If set, takes precedence over ``cel_expr_parsed`` and ``cel_expr_checked``.
	cel_expr_string?: string

	// oneof expr_specifier: at most one may be set
	*{} |
	{

		// Parsed expression in abstract syntax tree (AST) form.
		//
		// Deprecated -- use ``cel_expr_parsed`` field instead.
		// If ``cel_expr_parsed`` or ``cel_expr_checked`` is set, this field is not used.
		parsed_expr!: v1alpha1_2.#ParsedExpr
	} |
	{

		// Parsed expression in abstract syntax tree (AST) form that has been successfully type checked.
		//
		// Deprecated -- use ``cel_expr_checked`` field instead.
		// If ``cel_expr_parsed`` or ``cel_expr_checked`` is set, this field is not used.
		checked_expr!: v1alpha1_2.#CheckedExpr
	}
}

// Extracts a string by evaluating a `Common Expression Language
// <https://github.com/google/cel-spec>`_ (CEL) expression against the standardized set of
// :ref:`HTTP attributes <arch_overview_attributes>`.
//
// .. attention::
//
//   Besides CEL evaluation raising an error explicitly, CEL program returning a type other than
//   the ``string``, or not returning anything, are considered an error as well.
//
// [#comment:TODO(sergiitk): When implemented, add the extension tag.]
#CelExtractString: {
	"@type": "type.googleapis.com/xds.type.v3.CelExtractString"

	// The CEL expression used to extract a string from the CEL environment.
	// the "subject string") that should be replaced.
	expr_extract!: #CelExpression

	// If CEL expression evaluates to an error, this value is be returned to the caller.
	// If not set, the error is propagated to the caller.
	default_value?: string
}
