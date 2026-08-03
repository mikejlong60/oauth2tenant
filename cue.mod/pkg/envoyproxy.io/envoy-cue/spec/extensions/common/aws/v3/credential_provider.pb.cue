// Code generated from envoy/extensions/common/aws/v3/credential_provider.proto. DO NOT EDIT.
package v3

import (
	"strings"
	v3_1 "envoyproxy.io/envoy-cue/spec/config/core/v3"
)

#AwsCredentialProvider: {
	"@type":                                 "type.googleapis.com/envoy.extensions.common.aws.v3.AwsCredentialProvider"
	assume_role_with_web_identity_provider?: #AssumeRoleWithWebIdentityCredentialProvider
	inline_credential?:                      #InlineCredentialProvider
	credentials_file_provider?:              #CredentialsFileCredentialProvider
	custom_credential_provider_chain?:       bool
	iam_roles_anywhere_credential_provider?: #IAMRolesAnywhereCredentialProvider
	config_credential_provider?:             #ConfigCredentialProvider
	container_credential_provider?:          #ContainerCredentialProvider
	environment_credential_provider?:        #EnvironmentCredentialProvider
	instance_profile_credential_provider?:   #InstanceProfileCredentialProvider
	assume_role_credential_provider?:        #AssumeRoleCredentialProvider
}

#InlineCredentialProvider: {
	"@type":            "type.googleapis.com/envoy.extensions.common.aws.v3.InlineCredentialProvider"
	access_key_id!:     string & strings.MinRunes(1)
	secret_access_key!: string & strings.MinRunes(1)
	session_token?:     string
}

#AssumeRoleWithWebIdentityCredentialProvider: {
	"@type":                         "type.googleapis.com/envoy.extensions.common.aws.v3.AssumeRoleWithWebIdentityCredentialProvider"
	web_identity_token_data_source?: v3_1.#DataSource
	role_arn!:                       string & strings.MinRunes(1)
	role_session_name?:              string
}

#CredentialsFileCredentialProvider: {
	"@type":                  "type.googleapis.com/envoy.extensions.common.aws.v3.CredentialsFileCredentialProvider"
	credentials_data_source?: v3_1.#DataSource
	profile?:                 string
}

#IAMRolesAnywhereCredentialProvider: {
	"@type":            "type.googleapis.com/envoy.extensions.common.aws.v3.IAMRolesAnywhereCredentialProvider"
	role_arn!:          string & strings.MinRunes(1)
	certificate!:       v3_1.#DataSource
	certificate_chain?: v3_1.#DataSource
	private_key!:       v3_1.#DataSource
	trust_anchor_arn!:  string & strings.MinRunes(1)
	profile_arn!:       string & strings.MinRunes(1)
	role_session_name?: string
	session_duration?:  string // TODO(pgv): duration bounds
}

#ConfigCredentialProvider: {
	"@type": "type.googleapis.com/envoy.extensions.common.aws.v3.ConfigCredentialProvider"
}

#ContainerCredentialProvider: {
	"@type": "type.googleapis.com/envoy.extensions.common.aws.v3.ContainerCredentialProvider"
}

#EnvironmentCredentialProvider: {
	"@type": "type.googleapis.com/envoy.extensions.common.aws.v3.EnvironmentCredentialProvider"
}

#InstanceProfileCredentialProvider: {
	"@type": "type.googleapis.com/envoy.extensions.common.aws.v3.InstanceProfileCredentialProvider"
}

#AssumeRoleCredentialProvider: {
	"@type":              "type.googleapis.com/envoy.extensions.common.aws.v3.AssumeRoleCredentialProvider"
	role_arn!:            string & strings.MinRunes(1)
	role_session_name?:   string
	external_id?:         string
	session_duration?:    string // TODO(pgv): duration bounds
	credential_provider?: #AwsCredentialProvider
}
