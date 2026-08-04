// Code generated from envoy/extensions/filters/http/buffer/v3/buffer.proto. DO NOT EDIT.
package v3

#Buffer: {
	"@type": "type.googleapis.com/envoy.extensions.filters.http.buffer.v3.Buffer"

	// The maximum request size that the filter will buffer before the connection
	// manager will stop buffering and return a 413 response.
	max_request_bytes!: uint32 & >0
}

#BufferPerRoute: {
	"@type": "type.googleapis.com/envoy.extensions.filters.http.buffer.v3.BufferPerRoute"

	// oneof override: exactly one must be set
	// Disable the buffer filter for this particular vhost or route.
	{disabled!: bool & true} |
	{

		// Override the global configuration of the filter with this new config.
		buffer!: #Buffer
	}
}
