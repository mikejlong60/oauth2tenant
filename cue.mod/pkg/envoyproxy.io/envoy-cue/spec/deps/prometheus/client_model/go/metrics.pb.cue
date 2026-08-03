// Code generated from io/prometheus/client/metrics.proto. DO NOT EDIT.
package go

#LabelPair: {
	"@type": "type.googleapis.com/io.prometheus.client.LabelPair"
	name?:   string
	value?:  string
}

#Gauge: {
	"@type": "type.googleapis.com/io.prometheus.client.Gauge"
	value?:  float64
}

#Counter: {
	"@type":            "type.googleapis.com/io.prometheus.client.Counter"
	value?:             float64
	exemplar?:          #Exemplar
	created_timestamp?: string
}

#Quantile: {
	"@type":   "type.googleapis.com/io.prometheus.client.Quantile"
	quantile?: float64
	value?:    float64
}

#Summary: {
	"@type":       "type.googleapis.com/io.prometheus.client.Summary"
	sample_count?: uint64
	sample_sum?:   float64
	quantile?: [...#Quantile]
	created_timestamp?: string
}

#Untyped: {
	"@type": "type.googleapis.com/io.prometheus.client.Untyped"
	value?:  float64
}

#Histogram: {
	"@type":             "type.googleapis.com/io.prometheus.client.Histogram"
	sample_count?:       uint64
	sample_count_float?: float64
	sample_sum?:         float64
	bucket?: [...#Bucket]
	created_timestamp?: string
	schema?:            int32
	zero_threshold?:    float64
	zero_count?:        uint64
	zero_count_float?:  float64
	negative_span?: [...#BucketSpan]
	negative_delta?: [...int64]
	negative_count?: [...float64]
	positive_span?: [...#BucketSpan]
	positive_delta?: [...int64]
	positive_count?: [...float64]
	exemplars?: [...#Exemplar]
}

#Bucket: {
	"@type":                 "type.googleapis.com/io.prometheus.client.Bucket"
	cumulative_count?:       uint64
	cumulative_count_float?: float64
	upper_bound?:            float64
	exemplar?:               #Exemplar
}

#BucketSpan: {
	"@type": "type.googleapis.com/io.prometheus.client.BucketSpan"
	offset?: int32
	length?: uint32
}

#Exemplar: {
	"@type": "type.googleapis.com/io.prometheus.client.Exemplar"
	label?: [...#LabelPair]
	value?:     float64
	timestamp?: string
}

#Metric: {
	"@type": "type.googleapis.com/io.prometheus.client.Metric"
	label?: [...#LabelPair]
	gauge?:        #Gauge
	counter?:      #Counter
	summary?:      #Summary
	untyped?:      #Untyped
	histogram?:    #Histogram
	timestamp_ms?: int64
}

#MetricFamily: {
	"@type": "type.googleapis.com/io.prometheus.client.MetricFamily"
	name?:   string
	help?:   string
	type?:   #MetricType
	metric?: [...#Metric]
	unit?: string
}

#MetricType: "COUNTER" | "GAUGE" | "SUMMARY" | "UNTYPED" | "HISTOGRAM" | "GAUGE_HISTOGRAM"
