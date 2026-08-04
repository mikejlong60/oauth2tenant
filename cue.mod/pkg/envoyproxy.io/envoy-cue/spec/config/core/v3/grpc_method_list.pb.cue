// Code generated from envoy/config/core/v3/grpc_method_list.proto. DO NOT EDIT.
package v3

import (
	"list"
	"strings"
)

// A list of gRPC methods which can be used as an allowlist, for example.
#GrpcMethodList: {
	"@type": "type.googleapis.com/envoy.config.core.v3.GrpcMethodList"
	services?: [...#GrpcMethodList_Service]
}

#GrpcMethodList_Service: {
	"@type": "type.googleapis.com/envoy.config.core.v3.GrpcMethodList.Service"

	// The name of the gRPC service.
	name!: string & strings.MinRunes(1)

	// The names of the gRPC methods in this service.
	method_names!: [...string] & list.MinItems(1)
}
