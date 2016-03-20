set chipsArguments

function argument
	if test $chipsValidatedArguments = true
		abort "Calling 'argument' after 'arg' is not allowed."
	else
		set chipsArguments $chipsArguments "$argv"
	end
end

function arg
	set -l arg $argv[1]

	if test $chipsValidatedArguments = false
		set chipsValidatedArguments true
		validateArguments
	end

	for argument in $chipsArguments
		set -l parsed (parseArgument $argument); or return 3

		if test _-$parsed[1] = "_$arg" -o _--$parsed[2] = "_$arg"
			set -l args (extractArgument $parsed[1..3]); or return

			if test (count $argv) -gt 1
				eval $argv[2..-1]
				return 0
			else
				for arg in $args
					recho $arg
				end

				return 0
			end
		end
	end

	abort "Argument '$arg' not defined."
end
