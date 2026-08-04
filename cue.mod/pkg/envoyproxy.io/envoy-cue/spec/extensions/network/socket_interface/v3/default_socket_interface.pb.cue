// Code generated from envoy/extensions/network/socket_interface/v3/default_socket_interface.proto. DO NOT EDIT.
package v3

// Configuration for default socket interface that relies on OS dependent syscall to create
// sockets.
#DefaultSocketInterface: {
	"@type": "type.googleapis.com/envoy.extensions.network.socket_interface.v3.DefaultSocketInterface"

	// io_uring options. io_uring is only valid in Linux with at least kernel version 5.11. Otherwise,
	// Envoy will fall back to use the default socket API. If not set then io_uring will not be
	// enabled.
	io_uring_options?: #IoUringOptions
}

#IoUringOptions: {
	"@type": "type.googleapis.com/envoy.extensions.network.socket_interface.v3.IoUringOptions"

	// The size for io_uring submission queues (SQ). io_uring is built with a fixed size in each
	// thread during configuration, and each io_uring operation creates a submission queue
	// entry (SQE). The default is 1000.
	io_uring_size?: uint32

	// Enable io_uring submission queue polling (SQPOLL). io_uring SQPOLL mode polls all SQEs in the
	// SQ in the kernel thread. io_uring SQPOLL mode may reduce latency and increase CPU usage as a
	// cost. The default is false.
	enable_submission_queue_polling?: bool

	// The size of an io_uring socket's read buffer. Each io_uring read operation will allocate a
	// buffer of the given size. If the given buffer is too small, the socket will have read multiple
	// times for all the data. The default is 8192.
	read_buffer_size?: uint32

	// The write timeout of an io_uring socket on closing in ms. io_uring writes and closes
	// asynchronously. If the remote stops reading, the io_uring write operation may never complete.
	// The operation is canceled and the socket is closed after the timeout. The default is 1000.
	write_timeout_ms?: uint32
}
