// Code generated from envoy/config/core/v3/grpc_service.proto. DO NOT EDIT.
package v3

import (
	"strings"
)

#GrpcService: {
	"@type":      "type.googleapis.com/envoy.config.core.v3.GrpcService"
	envoy_grpc?:  #GrpcService_EnvoyGrpc
	google_grpc?: #GrpcService_GoogleGrpc
	timeout?:     string
	initial_metadata?: [...#HeaderValue]
	retry_policy?: #RetryPolicy
}

#GrpcService_EnvoyGrpc: {
	"@type":                     "type.googleapis.com/envoy.config.core.v3.GrpcService.EnvoyGrpc"
	cluster_name!:               string & strings.MinRunes(1)
	authority?:                  string // TODO(pgv): string well-known *validate.StringRules_WellKnownRegex
	retry_policy?:               #RetryPolicy
	max_receive_message_length?: uint32
	skip_envoy_headers?:         bool
}

#GrpcService_GoogleGrpc: {
	"@type":              "type.googleapis.com/envoy.config.core.v3.GrpcService.GoogleGrpc"
	target_uri!:          string & strings.MinRunes(1)
	channel_credentials?: #GrpcService_GoogleGrpc_ChannelCredentials
	channel_credentials_plugin?: [...{...}]
	call_credentials?: [...#GrpcService_GoogleGrpc_CallCredentials]
	call_credentials_plugin?: [...{...}]
	stat_prefix!:              string & strings.MinRunes(1)
	credentials_factory_name?: string
	config?: {...}
	per_stream_buffer_limit_bytes?: uint32
	channel_args?:                  #GrpcService_GoogleGrpc_ChannelArgs
}

#GrpcService_GoogleGrpc_SslCredentials: {
	"@type":      "type.googleapis.com/envoy.config.core.v3.GrpcService.GoogleGrpc.SslCredentials"
	root_certs?:  #DataSource
	private_key?: #DataSource
	cert_chain?:  #DataSource
}

#GrpcService_GoogleGrpc_GoogleLocalCredentials: {
	"@type": "type.googleapis.com/envoy.config.core.v3.GrpcService.GoogleGrpc.GoogleLocalCredentials"
}

#GrpcService_GoogleGrpc_ChannelCredentials: {
	"@type":          "type.googleapis.com/envoy.config.core.v3.GrpcService.GoogleGrpc.ChannelCredentials"
	ssl_credentials?: #GrpcService_GoogleGrpc_SslCredentials
	google_default?: {}
	local_credentials?: #GrpcService_GoogleGrpc_GoogleLocalCredentials
}

#GrpcService_GoogleGrpc_CallCredentials: {
	"@type":       "type.googleapis.com/envoy.config.core.v3.GrpcService.GoogleGrpc.CallCredentials"
	access_token?: string
	google_compute_engine?: {}
	google_refresh_token?:       string
	service_account_jwt_access?: #GrpcService_GoogleGrpc_CallCredentials_ServiceAccountJWTAccessCredentials
	google_iam?:                 #GrpcService_GoogleGrpc_CallCredentials_GoogleIAMCredentials
	from_plugin?:                #GrpcService_GoogleGrpc_CallCredentials_MetadataCredentialsFromPlugin
	sts_service?:                #GrpcService_GoogleGrpc_CallCredentials_StsService
}

#GrpcService_GoogleGrpc_CallCredentials_ServiceAccountJWTAccessCredentials: {
	"@type":                 "type.googleapis.com/envoy.config.core.v3.GrpcService.GoogleGrpc.CallCredentials.ServiceAccountJWTAccessCredentials"
	json_key?:               string
	token_lifetime_seconds?: uint64
}

#GrpcService_GoogleGrpc_CallCredentials_GoogleIAMCredentials: {
	"@type":              "type.googleapis.com/envoy.config.core.v3.GrpcService.GoogleGrpc.CallCredentials.GoogleIAMCredentials"
	authorization_token?: string
	authority_selector?:  string
}

#GrpcService_GoogleGrpc_CallCredentials_MetadataCredentialsFromPlugin: {
	"@type": "type.googleapis.com/envoy.config.core.v3.GrpcService.GoogleGrpc.CallCredentials.MetadataCredentialsFromPlugin"
	name?:   string
	typed_config?: {...}
}

#GrpcService_GoogleGrpc_CallCredentials_StsService: {
	"@type":                     "type.googleapis.com/envoy.config.core.v3.GrpcService.GoogleGrpc.CallCredentials.StsService"
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

#GrpcService_GoogleGrpc_ChannelArgs: {
	"@type": "type.googleapis.com/envoy.config.core.v3.GrpcService.GoogleGrpc.ChannelArgs"
	args?: {[string]: #GrpcService_GoogleGrpc_ChannelArgs_Value}
}

#GrpcService_GoogleGrpc_ChannelArgs_Value: {
	"@type":       "type.googleapis.com/envoy.config.core.v3.GrpcService.GoogleGrpc.ChannelArgs.Value"
	string_value?: string
	int_value?:    int64
}
