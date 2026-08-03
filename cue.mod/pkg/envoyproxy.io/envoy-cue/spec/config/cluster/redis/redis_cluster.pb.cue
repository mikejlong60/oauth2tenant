// Code generated from envoy/config/cluster/redis/redis_cluster.proto. DO NOT EDIT.
package redis

#RedisClusterConfig: {
	"@type":                          "type.googleapis.com/envoy.config.cluster.redis.RedisClusterConfig"
	cluster_refresh_rate?:            string // TODO(pgv): duration bounds
	cluster_refresh_timeout?:         string // TODO(pgv): duration bounds
	redirect_refresh_interval?:       string
	redirect_refresh_threshold?:      uint32
	failure_refresh_threshold?:       uint32
	host_degraded_refresh_threshold?: uint32
}
