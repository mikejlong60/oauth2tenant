// Code generated from envoy/extensions/key_value/file_based/v3/config.proto. DO NOT EDIT.
package v3

import (
	"strings"
)

#FileBasedKeyValueStoreConfig: {
	"@type":         "type.googleapis.com/envoy.extensions.key_value.file_based.v3.FileBasedKeyValueStoreConfig"
	filename!:       string & strings.MinRunes(1)
	flush_interval?: string
	max_entries?:    uint32
}
