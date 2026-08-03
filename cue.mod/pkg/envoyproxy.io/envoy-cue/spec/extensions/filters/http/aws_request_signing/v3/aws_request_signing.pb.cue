// Code generated from envoy/extensions/filters/http/aws_request_signing/v3/aws_request_signing.proto. DO NOT EDIT.
package v3

import (
	"strings"
	v3_1 "envoyproxy.io/envoy-cue/spec/type/matcher/v3"
	v3_2 "envoyproxy.io/envoy-cue/spec/extensions/common/aws/v3"
)

#AwsRequestSigning: {
	"@type":               "type.googleapis.com/envoy.extensions.filters.http.aws_request_signing.v3.AwsRequestSigning"
	service_name!:         string & strings.MinRunes(1)
	region?:               string
	host_rewrite?:         string
	use_unsigned_payload?: bool
	match_excluded_headers?: [...v3_1.#StringMatcher]
	signing_algorithm?:   #AwsRequestSigning_SigningAlgorithm
	query_string?:        #AwsRequestSigning_QueryString
	credential_provider?: v3_2.#AwsCredentialProvider
	match_included_headers?: [...v3_1.#StringMatcher]
}

#AwsRequestSigning_QueryString: {
	"@type":          "type.googleapis.com/envoy.extensions.filters.http.aws_request_signing.v3.AwsRequestSigning.QueryString"
	expiration_time?: string // TODO(pgv): duration bounds
}

#AwsRequestSigning_SigningAlgorithm: "AWS_SIGV4" | "AWS_SIGV4A"

#AwsRequestSigningPerRoute: {
	"@type":              "type.googleapis.com/envoy.extensions.filters.http.aws_request_signing.v3.AwsRequestSigningPerRoute"
	aws_request_signing?: #AwsRequestSigning
	stat_prefix!:         string & strings.MinRunes(1)
}
