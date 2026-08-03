// Code generated from envoy/extensions/http/ext_proc/response_processors/save_processing_response/v3/save_processing_response.proto. DO NOT EDIT.
package v3

#SaveProcessingResponse: {
	"@type":                   "type.googleapis.com/envoy.extensions.http.ext_proc.response_processors.save_processing_response.v3.SaveProcessingResponse"
	filter_state_name_suffix?: string
	save_request_headers?:     #SaveProcessingResponse_SaveOptions
	save_response_headers?:    #SaveProcessingResponse_SaveOptions
	save_request_trailers?:    #SaveProcessingResponse_SaveOptions
	save_response_trailers?:   #SaveProcessingResponse_SaveOptions
	save_immediate_response?:  #SaveProcessingResponse_SaveOptions
}

#SaveProcessingResponse_SaveOptions: {
	"@type":        "type.googleapis.com/envoy.extensions.http.ext_proc.response_processors.save_processing_response.v3.SaveProcessingResponse.SaveOptions"
	save_response?: bool
	save_on_error?: bool
}
