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
	sample_count_float?: float64 // Overrides sample_count if > 0.
	sample_sum?:         float64

	// Buckets for the conventional histogram.
	bucket?: [...#Bucket] // Ordered in increasing order of upper_bound, +Inf bucket is optional.
	created_timestamp?:   string

	// schema defines the bucket schema. Currently, valid numbers are -4 <= n <= 8.
	// They are all for base-2 bucket schemas, where 1 is a bucket boundary in each case, and
	// then each power of two is divided into 2^n logarithmic buckets.
	// Or in other words, each bucket boundary is the previous boundary times 2^(2^-n).
	// In the future, more bucket schemas may be added using numbers < -4 or > 8.
	schema?:           int32
	zero_threshold?:   float64 // Breadth of the zero bucket.
	zero_count?:       uint64  // Count in zero bucket.
	zero_count_float?: float64 // Overrides sb_zero_count if > 0.

	// Negative buckets for the native histogram.
	negative_span?: [...#BucketSpan]

	// Use either "negative_delta" or "negative_count", the former for
	// regular histograms with integer counts, the latter for float
	// histograms.
	negative_delta?: [...int64] // Count delta of each bucket compared to previous one (or to zero for 1st bucket).
	negative_count?: [...float64] // Absolute count of each bucket.

	// Positive buckets for the native histogram.
	// Use a no-op span (offset 0, length 0) for a native histogram without any
	// observations yet and with a zero_threshold of 0. Otherwise, it would be
	// indistinguishable from a classic histogram.
	positive_span?: [...#BucketSpan]

	// Use either "positive_delta" or "positive_count", the former for
	// regular histograms with integer counts, the latter for float
	// histograms.
	positive_delta?: [...int64] // Count delta of each bucket compared to previous one (or to zero for 1st bucket).
	positive_count?: [...float64] // Absolute count of each bucket.

	// Only used for native histograms. These exemplars MUST have a timestamp.
	exemplars?: [...#Exemplar]
}

// A Bucket of a conventional histogram, each of which is treated as
// an individual counter-like time series by Prometheus.
#Bucket: {
	"@type":                 "type.googleapis.com/io.prometheus.client.Bucket"
	cumulative_count?:       uint64  // Cumulative in increasing order.
	cumulative_count_float?: float64 // Overrides cumulative_count if > 0.
	upper_bound?:            float64 // Inclusive.
	exemplar?:               #Exemplar
}

// A BucketSpan defines a number of consecutive buckets in a native
// histogram with their offset. Logically, it would be more
// straightforward to include the bucket counts in the Span. However,
// the protobuf representation is more compact in the way the data is
// structured here (with all the buckets in a single array separate
// from the Spans).
#BucketSpan: {
	"@type": "type.googleapis.com/io.prometheus.client.BucketSpan"
	offset?: int32  // Gap to previous span, or starting point for 1st span (which can be negative).
	length?: uint32 // Length of consecutive buckets.
}

#Exemplar: {
	"@type": "type.googleapis.com/io.prometheus.client.Exemplar"
	label?: [...#LabelPair]
	value?:     float64
	timestamp?: string // OpenMetrics-style.
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

#MetricType:
	// COUNTER must use the Metric field "counter".
	"COUNTER" |

	// GAUGE must use the Metric field "gauge".
	"GAUGE" |

	// SUMMARY must use the Metric field "summary".
	"SUMMARY" |

	// UNTYPED must use the Metric field "untyped".
	"UNTYPED" |

	// HISTOGRAM must use the Metric field "histogram".
	"HISTOGRAM" |

	// GAUGE_HISTOGRAM must use the Metric field "histogram".
	"GAUGE_HISTOGRAM"
