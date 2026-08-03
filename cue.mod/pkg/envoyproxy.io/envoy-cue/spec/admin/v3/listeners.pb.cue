// Code generated from envoy/admin/v3/listeners.proto. DO NOT EDIT.
package v3

import (
	v3_1 "envoyproxy.io/envoy-cue/spec/config/core/v3"
)

#Listeners: {
	"@type": "type.googleapis.com/envoy.admin.v3.Listeners"
	listener_statuses?: [...#ListenerStatus]
}

#ListenerStatus: {
	"@type":        "type.googleapis.com/envoy.admin.v3.ListenerStatus"
	name?:          string
	local_address?: v3_1.#Address
	additional_local_addresses?: [...v3_1.#Address]
}
