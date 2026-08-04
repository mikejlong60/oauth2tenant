// Code generated from envoy/api/v2/auth/secret.proto. DO NOT EDIT.
package auth

import (
	core_1 "envoyproxy.io/envoy-cue/spec/api/v2/core"
)

#GenericSecret: {
	"@type": "type.googleapis.com/envoy.api.v2.auth.GenericSecret"

	// Secret of generic type and is available to filters.
	secret?: core_1.#DataSource
}

#SdsSecretConfig: {
	"@type": "type.googleapis.com/envoy.api.v2.auth.SdsSecretConfig"

	// Name (FQDN, UUID, SPKI, SHA256, etc.) by which the secret can be uniquely referred to.
	// When both name and config are specified, then secret can be fetched and/or reloaded via
	// SDS. When only name is specified, then secret will be loaded from static resources.
	name?:       string
	sds_config?: core_1.#ConfigSource
}

// [#next-free-field: 6]
#Secret: {
	"@type": "type.googleapis.com/envoy.api.v2.auth.Secret"

	// Name (FQDN, UUID, SPKI, SHA256, etc.) by which the secret can be uniquely referred to.
	name?: string

	// oneof type: at most one may be set
	*{} |
	{tls_certificate!: #TlsCertificate} |
	{session_ticket_keys!: #TlsSessionTicketKeys} |
	{validation_context!: #CertificateValidationContext} |
	{generic_secret!: #GenericSecret}
}
