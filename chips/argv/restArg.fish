function restArg
	set -l pos $argv[1]
	set args (restArgs)

	if test (count $args) -lt $pos
		return 1
	else
		recho $args[$pos]
	end
end
