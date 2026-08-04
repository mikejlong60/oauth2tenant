// Code generated from envoy/extensions/transport_sockets/tls/v3/tls.proto. DO NOT EDIT.
package v3

import (
	"strings"
	v3_1 "envoyproxy.io/envoy-cue/spec/config/core/v3"
)

#UpstreamTlsContext: {
	"@type":                  "type.googleapis.com/envoy.extensions.transport_sockets.tls.v3.UpstreamTlsContext"
	common_tls_context?:      #CommonTlsContext
	sni?:                     string
	auto_host_sni?:           bool
	auto_sni_san_validation?: bool
	allow_renegotiation?:     bool
	max_session_keys?:        uint32
	enforce_rsa_key_usage?:   bool
}

#DownstreamTlsContext: {
	"@type":                              "type.googleapis.com/envoy.extensions.transport_sockets.tls.v3.DownstreamTlsContext"
	common_tls_context?:                  #CommonTlsContext
	require_client_certificate?:          bool
	require_sni?:                         bool
	disable_stateful_session_resumption?: bool
	session_timeout?:                     string // TODO(pgv): duration bounds
	ocsp_staple_policy?:                  #DownstreamTlsContext_OcspStaplePolicy
	full_scan_certs_on_sni_mismatch?:     bool
	prefer_client_ciphers?:               bool

	// oneof session_ticket_keys_type: at most one may be set
	*{} |
	{session_ticket_keys!: #TlsSessionTicketKeys} |
	{session_ticket_keys_sds_secret_config!: #SdsSecretConfig} |
	{disable_stateless_session_resumption!: bool}
}

#DownstreamTlsContext_OcspStaplePolicy: "LENIENT_STAPLING" | "STRICT_STAPLING" | "MUST_STAPLE"

#TlsKeyLog: {
	"@type": "type.googleapis.com/envoy.extensions.transport_sockets.tls.v3.TlsKeyLog"
	path!:   string & strings.MinRunes(1)
	local_address_range?: [...v3_1.#CidrRange]
	remote_address_range?: [...v3_1.#CidrRange]
}

#CommonTlsContext: {
	"@type":     "type.googleapis.com/envoy.extensions.transport_sockets.tls.v3.CommonTlsContext"
	tls_params?: #TlsParameters
	tls_certificates?: [...#TlsCertificate]
	tls_certificate_sds_secret_configs?: [...#SdsSecretConfig]
	tls_certificate_provider_instance?:             #CertificateProviderPluginInstance
	custom_tls_certificate_selector?:               v3_1.#TypedExtensionConfig
	tls_certificate_certificate_provider?:          #CommonTlsContext_CertificateProvider
	tls_certificate_certificate_provider_instance?: #CommonTlsContext_CertificateProviderInstance
	alpn_protocols?: [...string]
	custom_handshaker?: v3_1.#TypedExtensionConfig
	key_log?:           #TlsKeyLog

	// oneof validation_context_type: at most one may be set
	*{} |
	{validation_context!: #CertificateValidationContext} |
	{validation_context_sds_secret_config!: #SdsSecretConfig} |
	{combined_validation_context!: #CommonTlsContext_CombinedCertificateValidationContext} |
	{validation_context_certificate_provider!: #CommonTlsContext_CertificateProvider} |
	{validation_context_certificate_provider_instance!: #CommonTlsContext_CertificateProviderInstance}
}

#CommonTlsContext_CertificateProvider: {
	"@type": "type.googleapis.com/envoy.extensions.transport_sockets.tls.v3.CommonTlsContext.CertificateProvider"
	name!:   string & strings.MinRunes(1)

	// oneof config: exactly one must be set
	{typed_config!: v3_1.#TypedExtensionConfig}
}

#CommonTlsContext_CertificateProviderInstance: {
	"@type":           "type.googleapis.com/envoy.extensions.transport_sockets.tls.v3.CommonTlsContext.CertificateProviderInstance"
	instance_name?:    string
	certificate_name?: string
}

#CommonTlsContext_CombinedCertificateValidationContext: {
	"@type":                                           "type.googleapis.com/envoy.extensions.transport_sockets.tls.v3.CommonTlsContext.CombinedCertificateValidationContext"
	default_validation_context!:                       #CertificateValidationContext
	validation_context_sds_secret_config!:             #SdsSecretConfig
	validation_context_certificate_provider?:          #CommonTlsContext_CertificateProvider
	validation_context_certificate_provider_instance?: #CommonTlsContext_CertificateProviderInstance
}
