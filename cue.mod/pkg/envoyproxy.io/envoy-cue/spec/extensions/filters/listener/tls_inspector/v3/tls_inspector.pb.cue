// Code generated from envoy/extensions/filters/listener/tls_inspector/v3/tls_inspector.proto. DO NOT EDIT.
package v3

#TlsInspector: {
	"@type":                                          "type.googleapis.com/envoy.extensions.filters.listener.tls_inspector.v3.TlsInspector"
	enable_ja3_fingerprinting?:                       bool
	enable_ja4_fingerprinting?:                       bool
	initial_read_buffer_size?:                        uint32 & >255 & <65537
	close_connection_on_client_hello_parsing_errors?: bool
	max_client_hello_size?:                           uint32 & >255 & <=16384
}
