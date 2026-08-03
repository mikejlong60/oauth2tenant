// Code generated from envoy/extensions/transport_sockets/tls/v3/tls_spiffe_validator_config.proto. DO NOT EDIT.
package v3

import (
	"list"
	"strings"
	v3_1 "envoyproxy.io/envoy-cue/spec/config/core/v3"
)

#SPIFFECertValidatorConfig: {
	"@type": "type.googleapis.com/envoy.extensions.transport_sockets.tls.v3.SPIFFECertValidatorConfig"
	trust_domains!: [...#SPIFFECertValidatorConfig_TrustDomain] & list.MinItems(1)
	trust_bundles?: v3_1.#DataSource
}

#SPIFFECertValidatorConfig_TrustDomain: {
	"@type":       "type.googleapis.com/envoy.extensions.transport_sockets.tls.v3.SPIFFECertValidatorConfig.TrustDomain"
	name!:         string & strings.MinRunes(1)
	trust_bundle?: v3_1.#DataSource
}
