// Code generated from envoy/api/v2/core/socket_option.proto. DO NOT EDIT.
package core

#SocketOption: {
	"@type":      "type.googleapis.com/envoy.api.v2.core.SocketOption"
	description?: string
	level?:       int64
	name?:        int64
	state?:       #SocketOption_SocketState

	// oneof value: exactly one must be set
	{int_value!: int64} |
	{buf_value!: bytes}
}

#SocketOption_SocketState: "STATE_PREBIND" | "STATE_BOUND" | "STATE_LISTENING"
