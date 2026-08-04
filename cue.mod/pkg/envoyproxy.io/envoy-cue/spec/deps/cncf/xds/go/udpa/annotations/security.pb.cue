// Code generated from udpa/annotations/security.proto. DO NOT EDIT.
package annotations

// These annotations indicate metadata for the purpose of understanding the
// security significance of fields.
#FieldSecurityAnnotation: {
	"@type": "type.googleapis.com/udpa.annotations.FieldSecurityAnnotation"

	// Field should be set in the presence of untrusted downstreams.
	configure_for_untrusted_downstream?: bool

	// Field should be set in the presence of untrusted upstreams.
	configure_for_untrusted_upstream?: bool
}
