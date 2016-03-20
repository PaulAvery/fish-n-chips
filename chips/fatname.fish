function fatname
	set -l path "$argv"

	find (realpath (dirname $path)) -maxdepth 1 -iname (basename $path) -print -quit
end
