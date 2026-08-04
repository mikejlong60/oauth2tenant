// Code generated from envoy/config/overload/v3/overload.proto. DO NOT EDIT.
package v3

import (
	"list"
	"strings"
	v3_1 "envoyproxy.io/envoy-cue/spec/type/v3"
)

#ResourceMonitor: {
	"@type": "type.googleapis.com/envoy.config.overload.v3.ResourceMonitor"
	name!:   string & strings.MinRunes(1)

	// oneof config_type: at most one may be set
	*{} |
	{typed_config!: {...}}
}

#ThresholdTrigger: {
	"@type": "type.googleapis.com/envoy.config.overload.v3.ThresholdTrigger"
	value?:  float64 & >=0 & <=1
}

#ScaledTrigger: {
	"@type":               "type.googleapis.com/envoy.config.overload.v3.ScaledTrigger"
	scaling_threshold?:    float64 & >=0 & <=1
	saturation_threshold?: float64 & >=0 & <=1
}

#Trigger: {
	"@type": "type.googleapis.com/envoy.config.overload.v3.Trigger"
	name!:   string & strings.MinRunes(1)

	// oneof trigger_oneof: exactly one must be set
	{threshold!: #ThresholdTrigger} |
	{scaled!: #ScaledTrigger}
}

#ScaleTimersOverloadActionConfig: {
	"@type": "type.googleapis.com/envoy.config.overload.v3.ScaleTimersOverloadActionConfig"
	timer_scale_factors!: [...#ScaleTimersOverloadActionConfig_ScaleTimer] & list.MinItems(1)
}

#ScaleTimersOverloadActionConfig_ScaleTimer: {
	"@type": "type.googleapis.com/envoy.config.overload.v3.ScaleTimersOverloadActionConfig.ScaleTimer"
	timer?:  #ScaleTimersOverloadActionConfig_TimerType

	// oneof overload_adjust: exactly one must be set
	{min_timeout!: string} |
	{min_scale!: v3_1.#Percent}
}

#ScaleTimersOverloadActionConfig_TimerType: "UNSPECIFIED" | "HTTP_DOWNSTREAM_CONNECTION_IDLE" | "HTTP_DOWNSTREAM_STREAM_IDLE" | "TRANSPORT_SOCKET_CONNECT" | "HTTP_DOWNSTREAM_CONNECTION_MAX" | "HTTP_DOWNSTREAM_STREAM_FLUSH"

#OverloadAction: {
	"@type": "type.googleapis.com/envoy.config.overload.v3.OverloadAction"
	name!:   string & strings.MinRunes(1)
	triggers!: [...#Trigger] & list.MinItems(1)
	typed_config?: {...}
}

#LoadShedPoint: {
	"@type": "type.googleapis.com/envoy.config.overload.v3.LoadShedPoint"
	name!:   string & strings.MinRunes(1)
	triggers!: [...#Trigger] & list.MinItems(1)
}

#BufferFactoryConfig: {
	"@type":                                "type.googleapis.com/envoy.config.overload.v3.BufferFactoryConfig"
	minimum_account_to_track_power_of_two?: uint32 & >=10 & <=56
}

#OverloadManager: {
	"@type":           "type.googleapis.com/envoy.config.overload.v3.OverloadManager"
	refresh_interval?: string
	resource_monitors!: [...#ResourceMonitor] & list.MinItems(1)
	actions?: [...#OverloadAction]
	loadshed_points?: [...#LoadShedPoint]
	buffer_factory_config?: #BufferFactoryConfig
}
