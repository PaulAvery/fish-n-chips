# recho
`echo` has problems when trying to print arbitrary variables. Printing `-n` is surprisingly difficult.

`echo -n` simply prints nothing.
`echo -- -n` prints `-- -n`.
`echo '' '-n'` prints ` -n` with a leading space.
`echo -s '' '-n'` prints `-n`, but if you pass another argument they will be joined without spaces.

So `recho` simply prints all arguments verbatim.
