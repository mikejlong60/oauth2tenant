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
	exact_context?: #ContextParams
	directives?: [...#ResourceLocator_Directive]
}

#ResourceLocator_Directive: {
	"@type": "type.googleapis.com/xds.core.v3.ResourceLocator.Directive"
	alt?:    #ResourceLocator
	entry!:  string & strings.MinRunes(1) // TODO(pgv): string.pattern
}

#ResourceLocator_Scheme: "XDSTP" | "HTTP" | "FILE"
