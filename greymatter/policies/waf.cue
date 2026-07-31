package policies

DefaultWafConfig: ##"""
	SecRuleEngine DetectionOnly
	SecRequestBodyAccess On
	SecResponseBodyAccess Off
	SecRequestBodyLimit 13107200
	SecRequestBodyNoFilesLimit 131072
	SecAuditEngine RelevantOnly
	SecAuditLogParts ABDEFHIJKZ
	SecAuditLogFormat JSON

	SecAction "id:900120,phase:1,pass,t:none,nolog,tag:'OWASP_CRS',setvar:tx.early_blocking=1"
	Include @owasp_crs/crs/crs-setup.conf
	Include @owasp_crs/crs/rules/*.conf
	"""##
