# sexec
Executes a script and returns the previous `$status`. Useful in pipes if you only care about an earlier commands status:

```fish
eval false | sexec true
```
The `eval` seems to be neccessary, because it terminates before sexec runs. Or something like that.
