// Code generated from envoy/extensions/transport_sockets/tls/v3/secret.proto. DO NOT EDIT.
package v3

import (
	"strings"
	v3_1 "envoyproxy.io/envoy-cue/spec/config/core/v3"
)

#GenericSecret: {
	"@type": "type.googleapis.com/envoy.extensions.transport_sockets.tls.v3.GenericSecret"
	secret?: v3_1.#DataSource
	secrets?: {[string]: v3_1.#DataSource}
}

#SdsSecretConfig: {
	"@type":     "type.googleapis.com/envoy.extensions.transport_sockets.tls.v3.SdsSecretConfig"
	name!:       string & strings.MinRunes(1)
	sds_config?: v3_1.#ConfigSource
}

#Secret: {
	"@type":              "type.googleapis.com/envoy.extensions.transport_sockets.tls.v3.Secret"
	name?:                string
	tls_certificate?:     #TlsCertificate
	session_ticket_keys?: #TlsSessionTicketKeys
	validation_context?:  #CertificateValidationContext
	generic_secret?:      #GenericSecret
}
