// Code generated from envoy/config/trace/v2/http_tracer.proto. DO NOT EDIT.
package v2

#Tracing: {
	"@type": "type.googleapis.com/envoy.config.trace.v2.Tracing"
	http?:   #Tracing_Http
}

#Tracing_Http: {
	"@type": "type.googleapis.com/envoy.config.trace.v2.Tracing.Http"
	name!:   string & !=""
	config?: {...}
	typed_config?: {...}
}
