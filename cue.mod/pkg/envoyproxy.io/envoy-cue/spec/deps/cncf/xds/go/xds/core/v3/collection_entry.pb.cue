// Code generated from xds/core/v3/collection_entry.proto. DO NOT EDIT.
package v3

// xDS collection resource wrapper. This encapsulates a xDS resource when
// appearing inside a list collection resource. List collection resources are
// regular Resource messages of type:
//
// .. code-block:: proto
//
//   message <T>Collection {
//     repeated CollectionEntry resources = 1;
//   }
#CollectionEntry: {
	"@type": "type.googleapis.com/xds.core.v3.CollectionEntry"

	// oneof resource_specifier: exactly one must be set
	// A resource locator describing how the member resource is to be located.
	{locator!: #ResourceLocator} |
	{

		// The resource is inlined in the list collection.
		inline_entry!: #CollectionEntry_InlineEntry
	}
}

// Inlined resource entry.
#CollectionEntry_InlineEntry: {
	"@type": "type.googleapis.com/xds.core.v3.CollectionEntry.InlineEntry"

	// Optional name to describe the inlined resource. Resource names must match
	// ``[a-zA-Z0-9_-\./]+`` (TODO(htuch): turn this into a PGV constraint once
	// finalized, probably should be a RFC3986 pchar). This name allows
	// reference via the #entry directive in ResourceLocator.
	name?: string // TODO(pgv): string.pattern

	// The resource's logical version. It is illegal to have the same named xDS
	// resource name at a given version with different resource payloads.
	version?: string

	// The resource payload, including type URL.
	resource?: {...}
}
