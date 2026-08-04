// Code generated from xds/type/v3/cel.proto. DO NOT EDIT.
package v3

import (
	expr_1 "envoyproxy.io/envoy-cue/spec/deps/cel.dev/expr"
	v1alpha1_2 "envoyproxy.io/envoy-cue/spec/deps/google.golang.org/genproto/googleapis/api/expr/v1alpha1"
)

#CelExpression: {
	"@type":           "type.googleapis.com/xds.type.v3.CelExpression"
	cel_expr_parsed?:  expr_1.#ParsedExpr
	cel_expr_checked?: expr_1.#CheckedExpr
	cel_expr_string?:  string

	// oneof expr_specifier: at most one may be set
	*{} |
	{parsed_expr!: v1alpha1_2.#ParsedExpr} |
	{checked_expr!: v1alpha1_2.#CheckedExpr}
}

#CelExtractString: {
	"@type":        "type.googleapis.com/xds.type.v3.CelExtractString"
	expr_extract!:  #CelExpression
	default_value?: string
}
