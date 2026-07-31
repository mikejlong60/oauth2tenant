package v1

#Project: {
	feature_flags: #FeatureFlags

	tcm: #GreymatterService
	epo: #GreymatterService
	spo: #GreymatterService
}

#FeatureFlags: {
	// Greymatter v2.5.0 defaults this feature flag to true. 
	enable_proxy_next: bool | *true
}

#ContainerSpec: {
	// Optional resource quota settings for containers.
	// Each replica will have these resource values applied.
	resources?: #ResourceQuotas
}

#GreymatterService: {
	log_level: string | *"info"
	replicas:  int | *1
	containers?: [ContainerName=string]: #ContainerSpec
}
