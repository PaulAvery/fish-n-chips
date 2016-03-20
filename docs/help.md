# Help / Manuals
The library can generate help and manpages for you. It uses the information provided during [argument](argv.md) and [information](info.md) definition.

## Markdown Output
```fish
markdownManual
```
Prints information about your script in markdown format. Formatted to work with [ronn](https://rtomayko.github.io/ronn/). If a *Manual.md* or a *ReadMe.md* is provided in your `$chipsPwd`, the content of that file is used. This behaviour can be overriden by passing any non-empty argument to the function.

## Manpage
```fish
manual
```
Prints the markdown manual once run through `ronn`

## Help
```fish
help
```
Prints the rendered manpage.

## Version
```fish
printVersion
```
Prints version and copyright information.
