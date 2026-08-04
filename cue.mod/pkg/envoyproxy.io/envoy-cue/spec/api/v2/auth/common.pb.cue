// Code generated from envoy/api/v2/auth/common.proto. DO NOT EDIT.
package auth

import (
	"list"
	core_1 "envoyproxy.io/envoy-cue/spec/api/v2/core"
	matcher_2 "envoyproxy.io/envoy-cue/spec/type/matcher"
)

#TlsParameters: {
	"@type":                       "type.googleapis.com/envoy.api.v2.auth.TlsParameters"
	tls_minimum_protocol_version?: #TlsParameters_TlsProtocol
	tls_maximum_protocol_version?: #TlsParameters_TlsProtocol
	cipher_suites?: [...string]
	ecdh_curves?: [...string]
}

#TlsParameters_TlsProtocol: "TLS_AUTO" | "TLSv1_0" | "TLSv1_1" | "TLSv1_2" | "TLSv1_3"

#PrivateKeyProvider: {
	"@type":        "type.googleapis.com/envoy.api.v2.auth.PrivateKeyProvider"
	provider_name!: string & !=""

	// oneof config_type: at most one may be set
	*{} |
	{config!: {...}} |
	{typed_config!: {...}}
}

#TlsCertificate: {
	"@type":               "type.googleapis.com/envoy.api.v2.auth.TlsCertificate"
	certificate_chain?:    core_1.#DataSource
	private_key?:          core_1.#DataSource
	private_key_provider?: #PrivateKeyProvider
	password?:             core_1.#DataSource
	ocsp_staple?:          core_1.#DataSource
	signed_certificate_timestamp?: [...core_1.#DataSource]
}

#TlsSessionTicketKeys: {
	"@type": "type.googleapis.com/envoy.api.v2.auth.TlsSessionTicketKeys"
	keys!: [...core_1.#DataSource] & list.MinItems(1)
}

#CertificateValidationContext: {
	"@type":     "type.googleapis.com/envoy.api.v2.auth.CertificateValidationContext"
	trusted_ca?: core_1.#DataSource
	verify_certificate_spki?: [...string]
	verify_certificate_hash?: [...string]
	verify_subject_alt_name?: [...string]
	match_subject_alt_names?: [...matcher_2.#StringMatcher]
	require_ocsp_staple?:                  bool
	require_signed_certificate_timestamp?: bool
	crl?:                                  core_1.#DataSource
	allow_expired_certificate?:            bool
	trust_chain_verification?:             #CertificateValidationContext_TrustChainVerification
}

#CertificateValidationContext_TrustChainVerification: "VERIFY_TRUST_CHAIN" | "ACCEPT_UNTRUSTED"
