// Code generated from envoy/type/v3/token_bucket.proto. DO NOT EDIT.
package v3

#TokenBucket: {
	"@type":          "type.googleapis.com/envoy.type.v3.TokenBucket"
	max_tokens?:      uint32 & >0
	tokens_per_fill?: uint32 & >0
	fill_interval!:   string // TODO(pgv): duration bounds
}
