// Code generated from envoy/data/tap/v3/common.proto. DO NOT EDIT.
package v3

import (
	v3_1 "envoyproxy.io/envoy-cue/spec/config/core/v3"
)

#Body: {
	"@type":    "type.googleapis.com/envoy.data.tap.v3.Body"
	as_bytes?:  bytes
	as_string?: string
	truncated?: bool
}

#Connection: {
	"@type":         "type.googleapis.com/envoy.data.tap.v3.Connection"
	local_address?:  v3_1.#Address
	remote_address?: v3_1.#Address
}
