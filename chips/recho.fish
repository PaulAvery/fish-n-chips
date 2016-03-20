function recho
	set -l spacedArgv
	for pos in (seq (count $argv))
		if test $pos != (count $argv)
			set spacedArgv $spacedArgv "$argv[$pos] "
		else
			set spacedArgv $spacedArgv "$argv[$pos]"
		end
	end

	echo -s '' $spacedArgv
end
