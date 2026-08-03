// Code generated from envoy/config/grpc_credential/v2alpha/file_based_metadata.proto. DO NOT EDIT.
package v2alpha

import (
	core_1 "envoyproxy.io/envoy-cue/spec/api/v2/core"
)

#FileBasedMetadataConfig: {
	"@type":        "type.googleapis.com/envoy.config.grpc_credential.v2alpha.FileBasedMetadataConfig"
	secret_data?:   core_1.#DataSource
	header_key?:    string
	header_prefix?: string
}
