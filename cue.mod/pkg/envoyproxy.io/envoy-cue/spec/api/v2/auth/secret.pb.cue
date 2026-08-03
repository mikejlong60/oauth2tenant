// Code generated from envoy/api/v2/auth/secret.proto. DO NOT EDIT.
package auth

import (
	core_1 "envoyproxy.io/envoy-cue/spec/api/v2/core"
)

#GenericSecret: {
	"@type": "type.googleapis.com/envoy.api.v2.auth.GenericSecret"
	secret?: core_1.#DataSource
}

#SdsSecretConfig: {
	"@type":     "type.googleapis.com/envoy.api.v2.auth.SdsSecretConfig"
	name?:       string
	sds_config?: core_1.#ConfigSource
}

#Secret: {
	"@type":              "type.googleapis.com/envoy.api.v2.auth.Secret"
	name?:                string
	tls_certificate?:     #TlsCertificate
	session_ticket_keys?: #TlsSessionTicketKeys
	validation_context?:  #CertificateValidationContext
	generic_secret?:      #GenericSecret
}
