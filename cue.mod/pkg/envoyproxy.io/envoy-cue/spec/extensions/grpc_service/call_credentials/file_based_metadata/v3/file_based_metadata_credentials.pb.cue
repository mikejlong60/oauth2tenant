// Code generated from envoy/extensions/grpc_service/call_credentials/file_based_metadata/v3/file_based_metadata_credentials.proto. DO NOT EDIT.
package v3

import (
	v3_1 "envoyproxy.io/envoy-cue/spec/config/core/v3"
)

#FileBasedMetadataCallCredentials: {
	"@type":        "type.googleapis.com/envoy.extensions.grpc_service.call_credentials.file_based_metadata.v3.FileBasedMetadataCallCredentials"
	secret_data?:   v3_1.#DataSource
	header_key?:    string
	header_prefix?: string
}
