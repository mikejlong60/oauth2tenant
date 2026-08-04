// Code generated from envoy/api/v2/auth/tls.proto. DO NOT EDIT.
package auth

import (
	"list"
)

#UpstreamTlsContext: {
	"@type":              "type.googleapis.com/envoy.api.v2.auth.UpstreamTlsContext"
	common_tls_context?:  #CommonTlsContext
	sni?:                 string
	allow_renegotiation?: bool
	max_session_keys?:    uint32
}

#DownstreamTlsContext: {
	"@type":                     "type.googleapis.com/envoy.api.v2.auth.DownstreamTlsContext"
	common_tls_context?:         #CommonTlsContext
	require_client_certificate?: bool
	require_sni?:                bool
	session_timeout?:            string // TODO(pgv): duration bounds

	// oneof session_ticket_keys_type: at most one may be set
	*{} |
	{session_ticket_keys!: #TlsSessionTicketKeys} |
	{session_ticket_keys_sds_secret_config!: #SdsSecretConfig} |
	{disable_stateless_session_resumption!: bool}
}

#CommonTlsContext: {
	"@type":     "type.googleapis.com/envoy.api.v2.auth.CommonTlsContext"
	tls_params?: #TlsParameters
	tls_certificates?: [...#TlsCertificate]
	tls_certificate_sds_secret_configs?: [...#SdsSecretConfig] & list.MaxItems(1)
	alpn_protocols?: [...string]

	// oneof validation_context_type: at most one may be set
	*{} |
	{validation_context!: #CertificateValidationContext} |
	{validation_context_sds_secret_config!: #SdsSecretConfig} |
	{combined_validation_context!: #CommonTlsContext_CombinedCertificateValidationContext}
}

#CommonTlsContext_CombinedCertificateValidationContext: {
	"@type":                               "type.googleapis.com/envoy.api.v2.auth.CommonTlsContext.CombinedCertificateValidationContext"
	default_validation_context!:           #CertificateValidationContext
	validation_context_sds_secret_config!: #SdsSecretConfig
}
