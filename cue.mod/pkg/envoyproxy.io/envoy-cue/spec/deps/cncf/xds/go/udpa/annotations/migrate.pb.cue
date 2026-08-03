// Code generated from udpa/annotations/migrate.proto. DO NOT EDIT.
package annotations

#MigrateAnnotation: {
	"@type": "type.googleapis.com/udpa.annotations.MigrateAnnotation"
	rename?: string
}

#FieldMigrateAnnotation: {
	"@type":          "type.googleapis.com/udpa.annotations.FieldMigrateAnnotation"
	rename?:          string
	oneof_promotion?: string
}

#FileMigrateAnnotation: {
	"@type":          "type.googleapis.com/udpa.annotations.FileMigrateAnnotation"
	move_to_package?: string
}
