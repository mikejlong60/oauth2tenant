package v1

// Edges contain extra functionality since they are often exposed to the outside world.
#Edge: edge = {
	#Service

	// Cannot be changed within a gsl.#Edge definition.
	type!: #TypeEdge

	// Gateways define north/south ingress services for the defined edge.
	// The listenerName maps to the target listener that traffic will flow 
	// into. This mapping follows the following pattern:
	// - exposed_port opens on the Ingress Service
	// - The listner name is used as a lookup for the port to route traffic to.
	// - Multiple gateways with the same exposed_port will be coalesced into a single deployed
	// ingress service.
	gateways: [...(#LoadBalancer | #ClusterIP | #NodePort | #ExternalName | #OpenshiftRoute | #F5Gateway | #EnvoyGateway | #IstioGateway)] | *[#LoadBalancer]

	// We create a dangling cluster for gm-control to determine protocols for Catalog services.
	raw_upstreams: {
		(edge.name): {
			#Upstream
			namespace: edge.context.globals.namespace
		}
	}
}

// EdgeConfig is used in the service definition
// to link services to their application edge node.
#EdgeConfig: {
	edge_ingress: *edge_name | string
	edge_name:    string
	routes:       #Routes
}
