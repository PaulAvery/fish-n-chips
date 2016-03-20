function sexec
	set -l success $status
	set -l escapedArgv

	for arg in $argv
		set escapedArgv $escapedArgv (string escape "$arg")
	end

	eval $escapedArgv <&0

	return $success
end
