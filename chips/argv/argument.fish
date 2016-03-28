function argument
	if test $chipsValidatedArguments = true
		abort "Calling 'argument' after 'arg' is not allowed."
	else
		set chipsArguments $chipsArguments "$argv"
	end
end
