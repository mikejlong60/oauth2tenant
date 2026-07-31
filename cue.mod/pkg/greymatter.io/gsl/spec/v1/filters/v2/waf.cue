package v2

#DataSource_Filename: {
	filename: string | *"/etc/proxy/waf/*.conf"
}

#DataSource_InlineString: {
	inline_string?: string
}

// Greymatter data source.
// DataSource can be many inputs. Currently a filename or inline string are supported.
#DataSource: (#DataSource_Filename | #DataSource_InlineString)

// Greymatter WAF Filter Configuration.
#GreymatterWAFConfig: {
	directives: [...#DataSource]
	volume_mounts: [...string]
}
