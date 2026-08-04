// Code generated from envoy/config/trace/v3/http_tracer.proto. DO NOT EDIT.
package v3

import (
	"strings"
)

#Tracing: {
	"@type": "type.googleapis.com/envoy.config.trace.v3.Tracing"
	http?:   #Tracing_Http
}

#Tracing_Http: {
	"@type": "type.googleapis.com/envoy.config.trace.v3.Tracing.Http"
	name!:   string & strings.MinRunes(1)

	// oneof config_type: at most one may be set
	*{} |
	{typed_config!: {...}}
}
