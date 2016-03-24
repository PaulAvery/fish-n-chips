# fatname
Tries to find the file passed within the first argument, regardless of capitalization. So `fatname Readme.md` will output `ReadMe.md` if that one is found.
Only one file will be output.
If no file is found, nothing will be printed and the return value is still 0.
