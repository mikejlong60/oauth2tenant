// Code generated from envoy/type/hash_policy.proto. DO NOT EDIT.
package type

#HashPolicy: {
	"@type": "type.googleapis.com/envoy.type.HashPolicy"

	// oneof policy_specifier: exactly one must be set
	{source_ip!: #HashPolicy_SourceIp}
}

#HashPolicy_SourceIp: {
	"@type": "type.googleapis.com/envoy.type.HashPolicy.SourceIp"
}
