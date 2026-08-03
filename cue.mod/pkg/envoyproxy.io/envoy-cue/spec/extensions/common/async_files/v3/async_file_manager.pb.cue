// Code generated from envoy/extensions/common/async_files/v3/async_file_manager.proto. DO NOT EDIT.
package v3

#AsyncFileManagerConfig: {
	"@type":      "type.googleapis.com/envoy.extensions.common.async_files.v3.AsyncFileManagerConfig"
	id?:          string
	thread_pool?: #AsyncFileManagerConfig_ThreadPool
}

#AsyncFileManagerConfig_ThreadPool: {
	"@type":       "type.googleapis.com/envoy.extensions.common.async_files.v3.AsyncFileManagerConfig.ThreadPool"
	thread_count?: uint32 & <=1024
}
