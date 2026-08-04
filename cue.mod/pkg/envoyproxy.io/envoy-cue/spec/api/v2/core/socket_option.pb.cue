// Code generated from envoy/api/v2/core/socket_option.proto. DO NOT EDIT.
package core

// Generic socket option message. This would be used to set socket options that
// might not exist in upstream kernels or precompiled Envoy binaries.
// [#next-free-field: 7]
#SocketOption: {
	"@type": "type.googleapis.com/envoy.api.v2.core.SocketOption"

	// An optional name to give this socket option for debugging, etc.
	// Uniqueness is not required and no special meaning is assumed.
	description?: string

	// Corresponding to the level value passed to setsockopt, such as IPPROTO_TCP
	level?: int64

	// The numeric name as passed to setsockopt
	name?: int64

	// The state in which the option will be applied. When used in BindConfig
	// STATE_PREBIND is currently the only valid value.
	state?: #SocketOption_SocketState

	// oneof value: exactly one must be set
	// Because many sockopts take an int value.
	{int_value!: int64} |
	{

		// Otherwise it's a byte buffer.
		buf_value!: bytes
	}
}

#SocketOption_SocketState:
	// Socket options are applied after socket creation but before binding the socket to a port
	"STATE_PREBIND" |

	// Socket options are applied after binding the socket to a port but before calling listen()
	"STATE_BOUND" |

	// Socket options are applied after calling listen()
	"STATE_LISTENING"
