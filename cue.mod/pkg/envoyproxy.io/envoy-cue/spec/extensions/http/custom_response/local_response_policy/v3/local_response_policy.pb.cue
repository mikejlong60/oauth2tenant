// Code generated from envoy/extensions/http/custom_response/local_response_policy/v3/local_response_policy.proto. DO NOT EDIT.
package v3

import (
	"list"
	v3_1 "envoyproxy.io/envoy-cue/spec/config/core/v3"
)

// Custom response policy to serve a locally stored response to the
// downstream.
#LocalResponsePolicy: {
	"@type": "type.googleapis.com/envoy.extensions.http.custom_response.local_response_policy.v3.LocalResponsePolicy"

	// Optional new local reply body text. It will be used
	// in the ``%LOCAL_REPLY_BODY%`` command operator in the ``body_format``.
	body?: v3_1.#DataSource

	// Optional body format to be used for this response. If ``body_format`` is  not
	// provided, and ``body`` is, the contents of ``body`` will be used to populate
	// the body of the local reply without formatting.
	body_format?: v3_1.#SubstitutionFormatString

	// The new response status code if specified.
	status_code?: uint32 & >=200 & <600

	// HTTP headers to add to the response. This allows the
	// response policy to append, to add or to override headers of
	// the original response for local body, or the custom response from the
	// remote body, before it is sent to a downstream client.
	response_headers_to_add?: [...v3_1.#HeaderValueOption] & list.MaxItems(1000)
}
