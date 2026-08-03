// Code generated from envoy/extensions/grpc_service/call_credentials/sts_service/v3/sts_service_credentials.proto. DO NOT EDIT.
package v3

import (
	"strings"
)

#StsServiceCredentials: {
	"@type":                     "type.googleapis.com/envoy.extensions.grpc_service.call_credentials.sts_service.v3.StsServiceCredentials"
	token_exchange_service_uri?: string
	resource?:                   string
	audience?:                   string
	scope?:                      string
	requested_token_type?:       string
	subject_token_path!:         string & strings.MinRunes(1)
	subject_token_type!:         string & strings.MinRunes(1)
	actor_token_path?:           string
	actor_token_type?:           string
}
