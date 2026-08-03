// Code generated from envoy/extensions/filters/http/set_metadata/v3/set_metadata.proto. DO NOT EDIT.
package v3

import (
	"strings"
)

#Metadata: {
	"@type":             "type.googleapis.com/envoy.extensions.filters.http.set_metadata.v3.Metadata"
	metadata_namespace!: string & strings.MinRunes(1)
	allow_overwrite?:    bool
	value?: {...}
	typed_value?: {...}
}

#Config: {
	"@type":             "type.googleapis.com/envoy.extensions.filters.http.set_metadata.v3.Config"
	metadata_namespace?: string
	value?: {...}
	metadata?: [...#Metadata]
}
