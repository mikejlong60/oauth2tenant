// Code generated from envoy/service/network_ext_proc/v3/network_external_processor.proto. DO NOT EDIT.
package v3

import (
	v3_1 "envoyproxy.io/envoy-cue/spec/config/core/v3"
)

// The payload data from network layer
#Data: {
	"@type": "type.googleapis.com/envoy.service.network_ext_proc.v3.Data"

	// The raw payload data
	data?: bytes

	// Indicates whether this is the last data frame in the current direction.
	// The external processor should still respond to this message even
	// if there is no more data expected in this direction.
	end_of_stream?: bool
}

// ProcessingRequest contains data sent from Envoy to the external processing server.
// Each request contains either read data (from client) or write data (to client)
// along with optional metadata.
#ProcessingRequest: {
	"@type": "type.googleapis.com/envoy.service.network_ext_proc.v3.ProcessingRequest"

	// ReadData contains the network data intercepted in the request path (client to server).
	// This is sent to the external processor when data arrives from the downstream client.
	// If this is set, write_data should not be set.
	read_data?: #Data

	// WriteData contains the network data intercepted in the response path (server to client).
	// This is sent to the external processor when data arrives from the upstream server.
	// If this is set, read_data should not be set.
	write_data?: #Data

	// Optional metadata associated with the request.
	// This can include connection properties, filter configuration, and any other
	// contextual information that might be useful for processing decisions.
	//
	// The metadata is not automatically propagated from request to response.
	// The external processor must include any needed metadata in its response.
	metadata?: v3_1.#Metadata
}

// ProcessingResponse contains the response from the external processing server to Envoy.
// Each response corresponds to a ProcessingRequest and indicates how the network
// traffic should be handled.
// [#next-free-field: 6]
#ProcessingResponse: {
	"@type": "type.googleapis.com/envoy.service.network_ext_proc.v3.ProcessingResponse"

	// The processed ReadData containing potentially modified data for the request path.
	// This should be sent in response to a ProcessingRequest with read_data, and the
	// previous data in ProcessingRequest will be replaced by the new data in Envoy's data plane.
	// If this is set, write_data should not be set.
	read_data?: #Data

	// The processed WriteData containing potentially modified data for the response path.
	// This should be sent in response to a ProcessingRequest with write_data, and the
	// previous data in ProcessingRequest will be replaced by the new data in Envoy's data plane.
	// If this is set, read_data should not be set.
	write_data?: #Data

	// Indicates whether the data was modified or not.
	// This is mandatory and tells Envoy whether to use the original or modified data.
	data_processing_status?: #ProcessingResponse_DataProcessedStatus

	// Optional: Determines the connection behavior after processing.
	// If not specified, CONTINUE is assumed, and the connection proceeds normally.
	// Use CLOSE or CLOSE_RST to terminate the connection based on processing results.
	connection_status?: #ProcessingResponse_ConnectionStatus

	// Optional metadata associated with the request.
	// This can include connection properties, filter configuration, and any other
	// contextual information that might be useful for processing decisions.
	//
	// The metadata is not automatically propagated from request to response.
	// The external processor must include any needed metadata in its response.
	dynamic_metadata?: {...}
}

// DataProcessedStatus indicates whether the data was modified by the external processor.
#ProcessingResponse_DataProcessedStatus:
	// The data processed status is unknown.
	"UNKNOWN" |

	// The data remains unchanged. Envoy will use the original data.
	// This is useful when the processor only wants to inspect but not modify the traffic.
	"UNMODIFIED" |

	// The data has been modified. Envoy will use the modified data provided in the response.
	// This allows the processor to transform the network traffic as needed.
	"MODIFIED"

// ConnectionStatus determines what happens to the connection after processing.
#ProcessingResponse_ConnectionStatus:
	// Continue normal processing of the connection.
	// This is the default behavior and allows traffic to flow normally.
	"CONTINUE" |

	// Close the connection with normal TCP FIN.
	// This allows for clean connection termination with a normal close sequence.
	// Any buffered data will be sent before closing.
	"CLOSE" |

	// Immediately reset the connection with TCP RST.
	// This forcibly terminates the connection without a clean shutdown,
	// discarding any buffered data. Use this for security-critical situations
	// or when immediate termination is required.
	"CLOSE_RST"
