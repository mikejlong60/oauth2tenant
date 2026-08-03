// Code generated from envoy/admin/v2alpha/listeners.proto. DO NOT EDIT.
package v2alpha

import (
	core_1 "envoyproxy.io/envoy-cue/spec/api/v2/core"
)

#Listeners: {
	"@type": "type.googleapis.com/envoy.admin.v2alpha.Listeners"
	listener_statuses?: [...#ListenerStatus]
}

#ListenerStatus: {
	"@type":        "type.googleapis.com/envoy.admin.v2alpha.ListenerStatus"
	name?:          string
	local_address?: core_1.#Address
}
