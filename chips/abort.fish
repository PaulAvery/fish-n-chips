# Prints its arguments to stderr and then exits with error code 1
function abort
	error $argv
	exit 1
end
