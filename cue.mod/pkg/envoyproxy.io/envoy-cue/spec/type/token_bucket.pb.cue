// Code generated from envoy/type/token_bucket.proto. DO NOT EDIT.
package type

#TokenBucket: {
	"@type":          "type.googleapis.com/envoy.type.TokenBucket"
	max_tokens?:      uint32 & >0
	tokens_per_fill?: uint32 & >0
	fill_interval!:   string // TODO(pgv): duration bounds
}
