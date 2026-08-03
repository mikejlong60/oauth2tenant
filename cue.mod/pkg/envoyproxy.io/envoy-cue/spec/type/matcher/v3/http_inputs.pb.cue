// Code generated from envoy/type/matcher/v3/http_inputs.proto. DO NOT EDIT.
package v3

import (
	"strings"
)

#HttpRequestHeaderMatchInput: {
	"@type":      "type.googleapis.com/envoy.type.matcher.v3.HttpRequestHeaderMatchInput"
	header_name?: string // TODO(pgv): string well-known *validate.StringRules_WellKnownRegex
}

#HttpRequestTrailerMatchInput: {
	"@type":      "type.googleapis.com/envoy.type.matcher.v3.HttpRequestTrailerMatchInput"
	header_name?: string // TODO(pgv): string well-known *validate.StringRules_WellKnownRegex
}

#HttpResponseHeaderMatchInput: {
	"@type":      "type.googleapis.com/envoy.type.matcher.v3.HttpResponseHeaderMatchInput"
	header_name?: string // TODO(pgv): string well-known *validate.StringRules_WellKnownRegex
}

#HttpResponseTrailerMatchInput: {
	"@type":      "type.googleapis.com/envoy.type.matcher.v3.HttpResponseTrailerMatchInput"
	header_name?: string // TODO(pgv): string well-known *validate.StringRules_WellKnownRegex
}

#HttpRequestQueryParamMatchInput: {
	"@type":      "type.googleapis.com/envoy.type.matcher.v3.HttpRequestQueryParamMatchInput"
	query_param!: string & strings.MinRunes(1)
}
