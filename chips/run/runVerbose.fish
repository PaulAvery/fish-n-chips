function runVerbose
	set -l action $argv[1]
	set -l cmd $argv[2..-1]
	set -l padding (math (tput cols) - 7)
	set -l success

	recho $chipsLoad $action
	recho
	begin
		eval $cmd | sexec awk '$0="\t"$0'
		set success $status
	end ^| awk '$0="\t"$0' >&2
	recho

	if test $success = 0
		recho $chipsOk $action
	else
		recho $chipsFail $action
	end

	return $success
end
