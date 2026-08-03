// Code generated from envoy/config/core/v3/grpc_method_list.proto. DO NOT EDIT.
package v3

import (
	"list"
	"strings"
)

#GrpcMethodList: {
	"@type": "type.googleapis.com/envoy.config.core.v3.GrpcMethodList"
	services?: [...#GrpcMethodList_Service]
}

#GrpcMethodList_Service: {
	"@type": "type.googleapis.com/envoy.config.core.v3.GrpcMethodList.Service"
	name!:   string & strings.MinRunes(1)
	method_names!: [...string] & list.MinItems(1)
}
