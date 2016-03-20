function tern
	if test $argv[1..-3]
		recho $argv[-2]
	else
		recho $argv[-1]
	end
end

function stern
	switch (count $argv)
		case "0"
			recho
		case "1"
			recho $argv[1]
		case "*"
			tern -z "$argv[1]" "$argv[2]" "$argv[1]"
	end
end
