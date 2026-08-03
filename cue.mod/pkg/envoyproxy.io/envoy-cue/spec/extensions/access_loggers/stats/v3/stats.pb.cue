// Code generated from envoy/extensions/access_loggers/stats/v3/stats.proto. DO NOT EDIT.
package v3

import (
	"strings"
)

#Config: {
	"@type":      "type.googleapis.com/envoy.extensions.access_loggers.stats.v3.Config"
	stat_prefix!: string & strings.MinRunes(1)
	histograms?: [...#Config_Histogram]
	counters?: [...#Config_Counter]
}

#Config_Tag: {
	"@type":       "type.googleapis.com/envoy.extensions.access_loggers.stats.v3.Config.Tag"
	name!:         string & strings.MinRunes(1)
	value_format!: string & strings.MinRunes(1)
}

#Config_Stat: {
	"@type": "type.googleapis.com/envoy.extensions.access_loggers.stats.v3.Config.Stat"
	name!:   string & strings.MinRunes(1)
	tags?: [...#Config_Tag]
}

#Config_Histogram: {
	"@type":       "type.googleapis.com/envoy.extensions.access_loggers.stats.v3.Config.Histogram"
	stat!:         #Config_Stat
	unit?:         #Config_Histogram_Unit
	value_format!: string & strings.MinRunes(1)
}

#Config_Histogram_Unit: "Unspecified" | "Bytes" | "Microseconds" | "Milliseconds" | "Percent"

#Config_Counter: {
	"@type":       "type.googleapis.com/envoy.extensions.access_loggers.stats.v3.Config.Counter"
	stat!:         #Config_Stat
	value_format?: string
	value_fixed?:  uint64 & >0
}
