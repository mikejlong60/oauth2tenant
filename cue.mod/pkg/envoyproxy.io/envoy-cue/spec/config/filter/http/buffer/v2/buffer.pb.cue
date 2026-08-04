// Code generated from envoy/config/filter/http/buffer/v2/buffer.proto. DO NOT EDIT.
package v2

#Buffer: {
	"@type":            "type.googleapis.com/envoy.config.filter.http.buffer.v2.Buffer"
	max_request_bytes!: uint32 & >0
}

#BufferPerRoute: {
	"@type": "type.googleapis.com/envoy.config.filter.http.buffer.v2.BufferPerRoute"

	// oneof override: exactly one must be set
	{disabled!: bool & true} |
	{buffer!: #Buffer}
}
