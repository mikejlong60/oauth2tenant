// Code generated from envoy/config/core/v3/socket_option.proto. DO NOT EDIT.
package v3

// Generic socket option message. This would be used to set socket options that
// might not exist in upstream kernels or precompiled Envoy binaries.
//
// For example:
//
// .. code-block:: json
//
//  {
//    "description": "support tcp keep alive",
//    "state": 0,
//    "level": 1,
//    "name": 9,
//    "int_value": 1,
//  }
//
// 1 means SOL_SOCKET and 9 means SO_KEEPALIVE on Linux.
// With the above configuration, `TCP Keep-Alives <https://www.freesoft.org/CIE/RFC/1122/114.htm>`_
// can be enabled in socket with Linux, which can be used in
// :ref:`listener's<envoy_v3_api_field_config.listener.v3.Listener.socket_options>` or
// :ref:`admin's <envoy_v3_api_field_config.bootstrap.v3.Admin.socket_options>` socket_options etc.
//
// It should be noted that the name or level may have different values on different platforms.
// [#next-free-field: 9]
#SocketOption: {
	"@type": "type.googleapis.com/envoy.config.core.v3.SocketOption"

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

	// Apply the socket option to the specified `socket type <https://linux.die.net/man/2/socket>`_.
	// If not specified, the socket option will be applied to all socket types.
	type?: #SocketOption_SocketType

	// Apply the socket option to the specified `socket Ip version
	// <https://linux.die.net/man/2/socket>`_. If not specified, the socket option
	// will be applied to all socket ip versions.
	ip_version?: #SocketOption_SocketIpVersion

	// oneof value: exactly one must be set
	// Because many sockopts take an int value.
	{int_value!: int64} |
	{

		// Otherwise it's a byte buffer.
		buf_value!: bytes
	}
}

// The `socket type <https://linux.die.net/man/2/socket>`_ to apply the socket option to.
// Only one field should be set. If multiple fields are set, the precedence order will determine
// the selected one. If none of the fields is set, the socket option will be applied to all socket types.
//
// For example:
// If :ref:`stream <envoy_v3_api_field_config.core.v3.SocketOption.SocketType.stream>` is set,
// it takes precedence over :ref:`datagram <envoy_v3_api_field_config.core.v3.SocketOption.SocketType.datagram>`.
#SocketOption_SocketType: {
	"@type": "type.googleapis.com/envoy.config.core.v3.SocketOption.SocketType"

	// Apply the socket option to the stream socket type.
	stream?: #SocketOption_SocketType_Stream

	// Apply the socket option to the datagram socket type.
	datagram?: #SocketOption_SocketType_Datagram
}

// The stream socket type.
#SocketOption_SocketType_Stream: {
	"@type": "type.googleapis.com/envoy.config.core.v3.SocketOption.SocketType.Stream"
}

// The datagram socket type.
#SocketOption_SocketType_Datagram: {
	"@type": "type.googleapis.com/envoy.config.core.v3.SocketOption.SocketType.Datagram"
}

#SocketOption_SocketState:
	// Socket options are applied after socket creation but before binding the socket to a port
	"STATE_PREBIND" |

	// Socket options are applied after binding the socket to a port but before calling listen()
	"STATE_BOUND" |

	// Socket options are applied after calling listen()
	"STATE_LISTENING"

// The `socket IP version <https://linux.die.net/man/2/socket>`_ to apply the
// socket option to.
#SocketOption_SocketIpVersion:
	// Apply the socket option to all socket IP versions.
	"SOCKET_IP_VERSION_UNSPECIFIED" |

	// Apply the socket option to the IPv4 socket type.
	"SOCKET_IP_VERSION_IPV4" |

	// Apply the socket option to the IPv6 socket type.
	"SOCKET_IP_VERSION_IPV6"

#SocketOptionsOverride: {
	"@type": "type.googleapis.com/envoy.config.core.v3.SocketOptionsOverride"
	socket_options?: [...#SocketOption]
}
