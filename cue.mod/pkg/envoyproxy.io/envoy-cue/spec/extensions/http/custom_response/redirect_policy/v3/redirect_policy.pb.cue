// Code generated from envoy/extensions/http/custom_response/redirect_policy/v3/redirect_policy.proto. DO NOT EDIT.
package v3

import (
	"list"
	"strings"
	v3_1 "envoyproxy.io/envoy-cue/spec/config/core/v3"
	v3_2 "envoyproxy.io/envoy-cue/spec/config/route/v3"
)

#RedirectPolicy: {
	"@type":      "type.googleapis.com/envoy.extensions.http.custom_response.redirect_policy.v3.RedirectPolicy"
	status_code?: uint32 & >=200 & <=999
	response_headers_to_add?: [...v3_1.#HeaderValueOption] & list.MaxItems(1000)
	request_headers_to_add?: [...v3_1.#HeaderValueOption] & list.MaxItems(1000)
	modify_request_headers_action?: v3_1.#TypedExtensionConfig

	// oneof redirect_action_specifier: exactly one must be set
	{uri!: string & strings.MinRunes(1)} |
	{redirect_action!: v3_2.#RedirectAction}
}
