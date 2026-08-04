// Code generated from envoy/api/v2/core/grpc_method_list.proto. DO NOT EDIT.
package core

import (
	"list"
)

// A list of gRPC methods which can be used as an allowlist, for example.
#GrpcMethodList: {
	"@type": "type.googleapis.com/envoy.api.v2.core.GrpcMethodList"
	services?: [...#GrpcMethodList_Service]
}

#GrpcMethodList_Service: {
	"@type": "type.googleapis.com/envoy.api.v2.core.GrpcMethodList.Service"

	// The name of the gRPC service.
	name!: string & !=""

	// The names of the gRPC methods in this service.
	method_names!: [...string] & list.MinItems(1)
}
