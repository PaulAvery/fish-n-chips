# tern
Passes all arguments but the last two to `test`.
If the test is successful it prints the second to last argument, otherwise it prints the last one.

```fish
tern -f someFile exists missing
```
If *someFile* exists, it prints "exists". Otherwise "missing"
