// Code generated from xds/type/v3/cel.proto. DO NOT EDIT.
package v3

import (
	expr_2 "envoyproxy.io/envoy-cue/spec/deps/cel.dev/expr"
	v1alpha1_1 "envoyproxy.io/envoy-cue/spec/deps/google.golang.org/genproto/googleapis/api/expr/v1alpha1"
)

#CelExpression: {
	"@type":           "type.googleapis.com/xds.type.v3.CelExpression"
	parsed_expr?:      v1alpha1_1.#ParsedExpr
	checked_expr?:     v1alpha1_1.#CheckedExpr
	cel_expr_parsed?:  expr_2.#ParsedExpr
	cel_expr_checked?: expr_2.#CheckedExpr
	cel_expr_string?:  string
}

#CelExtractString: {
	"@type":        "type.googleapis.com/xds.type.v3.CelExtractString"
	expr_extract!:  #CelExpression
	default_value?: string
}
