function manual
	markdownManual $argv | ronn -r --manual "$chipsName" --organization "$chipsAuthor"
end

function markdownManual
	set -l manual (fatname $chipsPwd/manual.md)
	set -l readme (fatname $chipsPwd/readme.md)

	if test -z "$argv" -a -f "$manual"
		cat $manual
	else if test -z "$argv" -a -f "$readme"
		cat $readme
	else
		recho "# $chipsName(1) -- $chipsInfo"
		recho
		recho "## Synopsis"
		recho
		recho "    $chipsSynopsis"
		recho
		recho "## Description"
		recho "$chipsDescription"
		recho
		recho "## Options"

		for argument in $chipsArguments
			set -l parsed (parseArgument $argument); or continue

			set -l argumentString '* '
			if test ! -z "$parsed[1]" -a ! -z "$parsed[2]"
				set argumentString "$argumentString `-$parsed[1]`, `--$parsed[2]`"
			else if test ! -z "$parsed[1]"
				set argumentString "$argumentString `-$parsed[1]`"
			else
				set argumentString "$argumentString `--$parsed[2]`"
			end

			if test ! -z "$parsed[3]"
				set argumentString "$argumentString <$parsed[3]>"
			end

			recho "$argumentString:"
			recho "$parsed[4]"
		end
	end
end
