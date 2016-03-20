function validateArguments
	set -l error false

	for argument in $chipsArguments
		if set -l parsed (parseArgument $argument)
			arg (tern -z "$parsed[1]" "--$parsed[2]" "-$parsed[1]") > /dev/null

			if test $status = 2
				set error true
				error "Argument '"(tern -z "$parsed[1]" "--$parsed[2]" "-$parsed[1]")"' missing parameter '$parsed[3]'"
			end
		else
			set error true
			error "Argument could not be parsed: '$argument'"
		end
	end

	if not test $error = false
		abort
	end
end
