// Code generated from envoy/extensions/resource_monitors/cpu_utilization/v3/cpu_utilization.proto. DO NOT EDIT.
package v3

// The CPU utilization resource monitor reports the Envoy process the CPU Utilization across different platforms.
#CpuUtilizationConfig: {
	"@type": "type.googleapis.com/envoy.extensions.resource_monitors.cpu_utilization.v3.CpuUtilizationConfig"
	mode?:   #CpuUtilizationConfig_UtilizationComputeStrategy
}

#CpuUtilizationConfig_UtilizationComputeStrategy:
	// Reports CPU Utilization of the entire Linux Host machine
	"HOST" |

	// Reports CPU Utilization of Envoy Container using CGROUP stats in Linux K8s environment
	"CONTAINER"
