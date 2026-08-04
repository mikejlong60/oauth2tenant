// Code generated from envoy/data/cluster/v3/outlier_detection_event.proto. DO NOT EDIT.
package v3

import (
	"strings"
)

// [#next-free-field: 12]
#OutlierDetectionEvent: {
	"@type": "type.googleapis.com/envoy.data.cluster.v3.OutlierDetectionEvent"

	// In case of eject represents type of ejection that took place.
	type?: #OutlierEjectionType

	// Timestamp for event.
	timestamp?: string

	// The time in seconds since the last action (either an ejection or unejection) took place.
	secs_since_last_action?: uint64

	// The :ref:`cluster <envoy_v3_api_msg_config.cluster.v3.Cluster>` that owns the ejected host.
	cluster_name!: string & strings.MinRunes(1)

	// The URL of the ejected host. E.g., ``tcp://1.2.3.4:80``.
	upstream_url!: string & strings.MinRunes(1)

	// The action that took place.
	action?: #Action

	// If ``action`` is ``eject``, specifies the number of times the host has been ejected (local to
	// that Envoy and gets reset if the host gets removed from the upstream cluster for any reason and
	// then re-added).
	num_ejections?: uint32

	// If ``action`` is ``eject``, specifies if the ejection was enforced. ``true`` means the host was
	// ejected. ``false`` means the event was logged but the host was not actually ejected.
	enforced?: bool

	// oneof event: exactly one must be set
	{eject_success_rate_event!: #OutlierEjectSuccessRate} |
	{eject_consecutive_event!: #OutlierEjectConsecutive} |
	{eject_failure_percentage_event!: #OutlierEjectFailurePercentage}
}

#OutlierEjectSuccessRate: {
	"@type": "type.googleapis.com/envoy.data.cluster.v3.OutlierEjectSuccessRate"

	// Host’s success rate at the time of the ejection event on a 0-100 range.
	host_success_rate?: uint32 & <=100

	// Average success rate of the hosts in the cluster at the time of the ejection event on a 0-100
	// range.
	cluster_average_success_rate?: uint32 & <=100

	// Success rate ejection threshold at the time of the ejection event.
	cluster_success_rate_ejection_threshold?: uint32 & <=100
}

#OutlierEjectConsecutive: {
	"@type": "type.googleapis.com/envoy.data.cluster.v3.OutlierEjectConsecutive"
}

#OutlierEjectFailurePercentage: {
	"@type": "type.googleapis.com/envoy.data.cluster.v3.OutlierEjectFailurePercentage"

	// Host's success rate at the time of the ejection event on a 0-100 range.
	host_success_rate?: uint32 & <=100
}

// Type of ejection that took place
#OutlierEjectionType:
	// In case upstream host returns certain number of consecutive 5xx.
	// If
	// :ref:`outlier_detection.split_external_local_origin_errors<envoy_v3_api_field_config.cluster.v3.OutlierDetection.split_external_local_origin_errors>`
	// is ``false``, all type of errors are treated as HTTP 5xx errors.
	// See :ref:`Cluster outlier detection <arch_overview_outlier_detection>` documentation for
	// details.
	"CONSECUTIVE_5XX" |

	// In case upstream host returns certain number of consecutive gateway errors
	"CONSECUTIVE_GATEWAY_FAILURE" |

	// Runs over aggregated success rate statistics from every host in cluster
	// and selects hosts for which ratio of successful replies deviates from other hosts
	// in the cluster.
	// If
	// :ref:`outlier_detection.split_external_local_origin_errors<envoy_v3_api_field_config.cluster.v3.OutlierDetection.split_external_local_origin_errors>`
	// is ``false``, all errors (externally and locally generated) are used to calculate success rate
	// statistics. See :ref:`Cluster outlier detection <arch_overview_outlier_detection>`
	// documentation for details.
	"SUCCESS_RATE" |

	// Consecutive local origin failures: Connection failures, resets, timeouts, etc
	// This type of ejection happens only when
	// :ref:`outlier_detection.split_external_local_origin_errors<envoy_v3_api_field_config.cluster.v3.OutlierDetection.split_external_local_origin_errors>`
	// is set to ``true``.
	// See :ref:`Cluster outlier detection <arch_overview_outlier_detection>` documentation for
	"CONSECUTIVE_LOCAL_ORIGIN_FAILURE" |

	// Runs over aggregated success rate statistics for local origin failures
	// for all hosts in the cluster and selects hosts for which success rate deviates from other
	// hosts in the cluster. This type of ejection happens only when
	// :ref:`outlier_detection.split_external_local_origin_errors<envoy_v3_api_field_config.cluster.v3.OutlierDetection.split_external_local_origin_errors>`
	// is set to ``true``.
	// See :ref:`Cluster outlier detection <arch_overview_outlier_detection>` documentation for
	"SUCCESS_RATE_LOCAL_ORIGIN" |

	// Runs over aggregated success rate statistics from every host in cluster and selects hosts for
	// which ratio of failed replies is above configured value.
	"FAILURE_PERCENTAGE" |

	// Runs over aggregated success rate statistics for local origin failures from every host in
	// cluster and selects hosts for which ratio of failed replies is above configured value.
	"FAILURE_PERCENTAGE_LOCAL_ORIGIN"

// Represents possible action applied to upstream host
#Action:
	// In case host was excluded from service
	"EJECT" |

	// In case host was brought back into service
	"UNEJECT"
