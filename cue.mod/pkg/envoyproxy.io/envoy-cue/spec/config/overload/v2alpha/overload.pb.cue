// Code generated from envoy/config/overload/v2alpha/overload.proto. DO NOT EDIT.
package v2alpha

import (
	"list"
)

#ResourceMonitor: {
	"@type": "type.googleapis.com/envoy.config.overload.v2alpha.ResourceMonitor"
	name!:   string & !=""

	// oneof config_type: at most one may be set
	*{} |
	{config!: {...}} |
	{typed_config!: {...}}
}

#ThresholdTrigger: {
	"@type": "type.googleapis.com/envoy.config.overload.v2alpha.ThresholdTrigger"
	value?:  float64 & >=0 & <=1
}

#Trigger: {
	"@type": "type.googleapis.com/envoy.config.overload.v2alpha.Trigger"
	name!:   string & !=""

	// oneof trigger_oneof: exactly one must be set
	{threshold!: #ThresholdTrigger}
}

#OverloadAction: {
	"@type": "type.googleapis.com/envoy.config.overload.v2alpha.OverloadAction"
	name!:   string & !=""
	triggers!: [...#Trigger] & list.MinItems(1)
}

#OverloadManager: {
	"@type":           "type.googleapis.com/envoy.config.overload.v2alpha.OverloadManager"
	refresh_interval?: string
	resource_monitors!: [...#ResourceMonitor] & list.MinItems(1)
	actions?: [...#OverloadAction]
}
