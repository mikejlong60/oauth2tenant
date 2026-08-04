// Code generated from envoy/extensions/filters/http/set_metadata/v3/set_metadata.proto. DO NOT EDIT.
package v3

import (
	"strings"
)

#Metadata: {
	"@type": "type.googleapis.com/envoy.extensions.filters.http.set_metadata.v3.Metadata"

	// The metadata namespace.
	metadata_namespace!: string & strings.MinRunes(1)

	// Allow the filter to overwrite or merge with an existing value in the namespace.
	allow_overwrite?: bool

	// The value to place at the namespace. If ``allow_overwrite``, this will
	// overwrite or merge with any existing values in that namespace. See
	// :ref:`the filter documentation <config_http_filters_set_metadata>` for
	// more information on how this value is merged with potentially existing
	// ones if ``allow_overwrite`` is configured. Only one of ``value`` and
	// ``typed_value`` may be set.
	value?: {...}

	// The value to place at the namespace. If ``allow_overwrite``, this will
	// overwrite any existing values in that namespace. Only one of ``value`` and
	// ``typed_value`` may be set.
	typed_value?: {...}
}

#Config: {
	"@type": "type.googleapis.com/envoy.extensions.filters.http.set_metadata.v3.Config"

	// The metadata namespace.
	// This field is deprecated; please use ``metadata`` as replacement.
	metadata_namespace?: string

	// The untyped value to update the dynamic metadata namespace with. See
	// :ref:`the filter documentation <config_http_filters_set_metadata>` for
	// more information on how this value is merged with potentially existing
	// ones.
	// This field is deprecated; please use ``metadata`` as replacement.
	value?: {...}

	// Defines changes to be made to dynamic metadata.
	metadata?: [...#Metadata]
}
