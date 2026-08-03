// Code generated from envoy/extensions/filters/network/ext_proc/v3/ext_proc.proto. DO NOT EDIT.
package v3

import (
	"strings"
	v3_1 "envoyproxy.io/envoy-cue/spec/config/core/v3"
)

#NetworkExternalProcessor: {
	"@type":             "type.googleapis.com/envoy.extensions.filters.network.ext_proc.v3.NetworkExternalProcessor"
	grpc_service?:       v3_1.#GrpcService
	failure_mode_allow?: bool
	processing_mode?:    #ProcessingMode
	message_timeout?:    string // TODO(pgv): duration bounds
	stat_prefix!:        string & strings.MinRunes(1)
	metadata_options?:   #MetadataOptions
}

#ProcessingMode: {
	"@type":        "type.googleapis.com/envoy.extensions.filters.network.ext_proc.v3.ProcessingMode"
	process_read?:  #ProcessingMode_DataSendMode
	process_write?: #ProcessingMode_DataSendMode
}

#ProcessingMode_DataSendMode: "STREAMED" | "SKIP"

#MetadataOptions: {
	"@type":                "type.googleapis.com/envoy.extensions.filters.network.ext_proc.v3.MetadataOptions"
	forwarding_namespaces?: #MetadataOptions_MetadataNamespaces
}

#MetadataOptions_MetadataNamespaces: {
	"@type": "type.googleapis.com/envoy.extensions.filters.network.ext_proc.v3.MetadataOptions.MetadataNamespaces"
	untyped?: [...string]
	typed?: [...string]
}
