// Code generated from envoy/service/network_ext_proc/v3/network_external_processor.proto. DO NOT EDIT.
package v3

import (
	v3_1 "envoyproxy.io/envoy-cue/spec/config/core/v3"
)

#Data: {
	"@type":        "type.googleapis.com/envoy.service.network_ext_proc.v3.Data"
	data?:          bytes
	end_of_stream?: bool
}

#ProcessingRequest: {
	"@type":     "type.googleapis.com/envoy.service.network_ext_proc.v3.ProcessingRequest"
	read_data?:  #Data
	write_data?: #Data
	metadata?:   v3_1.#Metadata
}

#ProcessingResponse: {
	"@type":                 "type.googleapis.com/envoy.service.network_ext_proc.v3.ProcessingResponse"
	read_data?:              #Data
	write_data?:             #Data
	data_processing_status?: #ProcessingResponse_DataProcessedStatus
	connection_status?:      #ProcessingResponse_ConnectionStatus
	dynamic_metadata?: {...}
}

#ProcessingResponse_DataProcessedStatus: "UNKNOWN" | "UNMODIFIED" | "MODIFIED"

#ProcessingResponse_ConnectionStatus: "CONTINUE" | "CLOSE" | "CLOSE_RST"
