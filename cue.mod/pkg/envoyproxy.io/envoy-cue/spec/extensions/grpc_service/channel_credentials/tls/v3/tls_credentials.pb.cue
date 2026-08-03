// Code generated from envoy/extensions/grpc_service/channel_credentials/tls/v3/tls_credentials.proto. DO NOT EDIT.
package v3

import (
	v3_1 "envoyproxy.io/envoy-cue/spec/extensions/transport_sockets/tls/v3"
)

#TlsCredentials: {
	"@type":                        "type.googleapis.com/envoy.extensions.grpc_service.channel_credentials.tls.v3.TlsCredentials"
	root_certificate_provider?:     v3_1.#CommonTlsContext_CertificateProviderInstance
	identity_certificate_provider?: v3_1.#CommonTlsContext_CertificateProviderInstance
}
