// Code generated from envoy/extensions/filters/http/buffer/v3/buffer.proto. DO NOT EDIT.
package v3

#Buffer: {
	"@type":            "type.googleapis.com/envoy.extensions.filters.http.buffer.v3.Buffer"
	max_request_bytes!: uint32 & >0
}

#BufferPerRoute: {
	"@type": "type.googleapis.com/envoy.extensions.filters.http.buffer.v3.BufferPerRoute"

	// oneof override: exactly one must be set
	{disabled!: bool & true} |
	{buffer!: #Buffer}
}
