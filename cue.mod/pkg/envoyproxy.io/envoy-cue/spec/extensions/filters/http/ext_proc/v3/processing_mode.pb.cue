// Code generated from envoy/extensions/filters/http/ext_proc/v3/processing_mode.proto. DO NOT EDIT.
package v3

#ProcessingMode: {
	"@type":                "type.googleapis.com/envoy.extensions.filters.http.ext_proc.v3.ProcessingMode"
	request_header_mode?:   #ProcessingMode_HeaderSendMode
	response_header_mode?:  #ProcessingMode_HeaderSendMode
	request_body_mode?:     #ProcessingMode_BodySendMode
	response_body_mode?:    #ProcessingMode_BodySendMode
	request_trailer_mode?:  #ProcessingMode_HeaderSendMode
	response_trailer_mode?: #ProcessingMode_HeaderSendMode
}

#ProcessingMode_HeaderSendMode: "DEFAULT" | "SEND" | "SKIP"

#ProcessingMode_BodySendMode: "NONE" | "STREAMED" | "BUFFERED" | "BUFFERED_PARTIAL" | "FULL_DUPLEX_STREAMED" | "GRPC"
