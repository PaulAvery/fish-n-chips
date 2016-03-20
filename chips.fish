set chipsRoot (dirname (realpath (status -f)))
set chipsArgv $argv
set chipsTty

if isatty stdout
	set chipsTty true
else
	set chipsTty false
end

for chip in $chipsRoot/chips/*.fish
	source $chip
end

if not test -d "$chipsPwd"
	abort '"chipsPwd" is not set!'
end
