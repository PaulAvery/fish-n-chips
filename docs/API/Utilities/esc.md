# esc
Prints its first argument if script is attached to a tty and its second argument if not.

Allows us to conditionally print control characters. The following will set the text color to red if we have a tty. Otherwise it will print two exclamation marks:
```fish
esc (color_set red) !!
```
