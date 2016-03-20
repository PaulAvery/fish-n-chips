set chipsValidatedArguments false

for chip in $chipsRoot/chips/argv/*.fish
	source $chip
end
