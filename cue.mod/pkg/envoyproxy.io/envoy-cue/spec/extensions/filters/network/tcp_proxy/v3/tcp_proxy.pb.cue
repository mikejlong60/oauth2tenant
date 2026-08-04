// Code generated from envoy/extensions/filters/network/tcp_proxy/v3/tcp_proxy.proto. DO NOT EDIT.
package v3

import (
	"list"
	"strings"
	v3_1 "envoyproxy.io/envoy-cue/spec/config/core/v3"
	v3_2 "envoyproxy.io/envoy-cue/spec/config/accesslog/v3"
	v3_3 "envoyproxy.io/envoy-cue/spec/type/v3"
	v3_4 "envoyproxy.io/envoy-cue/spec/extensions/filters/network/http_connection_manager/v3"
)

// [#next-free-field: 23]
#TcpProxy: {
	"@type": "type.googleapis.com/envoy.extensions.filters.network.tcp_proxy.v3.TcpProxy"

	// The prefix to use when emitting :ref:`statistics
	// <config_network_filters_tcp_proxy_stats>`.
	stat_prefix!: string & strings.MinRunes(1)

	// The on demand policy for the upstream cluster.
	// It applies to both
	// :ref:`TcpProxy.cluster <envoy_v3_api_field_extensions.filters.network.tcp_proxy.v3.TcpProxy.cluster>`
	// and
	// :ref:`TcpProxy.weighted_clusters <envoy_v3_api_field_extensions.filters.network.tcp_proxy.v3.TcpProxy.weighted_clusters>`.
	on_demand?: #TcpProxy_OnDemand

	// Optional endpoint metadata match criteria used by the subset load balancer. Only endpoints
	// in the upstream cluster with metadata matching what is set in this field will be considered
	// for load balancing. The filter name should be specified as ``envoy.lb``.
	metadata_match?: v3_1.#Metadata

	// The idle timeout for connections managed by the TCP proxy filter. The idle timeout is defined as the
	// period in which there are no bytes sent or received on either the upstream or downstream connection.
	// If not set, the default idle timeout is 1 hour. If set to ``0s``, the timeout is disabled.
	// It is possible to dynamically override this configuration by setting a per-connection filter state
	// object for the key ``envoy.tcp_proxy.per_connection_idle_timeout_ms``.
	//
	// .. warning::
	//   Disabling this timeout is likely to yield connection leaks due to lost TCP FIN packets, etc.
	idle_timeout?: string

	// [#not-implemented-hide:] The idle timeout for connections managed by the TCP proxy
	// filter. The idle timeout is defined as the period in which there is no
	// active traffic. If not set, there is no idle timeout. When the idle timeout
	// is reached the connection will be closed. The distinction between
	// downstream_idle_timeout/upstream_idle_timeout provides a means to set
	// timeout based on the last byte sent on the downstream/upstream connection.
	downstream_idle_timeout?: string

	// [#not-implemented-hide:]
	upstream_idle_timeout?: string

	// Configuration for :ref:`access logs <arch_overview_access_logs>` emitted by this TCP proxy.
	access_log?: [...v3_2.#AccessLog]

	// The maximum number of unsuccessful connection attempts that will be made before
	// giving up. If the parameter is not specified, 1 connection attempt will be made.
	max_connect_attempts?: uint32 & >=1

	// Sets the backoff strategy. If not set, the retries are performed without backoff.
	backoff_options?: v3_1.#BackoffStrategy

	// Optional configuration for TCP proxy hash policy. If hash_policy is not set, the hash-based
	// load balancing algorithms will select a host randomly. Currently the number of hash policies is
	// limited to 1.
	hash_policy?: [...v3_3.#HashPolicy] & list.MaxItems(1)

	// If set, this configures tunneling, for example configuration options to tunnel TCP payload over
	// HTTP CONNECT. If this message is absent, the payload is proxied upstream as usual.
	// It is possible to dynamically override this configuration and disable tunneling per connection by
	// setting a per-connection filter state object for the key ``envoy.tcp_proxy.disable_tunneling``.
	tunneling_config?: #TcpProxy_TunnelingConfig

	// The maximum duration of a connection. The duration is defined as the period since a connection was
	// established. If not set, there is no maximum duration. When ``max_downstream_connection_duration`` is
	// reached, the connection is closed. The duration must be at least ``1ms``.
	max_downstream_connection_duration?: string // TODO(pgv): duration bounds

	// Percentage-based jitter for ``max_downstream_connection_duration``. The jitter increases the
	// ``max_downstream_connection_duration`` by a random duration up to the provided percentage.
	// This field is ignored if ``max_downstream_connection_duration`` is not set. If not set, no jitter
	// is added.
	max_downstream_connection_duration_jitter_percentage?: v3_3.#Percent

	// If both this field and :ref:`access_log_flush_interval
	// <envoy_v3_api_field_extensions.filters.network.tcp_proxy.v3.TcpProxy.TcpAccessLogOptions.access_log_flush_interval>`
	// are specified, the former (deprecated field) is ignored.
	//
	// .. attention::
	//   This field is deprecated in favor of
	//   :ref:`access_log_flush_interval
	//   <envoy_v3_api_field_extensions.filters.network.tcp_proxy.v3.TcpProxy.TcpAccessLogOptions.access_log_flush_interval>`.
	access_log_flush_interval?: string // TODO(pgv): duration bounds

	// If both this field and :ref:`flush_access_log_on_connected
	// <envoy_v3_api_field_extensions.filters.network.tcp_proxy.v3.TcpProxy.TcpAccessLogOptions.flush_access_log_on_connected>`
	// are specified, the former (deprecated field) is ignored.
	//
	// .. attention::
	//   This field is deprecated in favor of
	//   :ref:`flush_access_log_on_connected
	//   <envoy_v3_api_field_extensions.filters.network.tcp_proxy.v3.TcpProxy.TcpAccessLogOptions.flush_access_log_on_connected>`.
	flush_access_log_on_connected?: bool

	// Additional access log options for the TCP proxy.
	access_log_options?: #TcpProxy_TcpAccessLogOptions

	// If set, the specified ``PROXY`` protocol TLVs (Type-Length-Value) are added to the ``PROXY`` protocol state
	// created by the TCP proxy filter. These TLVs are sent in the PROXY protocol v2 header to the upstream.
	//
	// This field only takes effect when the TCP proxy filter is creating new ``PROXY`` protocol state and an
	// upstream proxy protocol transport socket is configured in the cluster. If the connection already
	// contains ``PROXY`` protocol state (including any TLVs) parsed by a downstream proxy protocol listener
	// upstream proxy protocol transport socket is configured in the cluster. If the connection already
	// contains PROXY protocol state (including any TLVs) parsed by a downstream proxy protocol listener
	// filter, the TLVs specified here are ignored.
	//
	// .. note::
	//   To ensure the specified TLVs are allowed in the upstream ``PROXY`` protocol header, you must also
	//   configure passthrough TLVs on the upstream proxy protocol transport. See
	//   :ref:`core.v3.ProxyProtocolConfig.pass_through_tlvs <envoy_v3_api_field_config.core.v3.ProxyProtocolConfig.pass_through_tlvs>`
	//   for details.
	proxy_protocol_tlvs?: [...v3_1.#TlvEntry]

	// Specifies when to establish the upstream connection.
	//
	// When not specified, defaults to ``IMMEDIATE`` for backward compatibility.
	//
	// .. attention::
	//   Server-first protocols (e.g., SMTP, MySQL, POP3) require ``IMMEDIATE`` mode.
	upstream_connect_mode?: #UpstreamConnectMode

	// Maximum bytes of early data to buffer from the downstream connection before
	// the upstream connection is established.
	//
	// If not set, the TCP proxy will read-disable the downstream connection until the
	// upstream connection is established (legacy behavior).
	//
	// If set, enables ``receive_before_connect`` mode where the filter allows the filter
	// chain to read downstream data before the upstream connection exists. The data is
	// buffered and forwarded once the upstream connection is ready. When the buffer exceeds
	// this limit, the downstream connection is read-disabled to prevent excessive memory usage.
	//
	// This field is required when ``upstream_connect_mode`` is not ``IMMEDIATE``.
	//
	// .. note::
	//   Use this carefully with server-first protocols. The upstream may send data before
	//   receiving anything from downstream, which could fill the early data buffer.
	max_early_data_bytes?: uint32 & <=1048576

	// oneof cluster_specifier: exactly one must be set
	// The upstream cluster to connect to.
	{cluster!: string} |
	{

		// Multiple upstream clusters can be specified. The request is routed to one of the upstream clusters
		// based on the weights assigned to each cluster.
		weighted_clusters!: #TcpProxy_WeightedCluster
	}
}

// Allows specification of multiple upstream clusters along with weights indicating the percentage of
// traffic forwarded to each cluster. The cluster selection is based on these weights.
#TcpProxy_WeightedCluster: {
	"@type": "type.googleapis.com/envoy.extensions.filters.network.tcp_proxy.v3.TcpProxy.WeightedCluster"

	// Specifies the upstream clusters associated with this configuration.
	clusters!: [...#TcpProxy_WeightedCluster_ClusterWeight] & list.MinItems(1)
}

#TcpProxy_WeightedCluster_ClusterWeight: {
	"@type": "type.googleapis.com/envoy.extensions.filters.network.tcp_proxy.v3.TcpProxy.WeightedCluster.ClusterWeight"

	// Name of the upstream cluster.
	name!: string & strings.MinRunes(1)

	// When a request matches the route, the choice of an upstream cluster is
	// determined by its weight. The sum of weights across all entries in the
	// clusters array determines the total weight.
	weight?: uint32 & >=1

	// Optional endpoint metadata match criteria used by the subset load balancer. Only endpoints
	// in the upstream cluster with metadata matching what is set in this field will be considered
	// for load balancing. Note that this will be merged with what's provided in
	// :ref:`TcpProxy.metadata_match
	// <envoy_v3_api_field_extensions.filters.network.tcp_proxy.v3.TcpProxy.metadata_match>`, with values
	// here taking precedence. The filter name should be specified as ``envoy.lb``.
	metadata_match?: v3_1.#Metadata
}

// Configuration for tunneling TCP over other transports or application layers.
// Tunneling is supported over HTTP/1.1 and HTTP/2. The upstream protocol is
// determined by the cluster configuration.
// [#next-free-field: 10]
#TcpProxy_TunnelingConfig: {
	"@type": "type.googleapis.com/envoy.extensions.filters.network.tcp_proxy.v3.TcpProxy.TunnelingConfig"

	// The hostname to send in the synthesized CONNECT headers to the upstream proxy.
	// This field evaluates command operators if present; otherwise, the value is used as-is.
	//
	// For example, dynamically set the hostname using downstream SNI:
	//
	// .. code-block:: yaml
	//
	//    tunneling_config:
	//      hostname: "%REQUESTED_SERVER_NAME%:443"
	//
	// For example, dynamically set the hostname using dynamic metadata:
	//
	// .. code-block:: yaml
	//
	//    tunneling_config:
	//      hostname: "%DYNAMIC_METADATA(tunnel:address)%"
	hostname!: string & strings.MinRunes(1)

	// Use the ``POST`` method instead of the ``CONNECT`` method to tunnel the TCP stream.
	// The ``protocol: bytestream`` header is not set for HTTP/2 to comply with the specification.
	//
	// The upstream proxy is expected to interpret the POST payload as raw TCP.
	use_post?: bool

	// Additional request headers to send to the upstream proxy. This is mainly used to
	// trigger the upstream to convert POST requests back to CONNECT requests.
	//
	// Neither ``:``-prefixed pseudo-headers like ``:path`` nor the ``host`` header can be overridden.
	headers_to_add?: [...v3_1.#HeaderValueOption] & list.MaxItems(1000)

	// Save response headers to the downstream connection's filter state for consumption
	// by network filters. The filter state key is ``envoy.tcp_proxy.propagate_response_headers``.
	propagate_response_headers?: bool

	// The path used with the POST method. The default path is ``/``. If this field is specified and
	// :ref:`use_post field <envoy_v3_api_field_extensions.filters.network.tcp_proxy.v3.TcpProxy.TunnelingConfig.use_post>`
	// is not set to ``true``, the configuration will be rejected.
	post_path?: string

	// Save response trailers to the downstream connection's filter state for consumption
	// by network filters. The filter state key is ``envoy.tcp_proxy.propagate_response_trailers``.
	propagate_response_trailers?: bool

	// The configuration of the request ID extension used for generation, validation, and
	// associated tracing operations when tunneling.
	//
	// If this field is set, a request ID is generated using the specified extension. If
	// this field is not set, no request ID is generated.
	//
	// When a request ID is generated, it is also stored in the downstream connection's
	// dynamic metadata under the namespace ``envoy.filters.network.tcp_proxy`` with the key
	// ``tunnel_request_id`` to allow emission from TCP proxy access logs via the
	// ``%DYNAMIC_METADATA(envoy.filters.network.tcp_proxy:tunnel_request_id)%`` formatter.
	// [#extension-category: envoy.request_id]
	request_id_extension?: v3_4.#RequestIDExtension

	// The request header name to use for emitting the generated request ID on the tunneling
	// HTTP request.
	//
	// If not specified or set to an empty string, the default header name ``x-request-id`` is
	// used.
	//
	// .. note::
	//   This setting does not alter the internal request ID handling elsewhere in Envoy and
	//   only controls the header emitted on the tunneling request.
	request_id_header?: string

	// The dynamic metadata key to use when storing the generated request ID. The metadata is
	// stored under the namespace ``envoy.filters.network.tcp_proxy``.
	//
	// If not specified or set to an empty string, the default key ``tunnel_request_id`` is used.
	// This enables customizing the key used by access log formatters such as
	// ``%DYNAMIC_METADATA(envoy.filters.network.tcp_proxy:<key>)%``.
	request_id_metadata_key?: string
}

#TcpProxy_OnDemand: {
	"@type": "type.googleapis.com/envoy.extensions.filters.network.tcp_proxy.v3.TcpProxy.OnDemand"

	// Optional configuration for the on-demand cluster discovery service.
	// If not specified, on-demand cluster discovery is disabled. When specified, the filter pauses a request
	// to an unknown cluster and begins a cluster discovery process. When discovery completes (successfully
	// or not), the request is resumed.
	odcds_config?: v3_1.#ConfigSource

	// xdstp:// resource locator for on-demand cluster collection.
	// [#not-implemented-hide:]
	resources_locator?: string

	// The timeout for on-demand cluster lookup. If the CDS cannot return the required cluster,
	// the downstream request will be closed with the error code detail NO_CLUSTER_FOUND.
	// [#not-implemented-hide:]
	timeout?: string
}

#TcpProxy_TcpAccessLogOptions: {
	"@type": "type.googleapis.com/envoy.extensions.filters.network.tcp_proxy.v3.TcpProxy.TcpAccessLogOptions"

	// The interval for flushing access logs. By default, the TCP proxy flushes a single access log when the
	// connection is closed. If this field is set, the TCP proxy flushes access logs periodically at the
	// specified interval.
	// The interval must be at least 1ms.
	access_log_flush_interval?: string // TODO(pgv): duration bounds

	// If set to ``true``, the access log is flushed when the TCP proxy successfully establishes a
	// connection with the upstream. If the connection fails, the access log is not flushed.
	flush_access_log_on_connected?: bool

	// If set to ``true``, the access log is flushed when the TCP proxy accepts a connection.
	flush_access_log_on_start?: bool
}

// Specifies when the TCP proxy establishes the upstream connection.
#UpstreamConnectMode:
	// Establish the upstream connection immediately when the downstream connection is accepted.
	// This is the default behavior and provides the lowest latency.
	"IMMEDIATE" |

	// Wait for initial data from the downstream connection before establishing the upstream connection.
	// This allows preceding filters to inspect the initial data (e.g., extracting SNI from TLS ClientHello)
	// before the upstream connection is established.
	//
	// This mode requires ``max_early_data_bytes`` to be set.
	//
	// .. warning::
	//   This mode is not suitable for server-first protocols (e.g., SMTP, MySQL, POP3) where the
	//   server sends the initial greeting. For such protocols, use ``IMMEDIATE`` mode.
	"ON_DOWNSTREAM_DATA" |

	// Wait for the downstream TLS handshake to complete before establishing the upstream connection.
	// This allows access to the full TLS connection information, including client certificates
	// and negotiated parameters, which can be used for routing decisions or passed as metadata
	// to the upstream.
	//
	// This mode requires ``max_early_data_bytes`` to be set (can be zero to disable buffering).
	//
	// .. note::
	//   This mode is only effective when the downstream connection uses TLS. For non-TLS
	//   connections, it behaves the same as ``IMMEDIATE``.
	"ON_DOWNSTREAM_TLS_HANDSHAKE"
