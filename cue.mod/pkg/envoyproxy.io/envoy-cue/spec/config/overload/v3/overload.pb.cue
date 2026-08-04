// Code generated from envoy/config/overload/v3/overload.proto. DO NOT EDIT.
package v3

import (
	"list"
	"strings"
	v3_1 "envoyproxy.io/envoy-cue/spec/type/v3"
)

#ResourceMonitor: {
	"@type": "type.googleapis.com/envoy.config.overload.v3.ResourceMonitor"

	// The name of the resource monitor to instantiate. Must match a registered
	// resource monitor type.
	// See the :ref:`extensions listed in typed_config below <extension_category_envoy.resource_monitors>` for the default list of available resource monitor.
	name!: string & strings.MinRunes(1)

	// Configuration for the resource monitor being instantiated.
	// [#extension-category: envoy.resource_monitors]
	// oneof config_type: at most one may be set
	*{} |
	{typed_config!: {...}}
}

#ThresholdTrigger: {
	"@type": "type.googleapis.com/envoy.config.overload.v3.ThresholdTrigger"

	// If the resource pressure is greater than or equal to this value, the trigger
	// will enter saturation.
	value?: float64 & >=0 & <=1
}

#ScaledTrigger: {
	"@type": "type.googleapis.com/envoy.config.overload.v3.ScaledTrigger"

	// If the resource pressure is greater than this value, the trigger will be in the
	// :ref:`scaling <arch_overview_overload_manager-triggers-state>` state with value
	// ``(pressure - scaling_threshold) / (saturation_threshold - scaling_threshold)``.
	scaling_threshold?: float64 & >=0 & <=1

	// If the resource pressure is greater than this value, the trigger will enter saturation.
	saturation_threshold?: float64 & >=0 & <=1
}

#Trigger: {
	"@type": "type.googleapis.com/envoy.config.overload.v3.Trigger"

	// The name of the resource this is a trigger for.
	name!: string & strings.MinRunes(1)

	// oneof trigger_oneof: exactly one must be set
	{threshold!: #ThresholdTrigger} |
	{scaled!: #ScaledTrigger}
}

// Typed configuration for the "envoy.overload_actions.reduce_timeouts" action. See
// :ref:`the docs <config_overload_manager_reducing_timeouts>` for an example of how to configure
// the action with different timeouts and minimum values.
#ScaleTimersOverloadActionConfig: {
	"@type": "type.googleapis.com/envoy.config.overload.v3.ScaleTimersOverloadActionConfig"

	// A set of timer scaling rules to be applied.
	timer_scale_factors!: [...#ScaleTimersOverloadActionConfig_ScaleTimer] & list.MinItems(1)
}

#ScaleTimersOverloadActionConfig_ScaleTimer: {
	"@type": "type.googleapis.com/envoy.config.overload.v3.ScaleTimersOverloadActionConfig.ScaleTimer"

	// The type of timer this minimum applies to.
	timer?: #ScaleTimersOverloadActionConfig_TimerType

	// oneof overload_adjust: exactly one must be set
	// Sets the minimum duration as an absolute value.
	{min_timeout!: string} |
	{

		// Sets the minimum duration as a percentage of the maximum value.
		min_scale!: v3_1.#Percent
	}
}

#ScaleTimersOverloadActionConfig_TimerType:
	// Unsupported value; users must explicitly specify the timer they want scaled.
	"UNSPECIFIED" |

	// Adjusts the idle timer for downstream HTTP connections that takes effect when there are no active streams.
	// This affects the value of :ref:`HttpConnectionManager.common_http_protocol_options.idle_timeout
	// <envoy_v3_api_field_config.core.v3.HttpProtocolOptions.idle_timeout>`
	"HTTP_DOWNSTREAM_CONNECTION_IDLE" |

	// Adjusts the idle timer for HTTP streams initiated by downstream clients.
	// This affects the value of :ref:`RouteAction.idle_timeout <envoy_v3_api_field_config.route.v3.RouteAction.idle_timeout>` and
	// :ref:`HttpConnectionManager.stream_idle_timeout
	// <envoy_v3_api_field_extensions.filters.network.http_connection_manager.v3.HttpConnectionManager.stream_idle_timeout>`
	"HTTP_DOWNSTREAM_STREAM_IDLE" |

	// Adjusts the timer for how long downstream clients have to finish transport-level negotiations
	// before the connection is closed.
	// This affects the value of
	// :ref:`FilterChain.transport_socket_connect_timeout <envoy_v3_api_field_config.listener.v3.FilterChain.transport_socket_connect_timeout>`.
	"TRANSPORT_SOCKET_CONNECT" |

	// Adjusts the max connection duration timer for downstream HTTP connections.
	// This affects the value of
	// :ref:`HttpConnectionManager.common_http_protocol_options.max_connection_duration
	// <envoy_v3_api_field_config.core.v3.HttpProtocolOptions.max_connection_duration>`.
	"HTTP_DOWNSTREAM_CONNECTION_MAX" |

	// Adjusts the timeout for the downstream codec to flush an ended stream.
	// This affects the value of :ref:`RouteAction.flush_timeout
	// <envoy_v3_api_field_config.route.v3.RouteAction.flush_timeout>` and
	// :ref:`HttpConnectionManager.stream_flush_timeout
	// <envoy_v3_api_field_extensions.filters.network.http_connection_manager.v3.HttpConnectionManager.stream_flush_timeout>`
	"HTTP_DOWNSTREAM_STREAM_FLUSH"

#OverloadAction: {
	"@type": "type.googleapis.com/envoy.config.overload.v3.OverloadAction"

	// The name of the overload action. This is just a well-known string that
	// listeners can use for registering callbacks.
	// Valid known overload actions include:
	// - envoy.overload_actions.stop_accepting_requests
	// - envoy.overload_actions.disable_http_keepalive
	// - envoy.overload_actions.stop_accepting_connections
	// - envoy.overload_actions.reject_incoming_connections
	// - envoy.overload_actions.shrink_heap
	// - envoy.overload_actions.reduce_timeouts
	// - envoy.overload_actions.reset_high_memory_stream
	name!: string & strings.MinRunes(1)

	// A set of triggers for this action. The state of the action is the maximum
	// state of all triggers, which can be scalar values between 0 and 1 or
	// saturated. Listeners are notified when the overload action changes state.
	// An overload manager action can only have one trigger for a given resource
	// e.g. :ref:`Trigger.name
	// <envoy_v3_api_field_config.overload.v3.Trigger.name>` must be unique
	// in this list.
	triggers!: [...#Trigger] & list.MinItems(1)

	// Configuration for the action being instantiated if applicable.
	typed_config?: {...}
}

// A point within the connection or request lifecycle that provides context on
// whether to shed load at that given stage for the current entity at the
// point.
#LoadShedPoint: {
	"@type": "type.googleapis.com/envoy.config.overload.v3.LoadShedPoint"

	// This is just a well-known string for the LoadShedPoint.
	// Deployment specific LoadShedPoints e.g. within a custom extension should
	// be prefixed by the company / deployment name to avoid colliding with any
	// open source LoadShedPoints.
	name!: string & strings.MinRunes(1)

	// A set of triggers for this LoadShedPoint. The LoadShedPoint will use the
	// the maximum state of all triggers, which can be scalar values between 0 and
	// 1 or saturated. A LoadShedPoint can only have one trigger for a given
	// resource e.g. :ref:`Trigger.name
	// <envoy_v3_api_field_config.overload.v3.Trigger.name>` must be unique in
	// this list.
	triggers!: [...#Trigger] & list.MinItems(1)
}

// Configuration for which accounts the WatermarkBuffer Factories should
// track.
#BufferFactoryConfig: {
	"@type": "type.googleapis.com/envoy.config.overload.v3.BufferFactoryConfig"

	// The minimum power of two at which Envoy starts tracking an account.
	//
	// Envoy has 8 power of two buckets starting with the provided exponent below.
	// Concretely the 1st bucket contains accounts for streams that use
	// [2^minimum_account_to_track_power_of_two,
	// 2^(minimum_account_to_track_power_of_two + 1)) bytes.
	// With the 8th bucket tracking accounts
	// >= 128 * 2^minimum_account_to_track_power_of_two.
	//
	// The maximum value is 56, since we're using uint64_t for bytes counting,
	// and that's the last value that would use the 8 buckets. In practice,
	// we don't expect the proxy to be holding 2^56 bytes.
	//
	// If omitted, Envoy should not do any tracking.
	minimum_account_to_track_power_of_two?: uint32 & >=10 & <=56
}

// [#next-free-field: 6]
#OverloadManager: {
	"@type": "type.googleapis.com/envoy.config.overload.v3.OverloadManager"

	// The interval for refreshing resource usage.
	refresh_interval?: string

	// The set of resources to monitor.
	resource_monitors!: [...#ResourceMonitor] & list.MinItems(1)

	// The set of overload actions.
	actions?: [...#OverloadAction]

	// The set of load shed points.
	loadshed_points?: [...#LoadShedPoint]

	// Configuration for buffer factory.
	buffer_factory_config?: #BufferFactoryConfig
}
