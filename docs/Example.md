# Example
The following sample can also be found [here](https://github.com/PaulAvery/fish-n-chips/blob/master/sample/sample.fish).

```fish
#!/usr/bin/fish
set chipsPwd (dirname (realpath (status -f)))
source $chipsPwd/../chips.fish $argv; or exit $status

# Define our application
name        sample
version     1.0.0
author      Florian Albertz
copyright   2016

info        'Script to show the usage of the fish-n-chips library'
synopsis    'test [OPTIONS]'
description 'This Script is simply used to show off how the `fish-n-chips` library is used'

argument    '-h | --help          Show this help'
argument    '-V | --version       Print version information'
argument    '-v | --verbose       Print more output'
argument    '-m | --manual        Print a man page'
argument    '-d | --markdown      Print a markdown manual'
argument    '--data [toBePrinted] Data to print instead of `stdout`'

arg -h help; and exit
arg -V printVersion; and exit
arg -m manual; and exit
arg -d markdownManual; and exit

if arg -v
	set chipsVerbose true
end

function printSomething
	echo (stern (arg --data) 'stdout')
	error stderr
	return $argv[1]
end

run "Succeeding" printSomething 0
run "Failing" printSomething 1
```
