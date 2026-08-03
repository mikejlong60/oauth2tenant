// Code generated from envoy/config/trace/v2/lightstep.proto. DO NOT EDIT.
package v2

#LightstepConfig: {
	"@type":            "type.googleapis.com/envoy.config.trace.v2.LightstepConfig"
	collector_cluster!: string & !=""
	access_token_file!: string & !=""
	propagation_modes?: [...#LightstepConfig_PropagationMode]
}

#LightstepConfig_PropagationMode: "ENVOY" | "LIGHTSTEP" | "B3" | "TRACE_CONTEXT"
