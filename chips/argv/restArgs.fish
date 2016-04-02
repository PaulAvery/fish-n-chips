function restArgs
	set -l doubleDashed false
	set -l hasParam false

	if test $chipsValidatedArguments = false
		set chipsValidatedArguments true
		validateArguments
	end

	for arg in $chipsArgv
		if test $hasParam = true
			set hasParam false
		else if test $doubleDashed = true
			recho $arg
		else if test $arg = '--'
			set doubleDashed true
		else if test (string sub -l 2 -- $arg) = '--'
			for argDef in $chipsArguments
				set -l parsed (parseArgument $argDef)

				if test ! -z "$parsed[3]" -a "--$parsed[2]" = $arg
					set hasParam true
				end
			end
		else if test (string sub -l 1 -- $arg) = '-'
			for argDef in $chipsArguments
				set -l parsed (parseArgument $argDef)
				set -l chars (string split -- '' (string sub -s 2 -- "$arg"))

				for char in $chars
					if test ! -z "$parsed[3]" -a "$parsed[1]" = $char
						set hasParam true
					end
				end
			end
		else
			recho $arg
		end
	end
end
