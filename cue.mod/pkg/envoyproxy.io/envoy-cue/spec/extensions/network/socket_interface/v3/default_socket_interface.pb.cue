// Code generated from envoy/extensions/network/socket_interface/v3/default_socket_interface.proto. DO NOT EDIT.
package v3

#DefaultSocketInterface: {
	"@type":           "type.googleapis.com/envoy.extensions.network.socket_interface.v3.DefaultSocketInterface"
	io_uring_options?: #IoUringOptions
}

#IoUringOptions: {
	"@type":                          "type.googleapis.com/envoy.extensions.network.socket_interface.v3.IoUringOptions"
	io_uring_size?:                   uint32
	enable_submission_queue_polling?: bool
	read_buffer_size?:                uint32
	write_timeout_ms?:                uint32
}
