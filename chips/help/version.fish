function printVersion
	set -l versionString "$chipsName $chipsVersion"

	if not test -z "$chipsAuthor"
		set currentYear (date +%Y)
		set versionString $versionString"
Copyright (©)"

		if test ! -z "$chipsCopyright" -a $currentYear != "$chipsCopyright"
			set versionString $versionString" $chipsCopyright - $currentYear"
		else
			set versionString $versionString" $currentYear"
		end

		set versionString $versionString" $chipsAuthor"
	end

	recho $versionString
end
