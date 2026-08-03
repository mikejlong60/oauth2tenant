// Code generated from envoy/extensions/http/original_ip_detection/custom_header/v3/custom_header.proto. DO NOT EDIT.
package v3

import (
	"strings"
	v3_1 "envoyproxy.io/envoy-cue/spec/type/v3"
)

#CustomHeaderConfig: {
	"@type":                                    "type.googleapis.com/envoy.extensions.http.original_ip_detection.custom_header.v3.CustomHeaderConfig"
	header_name!:                               string & strings.MinRunes(1) // TODO(pgv): string well-known *validate.StringRules_WellKnownRegex
	allow_extension_to_set_address_as_trusted?: bool
	reject_with_status?:                        v3_1.#HttpStatus
}
