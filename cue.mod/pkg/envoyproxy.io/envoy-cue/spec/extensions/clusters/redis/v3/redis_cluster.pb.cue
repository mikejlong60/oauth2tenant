// Code generated from envoy/extensions/clusters/redis/v3/redis_cluster.proto. DO NOT EDIT.
package v3

#RedisClusterConfig: {
	"@type":                          "type.googleapis.com/envoy.extensions.clusters.redis.v3.RedisClusterConfig"
	cluster_refresh_rate?:            string // TODO(pgv): duration bounds
	cluster_refresh_timeout?:         string // TODO(pgv): duration bounds
	redirect_refresh_interval?:       string
	redirect_refresh_threshold?:      uint32
	failure_refresh_threshold?:       uint32
	host_degraded_refresh_threshold?: uint32
}
