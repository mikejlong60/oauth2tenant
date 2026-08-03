// Code generated from xds/core/v3/collection_entry.proto. DO NOT EDIT.
package v3

#CollectionEntry: {
	"@type":       "type.googleapis.com/xds.core.v3.CollectionEntry"
	locator?:      #ResourceLocator
	inline_entry?: #CollectionEntry_InlineEntry
}

#CollectionEntry_InlineEntry: {
	"@type":  "type.googleapis.com/xds.core.v3.CollectionEntry.InlineEntry"
	name?:    string // TODO(pgv): string.pattern
	version?: string
	resource?: {...}
}
