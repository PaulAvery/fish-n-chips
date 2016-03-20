# recho to stderr
function error
	recho $argv >&2
	return 1
end
