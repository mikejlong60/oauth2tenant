// Code generated from envoy/extensions/filters/http/gcp_authn/v3/gcp_authn.proto. DO NOT EDIT.
package v3

import (
	"strings"
	v3_1 "envoyproxy.io/envoy-cue/spec/config/core/v3"
)

// Filter configuration.
// [#next-free-field: 7]
#GcpAuthnFilterConfig: {
	"@type": "type.googleapis.com/envoy.extensions.filters.http.gcp_authn.v3.GcpAuthnFilterConfig"

	// The HTTP URI to fetch tokens from GCE Metadata Server(https://cloud.google.com/compute/docs/metadata/overview).
	// The URL format is "http://metadata.google.internal/computeMetadata/v1/instance/service-accounts/default/identity?audience=[AUDIENCE]"
	//
	// This field is deprecated because it does not match the API surface provided by the google auth libraries.
	// Control planes should not attempt to override the metadata server URI.
	// The cluster and timeout can be configured using the ``cluster`` and ``timeout`` fields instead.
	// For backward compatibility, the cluster and timeout configured in this field will be used
	// if the new ``cluster`` and ``timeout`` fields are not set.
	http_uri?: v3_1.#HttpUri

	// Retry policy for fetching tokens.
	// Not supported by all data planes.
	retry_policy?: v3_1.#RetryPolicy

	// Token cache configuration. This field is optional.
	cache_config?: #TokenCacheConfig

	// Request header location to extract the token. By default (i.e. if this field is not specified), the token
	// is extracted to the Authorization HTTP header, in the format "Authorization: Bearer <token>".
	// Not supported by all data planes.
	token_header?: #TokenHeader

	// Cluster to send traffic to the GCE metadata server. Not supported
	// by all data planes; a data plane may instead have its own mechanism
	// for contacting the metadata server.
	cluster?: string

	// Timeout for fetching the tokens from the GCE metadata server.
	// Not supported by all data planes.
	timeout?: string // TODO(pgv): duration bounds
}

// Audience is the URL of the receiving service that performs token authentication.
// It will be provided to the filter through cluster's typed_filter_metadata.
#Audience: {
	"@type": "type.googleapis.com/envoy.extensions.filters.http.gcp_authn.v3.Audience"
	url!:    string & strings.MinRunes(1)
}

// Token Cache configuration.
#TokenCacheConfig: {
	"@type": "type.googleapis.com/envoy.extensions.filters.http.gcp_authn.v3.TokenCacheConfig"

	// The number of cache entries. The maximum number of entries is INT64_MAX as it is constrained by underlying cache implementation.
	// Default value 0 (i.e., proto3 defaults) disables the cache by default. Other default values will enable the cache.
	cache_size?: uint64 & <=9223372036854775807
}

#TokenHeader: {
	"@type": "type.googleapis.com/envoy.extensions.filters.http.gcp_authn.v3.TokenHeader"

	// The HTTP header's name.
	name!: string & strings.MinRunes(1) // TODO(pgv): string well-known *validate.StringRules_WellKnownRegex

	// The header's prefix. The format is "value_prefix<token>"
	// For example, for "Authorization: Bearer <token>", value_prefix="Bearer " with a space at the
	// end.
	value_prefix?: string // TODO(pgv): string well-known *validate.StringRules_WellKnownRegex
}
