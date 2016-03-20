# Print the first argument if we are running in a tty
# Print the second if we dont
function esc
	if test $chipsTty = true
		recho $argv[1]
	else if test (count $argv) -gt 1
		recho $argv[2]
	else
		recho
	end
end
