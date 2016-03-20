set chipsName
set chipsVersion
set chipsAuthor
set chipsCopyright
set chipsSynopsis
set chipsDescription
set chipsInfo

function name
	set chipsName "$argv"
end

function version
	set chipsVersion "$argv"
end

function author
	set chipsAuthor "$argv"
end

function copyright
	set chipsCopyright "$argv"
end

function synopsis
	set chipsSynopsis "$argv"
end

function description
	set chipsDescription "$argv"
end

function info
	set chipsInfo "$argv"
end
