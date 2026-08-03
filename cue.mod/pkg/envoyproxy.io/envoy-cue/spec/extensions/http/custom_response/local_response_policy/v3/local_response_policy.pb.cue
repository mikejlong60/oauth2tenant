// Code generated from envoy/extensions/http/custom_response/local_response_policy/v3/local_response_policy.proto. DO NOT EDIT.
package v3

import (
	"list"
	v3_1 "envoyproxy.io/envoy-cue/spec/config/core/v3"
)

#LocalResponsePolicy: {
	"@type":      "type.googleapis.com/envoy.extensions.http.custom_response.local_response_policy.v3.LocalResponsePolicy"
	body?:        v3_1.#DataSource
	body_format?: v3_1.#SubstitutionFormatString
	status_code?: uint32 & >=200 & <600
	response_headers_to_add?: [...v3_1.#HeaderValueOption] & list.MaxItems(1000)
}
