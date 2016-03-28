function restArg
	set -l pos $argv[1]
	set -l current 1
	set -l doubleDashed false

	for arg in $chipsArgv
		if test $current = $pos
			if test $doubleDashed = true -o (string sub -l 1 -- $arg) != '-'
				echo $arg
				return 0
			end
		end

		if test $doubleDashed = true -o (string sub -l 1 -- $arg) != '-'
			set current (math $current + 1)
		else if test $arg = '--'
			set doubleDashed true
		end
	end

	return 1
end
