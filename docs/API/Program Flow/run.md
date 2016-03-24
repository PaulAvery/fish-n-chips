# run
We provide a function `run`, which allows you to run code with somewhat decent error handling and nicer output.

You pass it a description and something to be passed to `eval`, a function, an application name etc.

The script is then run silently. If an error occurres, the failure is signalled and the script's `stderr` output is printed:

```
[ OK ] Running something
[FAIL] Running something else

	Stderr output

[....] Running even more stuff
```

If the variable `chipsVerbose` is set to true, the entire script output is printed:

```
[....] Running something

	Stdout output

[ OK ] Running something
[....] Running something else

	Stdout output
	Stderr output

[FAIL] Running something else
[....] Running even more stuff
```

Stderr and stdout output is properly directed to the fitting file descriptors.
The return value is that of the evaled expression.
