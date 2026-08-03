// Code generated from envoy/config/core/v3/socket_option.proto. DO NOT EDIT.
package v3

#SocketOption: {
	"@type":      "type.googleapis.com/envoy.config.core.v3.SocketOption"
	description?: string
	level?:       int64
	name?:        int64
	int_value?:   int64
	buf_value?:   bytes
	state?:       #SocketOption_SocketState
	type?:        #SocketOption_SocketType
	ip_version?:  #SocketOption_SocketIpVersion
}

#SocketOption_SocketType: {
	"@type":   "type.googleapis.com/envoy.config.core.v3.SocketOption.SocketType"
	stream?:   #SocketOption_SocketType_Stream
	datagram?: #SocketOption_SocketType_Datagram
}

#SocketOption_SocketType_Stream: {
	"@type": "type.googleapis.com/envoy.config.core.v3.SocketOption.SocketType.Stream"
}

#SocketOption_SocketType_Datagram: {
	"@type": "type.googleapis.com/envoy.config.core.v3.SocketOption.SocketType.Datagram"
}

#SocketOption_SocketState: "STATE_PREBIND" | "STATE_BOUND" | "STATE_LISTENING"

#SocketOption_SocketIpVersion: "SOCKET_IP_VERSION_UNSPECIFIED" | "SOCKET_IP_VERSION_IPV4" | "SOCKET_IP_VERSION_IPV6"

#SocketOptionsOverride: {
	"@type": "type.googleapis.com/envoy.config.core.v3.SocketOptionsOverride"
	socket_options?: [...#SocketOption]
}
