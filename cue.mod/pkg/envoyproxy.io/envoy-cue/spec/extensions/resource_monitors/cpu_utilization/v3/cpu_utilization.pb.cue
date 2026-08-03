// Code generated from envoy/extensions/resource_monitors/cpu_utilization/v3/cpu_utilization.proto. DO NOT EDIT.
package v3

#CpuUtilizationConfig: {
	"@type": "type.googleapis.com/envoy.extensions.resource_monitors.cpu_utilization.v3.CpuUtilizationConfig"
	mode?:   #CpuUtilizationConfig_UtilizationComputeStrategy
}

#CpuUtilizationConfig_UtilizationComputeStrategy: "HOST" | "CONTAINER"
