# markdownManual
Compiles all information into a markdown document which can be run through [ronn](https://github.com/rtomayko/ronn) to generate a manpage:

```md
# sample(1) -- Script to show the usage of the fish-n-chips library

### Synopsis

    test [OPTIONS]

### Description
This Script is simply used to show off how the `fish-n-chips` library is used

### Options
*  `-h`, `--help`:          Show this help
*  `-V`, `--version`:       Print version information
*  `-v`, `--verbose`:       Print more output
*  `-m`, `--manual`:        Print a man page
*  `-d`, `--markdown`:      Print a markdown manual
*  `--data`: [toBePrinted] Data to print instead of `stdout`
```

If a *Manual.md* or a *ReadMe.md* is provided in your `$chipsPwd`, the content of that file is used. This behaviour can be overriden by passing any non-empty argument to the function.
