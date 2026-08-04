// Code generated from xds/core/v3/cidr.proto. DO NOT EDIT.
package v3

import (
	"strings"
)

// CidrRange specifies an IP Address and a prefix length to construct
// the subnet mask for a `CIDR <https://tools.ietf.org/html/rfc4632>`_ range.
#CidrRange: {
	"@type": "type.googleapis.com/xds.core.v3.CidrRange"

	// IPv4 or IPv6 address, e.g. ``192.0.0.0`` or ``2001:db8::``.
	address_prefix!: string & strings.MinRunes(1)

	// Length of prefix, e.g. 0, 32. Defaults to 0 when unset.
	prefix_len?: uint32 & <=128
}
