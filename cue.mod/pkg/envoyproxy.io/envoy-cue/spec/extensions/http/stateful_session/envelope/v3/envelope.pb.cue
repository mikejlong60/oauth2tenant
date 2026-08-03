// Code generated from envoy/extensions/http/stateful_session/envelope/v3/envelope.proto. DO NOT EDIT.
package v3

import (
	"strings"
)

#EnvelopeSessionState: {
	"@type": "type.googleapis.com/envoy.extensions.http.stateful_session.envelope.v3.EnvelopeSessionState"
	header!: #EnvelopeSessionState_Header
}

#EnvelopeSessionState_Header: {
	"@type": "type.googleapis.com/envoy.extensions.http.stateful_session.envelope.v3.EnvelopeSessionState.Header"
	name!:   string & strings.MinRunes(1)
}
