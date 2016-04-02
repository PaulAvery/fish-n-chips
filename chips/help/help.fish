function help
	recho
	man --pager="fish -c 'ul | tail -n +4 | head -n -1'" -l (markdownManual $argv | sed 's/\(^## .*$\)/#\1/g' | ronn -r | psub)
end
