// Code generated from envoy/api/v2/core/grpc_method_list.proto. DO NOT EDIT.
package core

import (
	"list"
)

#GrpcMethodList: {
	"@type": "type.googleapis.com/envoy.api.v2.core.GrpcMethodList"
	services?: [...#GrpcMethodList_Service]
}

#GrpcMethodList_Service: {
	"@type": "type.googleapis.com/envoy.api.v2.core.GrpcMethodList.Service"
	name!:   string & !=""
	method_names!: [...string] & list.MinItems(1)
}
