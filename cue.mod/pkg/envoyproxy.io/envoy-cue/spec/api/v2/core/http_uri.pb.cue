// Code generated from envoy/api/v2/core/http_uri.proto. DO NOT EDIT.
package core

// Envoy external URI descriptor
#HttpUri: {
	"@type": "type.googleapis.com/envoy.api.v2.core.HttpUri"

	// The HTTP server URI. It should be a full FQDN with protocol, host and path.
	//
	// Example:
	//
	// .. code-block:: yaml
	//
	//    uri: https://www.googleapis.com/oauth2/v1/certs
	uri!: string & !=""

	// Sets the maximum duration in milliseconds that a response can take to arrive upon request.
	timeout!: string // TODO(pgv): duration bounds

	// Specify how `uri` is to be fetched. Today, this requires an explicit
	// cluster, but in the future we may support dynamic cluster creation or
	// inline DNS resolution. See `issue
	// <https://github.com/envoyproxy/envoy/issues/1606>`_.
	// oneof http_upstream_type: exactly one must be set
	// A cluster is created in the Envoy "cluster_manager" config
	// section. This field specifies the cluster name.
	//
	// Example:
	//
	// .. code-block:: yaml
	//
	//    cluster: jwks_cluster
	{cluster!: string & !=""}
}
