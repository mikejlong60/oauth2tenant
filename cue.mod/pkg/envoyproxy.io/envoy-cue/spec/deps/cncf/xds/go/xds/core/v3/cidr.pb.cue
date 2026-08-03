// Code generated from xds/core/v3/cidr.proto. DO NOT EDIT.
package v3

import (
	"strings"
)

#CidrRange: {
	"@type":         "type.googleapis.com/xds.core.v3.CidrRange"
	address_prefix!: string & strings.MinRunes(1)
	prefix_len?:     uint32 & <=128
}
