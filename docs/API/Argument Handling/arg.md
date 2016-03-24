# arg
Checks for the existence of an argument and returns its parameter if provided.

The first time an argument is retrieved, all defined arguments will be validated. If anything fails (invalid argument syntax, an argument is not passed its parameter) an error will be printed and the script will exit.

```fish
arg -s
arg --long
arg -h help; and exit
```

If more then one argument is passed, all but the first will be run through `eval` if the given flag is passed to the script.

The function will return `1` if the flag was not passed, `2` if the flag was passed without an argument and `0` if the flag was found.

If it was found and provided a parameter, that parameter will be printed.
If it was provided multiple times, each parameter will be printed on its own line.
