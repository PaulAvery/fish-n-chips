function help
	recho
	man -l (manual $argv | psub) | tail -n +4 | head -n -1
end
