// Code generated from xds/core/v3/resource_locator.proto. DO NOT EDIT.
package v3

import (
	"strings"
)

#ResourceLocator: {
	"@type":        "type.googleapis.com/xds.core.v3.ResourceLocator"
	scheme?:        #ResourceLocator_Scheme
	id?:            string
	authority?:     string
	resource_type!: string & strings.MinRunes(1)
	directives?: [...#ResourceLocator_Directive]

	// oneof context_param_specifier: at most one may be set
	*{} |
	{exact_context!: #ContextParams}
}

#ResourceLocator_Directive: {
	"@type": "type.googleapis.com/xds.core.v3.ResourceLocator.Directive"

	// oneof directive: exactly one must be set
	// TODO(pgv): entry.string.pattern
	{alt!: #ResourceLocator} |
	{entry!: string & strings.MinRunes(1)}
}

#ResourceLocator_Scheme: "XDSTP" | "HTTP" | "FILE"
