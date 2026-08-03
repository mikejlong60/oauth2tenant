// Code generated from envoy/config/grpc_credential/v3/file_based_metadata.proto. DO NOT EDIT.
package v3

import (
	v3_1 "envoyproxy.io/envoy-cue/spec/config/core/v3"
)

#FileBasedMetadataConfig: {
	"@type":        "type.googleapis.com/envoy.config.grpc_credential.v3.FileBasedMetadataConfig"
	secret_data?:   v3_1.#DataSource
	header_key?:    string
	header_prefix?: string
}
