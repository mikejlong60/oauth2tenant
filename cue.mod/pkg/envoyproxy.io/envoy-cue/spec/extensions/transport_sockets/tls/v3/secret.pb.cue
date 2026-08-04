// Code generated from envoy/extensions/transport_sockets/tls/v3/secret.proto. DO NOT EDIT.
package v3

import (
	"strings"
	v3_1 "envoyproxy.io/envoy-cue/spec/config/core/v3"
)

#GenericSecret: {
	"@type": "type.googleapis.com/envoy.extensions.transport_sockets.tls.v3.GenericSecret"

	// Secret of generic type and is available to filters. It is expected
	// that only only one of secret and secrets is set.
	secret?: v3_1.#DataSource

	// For cases where multiple associated secrets need to be distributed together. It is expected
	// that only only one of secret and secrets is set.
	secrets?: {[string]: v3_1.#DataSource}
}

#SdsSecretConfig: {
	"@type": "type.googleapis.com/envoy.extensions.transport_sockets.tls.v3.SdsSecretConfig"

	// Name by which the secret can be uniquely referred to. When both name and config are specified,
	// then secret can be fetched and/or reloaded via SDS. When only name is specified, then secret
	// will be loaded from static resources.
	name!:       string & strings.MinRunes(1)
	sds_config?: v3_1.#ConfigSource
}

// [#next-free-field: 6]
#Secret: {
	"@type": "type.googleapis.com/envoy.extensions.transport_sockets.tls.v3.Secret"

	// Name (FQDN, UUID, SPKI, SHA256, etc.) by which the secret can be uniquely referred to.
	name?: string

	// oneof type: at most one may be set
	*{} |
	{tls_certificate!: #TlsCertificate} |
	{session_ticket_keys!: #TlsSessionTicketKeys} |
	{validation_context!: #CertificateValidationContext} |
	{generic_secret!: #GenericSecret}
}
