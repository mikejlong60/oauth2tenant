// Code generated from envoy/extensions/matching/common_inputs/environment_variable/v3/input.proto. DO NOT EDIT.
package v3

import (
	"strings"
)

// Reads an environment variable to provide an input for matching.
#Config: {
	"@type": "type.googleapis.com/envoy.extensions.matching.common_inputs.environment_variable.v3.Config"

	// Name of the environment variable to read from.
	name!: string & strings.MinRunes(1)
}
