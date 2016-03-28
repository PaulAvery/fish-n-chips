# Find all locations of the argument and return them
function extractArgument
	set -l long $argv[2]
	set -l short $argv[1]
	set -l param $argv[3]

	set -l found false
	set -l skip false

	set -l doubleDashed false

	for position in (seq (count $chipsArgv))
		set -l argument $chipsArgv[$position]

		if test $doubleDashed = false
			if test $argument = '--'
				set doubleDashed true
			else if test $skip = true
				set skip false
			else if test _$argument = _--$long -a ! -z "$long"; or begin; test ! -z "$short"; and string match -qr -- '^-[^-\s]*'$short'[^-\s]*' $argument; end;
				set found true

				if not test -z "$param"
					set skip true

					if test (count $chipsArgv) -gt $position
						recho $chipsArgv[(math $position + 1)]
					else
						return 2
					end
				end
			end
		end
	end

	if test $found = true
		return 0
	else
		return 1
	end
end
