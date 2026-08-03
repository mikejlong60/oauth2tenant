// Code generated from envoy/extensions/filters/network/ext_authz/v3/ext_authz.proto. DO NOT EDIT.
package v3

import (
	"strings"
	v3_1 "envoyproxy.io/envoy-cue/spec/config/core/v3"
	v3_2 "envoyproxy.io/envoy-cue/spec/type/matcher/v3"
)

#ExtAuthz: {
	"@type":                        "type.googleapis.com/envoy.extensions.filters.network.ext_authz.v3.ExtAuthz"
	stat_prefix!:                   string & strings.MinRunes(1)
	grpc_service?:                  v3_1.#GrpcService
	failure_mode_allow?:            bool
	include_peer_certificate?:      bool
	transport_api_version?:         v3_1.#ApiVersion
	filter_enabled_metadata?:       v3_2.#MetadataMatcher
	bootstrap_metadata_labels_key?: string
	include_tls_session?:           bool
	send_tls_alert_on_denial?:      bool
	metadata_context_namespaces?: [...string]
	typed_metadata_context_namespaces?: [...string]
}
