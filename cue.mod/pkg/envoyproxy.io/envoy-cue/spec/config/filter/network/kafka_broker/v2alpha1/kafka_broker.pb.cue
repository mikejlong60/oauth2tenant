// Code generated from envoy/config/filter/network/kafka_broker/v2alpha1/kafka_broker.proto. DO NOT EDIT.
package v2alpha1

import (
	"strings"
)

#KafkaBroker: {
	"@type":                 "type.googleapis.com/envoy.config.filter.network.kafka_broker.v2alpha1.KafkaBroker"
	stat_prefix!:            string & !=""
	force_response_rewrite?: bool
	api_keys_allowed?: [...uint32]
	api_keys_denied?: [...uint32]

	// oneof broker_address_rewrite_spec: at most one may be set
	*{} |
	{id_based_broker_address_rewrite_spec!: #IdBasedBrokerRewriteSpec}
}

#IdBasedBrokerRewriteSpec: {
	"@type": "type.googleapis.com/envoy.config.filter.network.kafka_broker.v2alpha1.IdBasedBrokerRewriteSpec"
	rules?: [...#IdBasedBrokerRewriteRule]
}

#IdBasedBrokerRewriteRule: {
	"@type": "type.googleapis.com/envoy.config.filter.network.kafka_broker.v2alpha1.IdBasedBrokerRewriteRule"
	id?:     uint32 & >=0
	host!:   string & strings.MinRunes(1)
	port?:   uint32 & <=65535
}
