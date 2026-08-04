// Code generated from envoy/extensions/access_loggers/stats/v3/stats.proto. DO NOT EDIT.
package v3

import (
	"strings"
)

#Config: {
	"@type": "type.googleapis.com/envoy.extensions.access_loggers.stats.v3.Config"

	// The stat prefix for the generated stats.
	stat_prefix!: string & strings.MinRunes(1)

	// The histograms this logger will emit.
	histograms?: [...#Config_Histogram]

	// The counters this logger will emit.
	counters?: [...#Config_Counter]
}

// Defines a tag on a stat.
#Config_Tag: {
	"@type": "type.googleapis.com/envoy.extensions.access_loggers.stats.v3.Config.Tag"

	// The name of the tag.
	name!: string & strings.MinRunes(1)

	// The value of the tag, using :ref:`command operators <config_access_log_command_operators>`.
	value_format!: string & strings.MinRunes(1)
}

// Defines the name and tags of a stat.
#Config_Stat: {
	"@type": "type.googleapis.com/envoy.extensions.access_loggers.stats.v3.Config.Stat"

	// The name of the stat.
	name!: string & strings.MinRunes(1)

	// The tags for the stat.
	tags?: [...#Config_Tag]
}

// Configuration for a histogram stat.
#Config_Histogram: {
	"@type": "type.googleapis.com/envoy.extensions.access_loggers.stats.v3.Config.Histogram"

	// The name and tags of this histogram.
	stat!: #Config_Stat

	// The units for this histogram.
	unit?: #Config_Histogram_Unit

	// The format string for the value of this histogram, using :ref:`command operators <config_access_log_command_operators>`.
	// This must evaluate to a positive number.
	value_format!: string & strings.MinRunes(1)
}

// The histogram units. The units are needed for some stat sinks.
#Config_Histogram_Unit:
	"Unspecified" |
	"Bytes" |
	"Microseconds" |
	"Milliseconds" |

	// Values are scaled to range 0-1.0, indicating 0%-100%. Values can be outside this range,
	// but must be positive. Values extremely far out of this range may overflow.
	"Percent"

// Configuration for a counter stat.
#Config_Counter: {
	"@type": "type.googleapis.com/envoy.extensions.access_loggers.stats.v3.Config.Counter"

	// The name and tags of this counter.
	stat!: #Config_Stat

	// The format string for the value to add to this counter, using :ref:`command operators <config_access_log_command_operators>`.
	// One of ``value_format`` or ``value_fixed`` must be configured.
	value_format?: string

	// A fixed value to add to this counter.
	// One of ``value_format`` or ``value_fixed`` must be configured.
	value_fixed?: uint64 & >0
}
