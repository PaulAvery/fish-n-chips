# Argument Handling
*fish-n-chips* offers the ability to define command line flags which your script expects. It then allows them to be easily read in.

**Setting:**
```fish
argument '-d [data]        Supply some data'
argument '-v | --verbose   Print more information'
```

**Retrieving:**
```fish
set data (arg -d)
```

**Checking:**
```fish
if not arg -v
	echo 'VERBOSE!'
end
```
