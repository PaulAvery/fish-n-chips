# Utility Functions
## fatname
Tries to find the file passed within the first argument, regardless of capitalization. So `fatname Readme.md` will output `ReadMe.md` if that one is found.
Only one file will be output.
If no file is found, nothing will be printed and the return value is still 0.

## abort
Prints its arguments to stderr and exits the script with status code 1.

## error
Prints its arguments to stderr and returns 1.

## esc
Prints its first argument if script is attached to a tty and its second argument if not.

Allows us to conditionally print control characters. The following will set the text color to red if we have a tty. Otherwise it will print two exclamation marks:
```fish
esc (color_set red) !!
```

## sexec
Executes a script and returns the previous `$status`. Useful in pipes if you only care about an earlier commands status:

```fish
eval false | sexec true
```
The `eval` seems to be neccessary, because it terminates before sexec runs. Or something like that.

## tern
Passes all arguments but the last two to `test`.
If the test is successful it prints the second to last argument, otherwise it prints the last one.

```fish
tern -f someFile exists missing
```
If *someFile* exists, it prints "exists". Otherwise "missing"

### stern
Short for `tern -z $arg1 $arg2 $arg1`.
Prints the first of the passed arguments (max 2.) which is not empty.

## recho
Echo has problems when trying to print arbitrary variables. Printing `-n` is surprisingly difficult.

`echo -n` simply prints nothing.
`echo -- -n` prints `-- -n`.
`echo '' '-n'` prints ` -n` with a leading space.
`echo -s '' '-n'` prints `-n`, but if you pass another argument they will be joined without spaces.

So `recho` simply prints all arguments verbatim.
