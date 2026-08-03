// Code generated from envoy/api/v2/core/grpc_service.proto. DO NOT EDIT.
package core

#GrpcService: {
	"@type":      "type.googleapis.com/envoy.api.v2.core.GrpcService"
	envoy_grpc?:  #GrpcService_EnvoyGrpc
	google_grpc?: #GrpcService_GoogleGrpc
	timeout?:     string
	initial_metadata?: [...#HeaderValue]
}

#GrpcService_EnvoyGrpc: {
	"@type":       "type.googleapis.com/envoy.api.v2.core.GrpcService.EnvoyGrpc"
	cluster_name!: string & !=""
}

#GrpcService_GoogleGrpc: {
	"@type":              "type.googleapis.com/envoy.api.v2.core.GrpcService.GoogleGrpc"
	target_uri!:          string & !=""
	channel_credentials?: #GrpcService_GoogleGrpc_ChannelCredentials
	call_credentials?: [...#GrpcService_GoogleGrpc_CallCredentials]
	stat_prefix!:              string & !=""
	credentials_factory_name?: string
	config?: {...}
}

#GrpcService_GoogleGrpc_SslCredentials: {
	"@type":      "type.googleapis.com/envoy.api.v2.core.GrpcService.GoogleGrpc.SslCredentials"
	root_certs?:  #DataSource
	private_key?: #DataSource
	cert_chain?:  #DataSource
}

#GrpcService_GoogleGrpc_GoogleLocalCredentials: {
	"@type": "type.googleapis.com/envoy.api.v2.core.GrpcService.GoogleGrpc.GoogleLocalCredentials"
}

#GrpcService_GoogleGrpc_ChannelCredentials: {
	"@type":          "type.googleapis.com/envoy.api.v2.core.GrpcService.GoogleGrpc.ChannelCredentials"
	ssl_credentials?: #GrpcService_GoogleGrpc_SslCredentials
	google_default?: {}
	local_credentials?: #GrpcService_GoogleGrpc_GoogleLocalCredentials
}

#GrpcService_GoogleGrpc_CallCredentials: {
	"@type":       "type.googleapis.com/envoy.api.v2.core.GrpcService.GoogleGrpc.CallCredentials"
	access_token?: string
	google_compute_engine?: {}
	google_refresh_token?:       string
	service_account_jwt_access?: #GrpcService_GoogleGrpc_CallCredentials_ServiceAccountJWTAccessCredentials
	google_iam?:                 #GrpcService_GoogleGrpc_CallCredentials_GoogleIAMCredentials
	from_plugin?:                #GrpcService_GoogleGrpc_CallCredentials_MetadataCredentialsFromPlugin
	sts_service?:                #GrpcService_GoogleGrpc_CallCredentials_StsService
}

#GrpcService_GoogleGrpc_CallCredentials_ServiceAccountJWTAccessCredentials: {
	"@type":                 "type.googleapis.com/envoy.api.v2.core.GrpcService.GoogleGrpc.CallCredentials.ServiceAccountJWTAccessCredentials"
	json_key?:               string
	token_lifetime_seconds?: uint64
}

#GrpcService_GoogleGrpc_CallCredentials_GoogleIAMCredentials: {
	"@type":              "type.googleapis.com/envoy.api.v2.core.GrpcService.GoogleGrpc.CallCredentials.GoogleIAMCredentials"
	authorization_token?: string
	authority_selector?:  string
}

#GrpcService_GoogleGrpc_CallCredentials_MetadataCredentialsFromPlugin: {
	"@type": "type.googleapis.com/envoy.api.v2.core.GrpcService.GoogleGrpc.CallCredentials.MetadataCredentialsFromPlugin"
	name?:   string
	config?: {...}
	typed_config?: {...}
}

#GrpcService_GoogleGrpc_CallCredentials_StsService: {
	"@type":                     "type.googleapis.com/envoy.api.v2.core.GrpcService.GoogleGrpc.CallCredentials.StsService"
	token_exchange_service_uri?: string
	resource?:                   string
	audience?:                   string
	scope?:                      string
	requested_token_type?:       string
	subject_token_path!:         string & !=""
	subject_token_type!:         string & !=""
	actor_token_path?:           string
	actor_token_type?:           string
}
