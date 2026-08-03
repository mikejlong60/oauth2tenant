// Code generated from envoy/extensions/transport_sockets/tls/v3/common.proto. DO NOT EDIT.
package v3

import (
	"list"
	"strings"
	v3_1 "envoyproxy.io/envoy-cue/spec/config/core/v3"
	v3_2 "envoyproxy.io/envoy-cue/spec/type/matcher/v3"
)

#TlsParameters: {
	"@type":                       "type.googleapis.com/envoy.extensions.transport_sockets.tls.v3.TlsParameters"
	tls_minimum_protocol_version?: #TlsParameters_TlsProtocol
	tls_maximum_protocol_version?: #TlsParameters_TlsProtocol
	cipher_suites?: [...string]
	ecdh_curves?: [...string]
	signature_algorithms?: [...string]
	compliance_policies?: [...#TlsParameters_CompliancePolicy] & list.MaxItems(1)
}

#TlsParameters_TlsProtocol: "TLS_AUTO" | "TLSv1_0" | "TLSv1_1" | "TLSv1_2" | "TLSv1_3"

#TlsParameters_CompliancePolicy: "FIPS_202205"

#PrivateKeyProvider: {
	"@type":        "type.googleapis.com/envoy.extensions.transport_sockets.tls.v3.PrivateKeyProvider"
	provider_name!: string & strings.MinRunes(1)
	typed_config?: {...}
	fallback?: bool
}

#TlsCertificate: {
	"@type":               "type.googleapis.com/envoy.extensions.transport_sockets.tls.v3.TlsCertificate"
	certificate_chain?:    v3_1.#DataSource
	private_key?:          v3_1.#DataSource
	pkcs12?:               v3_1.#DataSource
	watched_directory?:    v3_1.#WatchedDirectory
	private_key_provider?: #PrivateKeyProvider
	password?:             v3_1.#DataSource
	ocsp_staple?:          v3_1.#DataSource
	signed_certificate_timestamp?: [...v3_1.#DataSource]
}

#TlsSessionTicketKeys: {
	"@type": "type.googleapis.com/envoy.extensions.transport_sockets.tls.v3.TlsSessionTicketKeys"
	keys!: [...v3_1.#DataSource] & list.MinItems(1)
}

#CertificateProviderPluginInstance: {
	"@type":           "type.googleapis.com/envoy.extensions.transport_sockets.tls.v3.CertificateProviderPluginInstance"
	instance_name!:    string & strings.MinRunes(1)
	certificate_name?: string
}

#SubjectAltNameMatcher: {
	"@type":   "type.googleapis.com/envoy.extensions.transport_sockets.tls.v3.SubjectAltNameMatcher"
	san_type?: #SubjectAltNameMatcher_SanType
	matcher!:  v3_2.#StringMatcher
	oid?:      string
}

#SubjectAltNameMatcher_SanType: "SAN_TYPE_UNSPECIFIED" | "EMAIL" | "DNS" | "URI" | "IP_ADDRESS" | "OTHER_NAME"

#CertificateValidationContext: {
	"@type":                           "type.googleapis.com/envoy.extensions.transport_sockets.tls.v3.CertificateValidationContext"
	trusted_ca?:                       v3_1.#DataSource
	ca_certificate_provider_instance?: #CertificateProviderPluginInstance
	system_root_certs?:                #CertificateValidationContext_SystemRootCerts
	watched_directory?:                v3_1.#WatchedDirectory
	verify_certificate_spki?: [...string]
	verify_certificate_hash?: [...string]
	match_typed_subject_alt_names?: [...#SubjectAltNameMatcher]
	match_subject_alt_names?: [...v3_2.#StringMatcher]
	require_signed_certificate_timestamp?: bool
	crl?:                                  v3_1.#DataSource
	allow_expired_certificate?:            bool
	trust_chain_verification?:             #CertificateValidationContext_TrustChainVerification
	custom_validator_config?:              v3_1.#TypedExtensionConfig
	only_verify_leaf_cert_crl?:            bool
	max_verify_depth?:                     uint32 & <=100
}

#CertificateValidationContext_SystemRootCerts: {
	"@type": "type.googleapis.com/envoy.extensions.transport_sockets.tls.v3.CertificateValidationContext.SystemRootCerts"
}

#CertificateValidationContext_TrustChainVerification: "VERIFY_TRUST_CHAIN" | "ACCEPT_UNTRUSTED"
