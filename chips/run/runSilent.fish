function runSilent
	set -l action $argv[1]
	set -l cmd $argv[2..-1]
	set -l padding (math (tput cols) - 7)
	set -l error (mktemp)
	set -l prefix (esc '\r\033[K' '\n')

	printf "%s %s" $chipsLoad $action
	eval $cmd > /dev/null ^ $error
	set -l success $status

	if test $success = 0
		echo -e "$prefix$chipsOk $action"
	else
		echo -e "$prefix$chipsFail $action"

		recho
		cat $error | awk '$0="\t"$0' >&2
		rm $error
		recho
	end

	return $success
end
