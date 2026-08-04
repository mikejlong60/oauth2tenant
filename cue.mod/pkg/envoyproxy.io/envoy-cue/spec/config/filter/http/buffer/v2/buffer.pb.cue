// Code generated from envoy/config/filter/http/buffer/v2/buffer.proto. DO NOT EDIT.
package v2

#Buffer: {
	"@type": "type.googleapis.com/envoy.config.filter.http.buffer.v2.Buffer"

	// The maximum request size that the filter will buffer before the connection
	// manager will stop buffering and return a 413 response.
	max_request_bytes!: uint32 & >0
}

#BufferPerRoute: {
	"@type": "type.googleapis.com/envoy.config.filter.http.buffer.v2.BufferPerRoute"

	// oneof override: exactly one must be set
	// Disable the buffer filter for this particular vhost or route.
	{disabled!: bool & true} |
	{

		// Override the global configuration of the filter with this new config.
		buffer!: #Buffer
	}
}
