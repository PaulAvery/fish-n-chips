set chipsOk "["(esc (set_color green))" OK "(esc (set_color normal))"]"
set chipsFail "["(esc (set_color red))"FAIL"(esc (set_color normal))"]"
set chipsLoad "[....]"

function run
	if not test -z "$chipsVerbose"
		runVerbose $argv
	else
		runSilent $argv
	end
end
