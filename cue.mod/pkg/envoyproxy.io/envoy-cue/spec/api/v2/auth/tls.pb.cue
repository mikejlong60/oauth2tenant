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
	"@type":                                "type.googleapis.com/envoy.api.v2.auth.DownstreamTlsContext"
	common_tls_context?:                    #CommonTlsContext
	require_client_certificate?:            bool
	require_sni?:                           bool
	session_ticket_keys?:                   #TlsSessionTicketKeys
	session_ticket_keys_sds_secret_config?: #SdsSecretConfig
	disable_stateless_session_resumption?:  bool
	session_timeout?:                       string // TODO(pgv): duration bounds
}

#CommonTlsContext: {
	"@type":     "type.googleapis.com/envoy.api.v2.auth.CommonTlsContext"
	tls_params?: #TlsParameters
	tls_certificates?: [...#TlsCertificate]
	tls_certificate_sds_secret_configs?: [...#SdsSecretConfig] & list.MaxItems(1)
	validation_context?:                   #CertificateValidationContext
	validation_context_sds_secret_config?: #SdsSecretConfig
	combined_validation_context?:          #CommonTlsContext_CombinedCertificateValidationContext
	alpn_protocols?: [...string]
}

#CommonTlsContext_CombinedCertificateValidationContext: {
	"@type":                               "type.googleapis.com/envoy.api.v2.auth.CommonTlsContext.CombinedCertificateValidationContext"
	default_validation_context!:           #CertificateValidationContext
	validation_context_sds_secret_config!: #SdsSecretConfig
}
