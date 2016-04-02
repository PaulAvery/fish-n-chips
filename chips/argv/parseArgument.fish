function parseArgument
	set -l argument $argv[1]

	set -l longRegex '--([^-\s]+) *'
	set -l shortRegex '-([^-\s]) *'
	set -l paramRegex '\[(\S*)\] *'
	set -l descriptionRegex '(.+)'

	set -l flagRegex '(?:'$shortRegex'\| *'$longRegex')|'$shortRegex'|'$longRegex
	set -l fullRegex '(?:'$flagRegex')(?:'$paramRegex')?'$descriptionRegex

	set -l param
	set -l longFlag
	set -l shortFlag
	set -l parsedFlag (string match -r -- "$flagRegex" "$argument")
	set -l parsedFull (string match -r -- "$fullRegex" "$argument")

	if test $status != 0
		return 1
	end

	set -l description $parsedFull[-1]

	if test (count $parsedFlag) = 3
		set shortFlag $parsedFlag[2]
		set longFlag $parsedFlag[3]
	else if test (string length -- $parsedFlag[2]) = 1
		set shortFlag $parsedFlag[2]
	else
		set longFlag $parsedFlag[2]
	end

	if test (count $parsedFull) = 4
		if test -z "$shortFlag" -o -z "$longFlag"
			set param $parsedFull[-2]
		end
	else if test (count $parsedFull) = 5
		set param $parsedFull[-2]
	end

	recho $shortFlag
	recho $longFlag
	recho $param
	recho $description
end
