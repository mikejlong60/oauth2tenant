// Code generated from envoy/api/v2/ratelimit/ratelimit.proto. DO NOT EDIT.
package ratelimit

import (
	"list"
)

#RateLimitDescriptor: {
	"@type": "type.googleapis.com/envoy.api.v2.ratelimit.RateLimitDescriptor"
	entries!: [...#RateLimitDescriptor_Entry] & list.MinItems(1)
}

#RateLimitDescriptor_Entry: {
	"@type": "type.googleapis.com/envoy.api.v2.ratelimit.RateLimitDescriptor.Entry"
	key!:    string & !=""
	value!:  string & !=""
}
