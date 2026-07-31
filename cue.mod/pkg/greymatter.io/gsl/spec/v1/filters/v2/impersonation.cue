package v2

// Greymatter Impersonation Filter v2 Configuration
// This is the v2 version of the impersonation filter for Proxy2
#GreymatterImpersonationConfig: {

	version: "v2"

	// Whitelist is the array-based format for allowed identities
	// Supports Distinguished Names (DNs) and SPIFFE IDs (spiffe://...)
	whitelist?: [...string]

	// Servers is the legacy comma-separated or pipe-delimited string format for allowed identities
	// DEPRECATED: Use whitelist instead. This field is maintained for backward compatibility.
	servers?: string

	// CaseSensitive determines if identity matching is case sensitive
	// Default: false
	caseSensitive?: bool
}
