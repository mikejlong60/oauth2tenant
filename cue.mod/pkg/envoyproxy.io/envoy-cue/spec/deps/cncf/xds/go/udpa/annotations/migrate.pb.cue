// Code generated from udpa/annotations/migrate.proto. DO NOT EDIT.
package annotations

#MigrateAnnotation: {
	"@type": "type.googleapis.com/udpa.annotations.MigrateAnnotation"

	// Rename the message/enum/enum value in next version.
	rename?: string
}

#FieldMigrateAnnotation: {
	"@type": "type.googleapis.com/udpa.annotations.FieldMigrateAnnotation"

	// Rename the field in next version.
	rename?: string

	// Add the field to a named oneof in next version. If this already exists, the
	// field will join its siblings under the oneof, otherwise a new oneof will be
	// created with the given name.
	oneof_promotion?: string
}

#FileMigrateAnnotation: {
	"@type": "type.googleapis.com/udpa.annotations.FileMigrateAnnotation"

	// Move all types in the file to another package, this implies changing proto
	// file path.
	move_to_package?: string
}
