// Code generated from envoy/extensions/filters/http/credential_injector/v3/credential_injector.proto. DO NOT EDIT.
package v3

import (
	v3_1 "envoyproxy.io/envoy-cue/spec/config/core/v3"
)

#CredentialInjector: {
	"@type":                           "type.googleapis.com/envoy.extensions.filters.http.credential_injector.v3.CredentialInjector"
	overwrite?:                        bool
	allow_request_without_credential?: bool
	credential!:                       v3_1.#TypedExtensionConfig
}
