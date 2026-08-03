// Code generated from envoy/type/http/v3/cookie.proto. DO NOT EDIT.
package v3

import (
	"strings"
)

#Cookie: {
	"@type": "type.googleapis.com/envoy.type.http.v3.Cookie"
	name!:   string & strings.MinRunes(1)
	ttl?:    string // TODO(pgv): duration bounds
	path?:   string
	attributes?: [...#CookieAttribute]
}

#CookieAttribute: {
	"@type": "type.googleapis.com/envoy.type.http.v3.CookieAttribute"
	name!:   string & strings.MinRunes(1) // TODO(pgv): string well-known *validate.StringRules_WellKnownRegex
	value?:  string                       // TODO(pgv): string well-known *validate.StringRules_WellKnownRegex
}
