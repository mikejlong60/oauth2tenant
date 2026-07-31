package v1

// KubeService models a Kubernetes Service
#KubeService: {
	annotations?: [string]: string
	labels?: [string]:      string

	externalIPs?: [string]
	clusterIP?: string
	clusterIPs?: [string]

	// https://kubernetes.io/docs/reference/networking/virtual-ips/#traffic-policies
	trafficDistribution?:   string
	internalTrafficPolicy?: "Cluster" | "Local"
	externalTrafficPolicy?: "Cluster" | "Local"

	// Client stickiness -> controls routing requests to specific backends.
	// K8s defaults to "None" so this is a safe default.
	sessionAffinity: *"None" | "ClientIP"
	sessionAffinityConfig?: {
		// In seconds
		timeout: int
	}
	healthCheckNodePort?:      int32
	publishNotReadyAddresses?: bool
}

// Kubernetes GatewayAPI route configuration options
#GatewayRoute: {
	type: "F5GatewayRoute" | "EnvoyGatewayRoute" | "EnvoyAIGatewayRoute" | "IstioGatewayRoute" | "OCPGatewayRoute" | "AWSGatewayRoute" | "AzureALBGatewayRoute" | *"DefaultGatewayRoute"

	name?: string

	// parentRefs is an optional string slice that links a gateway to its parent gateway controller.
	// there are implications for cross namespace boundaries that administrators must be aware of.
	parentRefs?: [...#GatewayParentRef]

	// used in basic hostname routing
	hostnames?: [...string]

	// protocol selects which Gateway API route kind is generated.
	// TCP is the default when no protocol is set.
	protocol: "tls" | "http" | "grpc" | "udp" | *"tcp"

	// http carries HTTP-specific route options. Only used when protocol is "http".
	http?: {
		path?: string
	}

	// BackendRefs are used for routing to non-greymatter services.
	backendRefs?: [...#GatewayRouteBackendRef]

	// Targets are used when routing to local project greymatter resources.
	targets?: [routeName=string]: listeners: [...string]
}

// GatewayRouteBackendRef are used for generic k8s service routing
// that does not utilize greymatter automation.
#GatewayRouteBackendRef: {
	name: string
	port: int
}

// GatewayParentRefs are listeners that routes bind to
#GatewayParentRef: {
	name:         string
	namespace?:   string
	sectionName?: string
}

// https://docs.nginx.com/nginx-gateway-fabric/
#F5GatewayRoute: #GatewayRoute & {
	type: "F5GatewayRoute"
}

// https://gateway.envoyproxy.io/
#EnvoyGatewayRoute: #GatewayRoute & {
	type: "EnvoyGatewayRoute"
}

// https://aigateway.envoyproxy.io/
#EnvoyAIGatewayRoute: #GatewayRoute & {
	type: "EnvoyAIGatewayRoute"
}

// https://istio.io/latest/docs/reference/config/networking/gateway/
#IstioGatewayRoute: #GatewayRoute & {
	type: "IstioGatewayRoute"
}

// https://docs.okd.io/4.20/networking/ingress_load_balancing/configuring_ingress_cluster_traffic/ingress-gateway-api.html
#OpenshiftGatewayRoute: #GatewayRoute & {
	type: "OCPGatewayRoute"
}

// https://kubernetes-sigs.github.io/aws-load-balancer-controller/latest/
#AWSGatewayRoute: #GatewayRoute & {
	type: "AWSGatewayRoute"
}

// https://gateway-api.sigs.k8s.io/implementations/#azure-application-gateway-for-containers
#AzureALBGatewayRoute: #GatewayRoute & {
	type: "AzureALBGatewayRoute"
}

// GatewayTCPRoute creates a TCPRoute. TCP is the default when no protocol is set.
#GatewayTCPRoute: #GatewayRoute & {
	protocol: "tcp"
}

// GatewayHTTPRoute creates an HTTPRoute. Optionally set http: {path: "/my/path"}.
#GatewayHTTPRoute: #GatewayRoute & {
	protocol: "http"
}

// GatewayTLSRoute creates a TLSRoute.
#GatewayTLSRoute: #GatewayRoute & {
	protocol: "tls"
}

// GatewayGRPCRoute creates a GRPCRoute.
#GatewayGRPCRoute: #GatewayRoute & {
	protocol: "grpc"
}

// GatewayUDPRoute creates a UDPRoute.
#GatewayUDPRoute: #GatewayRoute & {
	protocol: "udp"
}

// Gateway definition serves as a light abstraction over K8s Service and similar networking resources.
// Users can set use #Gateways on #Edge definitions.
#Gateway: {
	// All currently supported ingress types are defined here.
	// A "type" is required.
	type: "LoadBalancer" | "ClusterIP" | "NodePort" | "ExternalName" | "OpenshiftRoute" | "F5Gateway" | "EnvoyGateway" | "EnvoyAIGateway" | "IstioGateway" | "OCPGateway" | "AWSGateway" | "AzureALBGateway" | *"DefaultGateway"

	// Name is an optional field where a user can "name" a gateway. This will be used
	// in the applied cluster configuration as the Service metadata.name. If not set
	// an auto generated name will be used.
	name?:      string
	namespace?: string

	// Used in old k8s service gateway definition
	#KubeService

	targetListeners?: [...#TargetListener]

	// GatewayAPI schema additions:

	// List comprehension of gateway defined listeners
	listeners?: [ListenerName=string]: #GatewayListener
}

#GatewayListener: {
	tls?: {
		terminateTLS?: bool
		certificateRefs?: [...string]
		passthrough?: bool
	}

	routes?: [...#GatewayRoute]
}

// TargetListeners expect a name which which maps to a ingress/egress listener.
// The exposedPort becomes the open port on the deployed k8s service.
#TargetListener: {
	name:         string
	exposedPort?: int
}

// https://kubernetes.io/docs/concepts/services-networking/service/#loadbalancer
#LoadBalancer: {
	#Gateway
	type: "LoadBalancer"

	lbClass?: string

	// https://kubernetes.io/docs/concepts/services-networking/service/#load-balancer-nodeport-allocation
	allocateLbNodePorts?: bool
}

// https://kubernetes.io/docs/concepts/services-networking/service/#type-clusterip
#ClusterIP: {
	#Gateway
	type: "ClusterIP"
}

// https://kubernetes.io/docs/concepts/services-networking/service/#type-nodeport
#NodePort: {
	#Gateway
	type: "NodePort"

	nodePort?: int
}

// https://kubernetes.io/docs/concepts/services-networking/service/#externalname
#ExternalName: {
	#Gateway

	type:         "ExternalName"
	externalName: string
}

// https://docs.redhat.com/en/documentation/openshift_container_platform/4.18/html/network_apis/route-route-openshift-io-v1
#OpenshiftRoute: {
	#Gateway
	type: "OpenshiftRoute"

	host:           string
	targetListener: string
}

// For a canonical list of implemented Gateway controllers supporting the Kube GatewayAPI, 
// see the following link: https://gateway-api.sigs.k8s.io/implementations/

// https://docs.nginx.com/nginx-gateway-fabric/
#F5Gateway: #Gateway & {
	type: "F5Gateway"
}

// https://gateway.envoyproxy.io/
#EnvoyGateway: #Gateway & {
	type: "EnvoyGateway"
}

// https://aigateway.envoyproxy.io/
#EnvoyAIGateway: #Gateway & {
	type: "EnvoyAIGateway"
}

// https://istio.io/latest/docs/reference/config/networking/gateway/
#IstioGateway: #Gateway & {
	type: "IstioGateway"
}

// https://docs.okd.io/4.20/networking/ingress_load_balancing/configuring_ingress_cluster_traffic/ingress-gateway-api.html
#OpenshiftGateway: #Gateway & {
	type: "OCPGateway"
}

// https://kubernetes-sigs.github.io/aws-load-balancer-controller/latest/
#AWSGateway: #Gateway & {
	type: "AWSGateway"
}

// https://gateway-api.sigs.k8s.io/implementations/#azure-application-gateway-for-containers
#AzureALBGateway: #Gateway & {
	type: "AzureALBGateway"
}
