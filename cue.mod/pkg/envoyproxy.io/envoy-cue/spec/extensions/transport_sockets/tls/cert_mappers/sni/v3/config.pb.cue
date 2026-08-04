// Code generated from envoy/extensions/transport_sockets/tls/cert_mappers/sni/v3/config.proto. DO NOT EDIT.
package v3

import (
	"strings"
)

// Uses the SNI value from the TLS client hello as the secret resource name in the downstream selector.
#SNI: {
	"@type": "type.googleapis.com/envoy.extensions.transport_sockets.tls.cert_mappers.sni.v3.SNI"

	// The value to use as the secret name when SNI is empty or absent.
	default_value!: string & strings.MinRunes(1)
}
