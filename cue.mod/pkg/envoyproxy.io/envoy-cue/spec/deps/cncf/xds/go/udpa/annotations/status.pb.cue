// Code generated from udpa/annotations/status.proto. DO NOT EDIT.
package annotations

#StatusAnnotation: {
	"@type": "type.googleapis.com/udpa.annotations.StatusAnnotation"

	// The entity is work-in-progress and subject to breaking changes.
	work_in_progress?: bool

	// The entity belongs to a package with the given version status.
	package_version_status?: #PackageVersionStatus
}

#PackageVersionStatus:
	// Unknown package version status.
	"UNKNOWN" |

	// This version of the package is frozen.
	"FROZEN" |

	// This version of the package is the active development version.
	"ACTIVE" |

	// This version of the package is the candidate for the next major version. It
	// is typically machine generated from the active development version.
	"NEXT_MAJOR_VERSION_CANDIDATE"
