# fish-n-chips
A utility library to write fish shell scripts.
It handles argument parsing as well as help page generation and brings with it some tools to structure your script.

## Example
A more fully featured example can be found here: **[sample.fish](sample/sample.fish)**
Documentation can be found in the `docs` branch or properly formatted on [github.io](paulavery.github.io/fish-n-chips).

```fish
# Define our application
name        sample
version     1.0.0
author      Florian Albertz
copyright   2016

info        'Script to show the usage of the fish-n-chips library'
synopsis    'test [OPTIONS]'
description 'This Script shows off usage of the `fish-n-chips` library'

argument    '-h | --help          Show this help'
argument    '-V | --version       Print version information'

arg -h help; and exit
arg -V printVersion; and exit
```

## Installation
I suggest installing this library as a git submodule:

```fish
git submodule add git@github.com:PaulAvery/fish-n-chips.git chips
```

You can obviously install it differently as well. The only important part is, that you execute the following at the top of your script:

```fish
set chipsPwd (dirname (realpath (status -f)))
source $chipsPwd/chips/chips.fish $argv; or exit $status
```

We set the `chipsPwd` variable so the library knows where to find things like our *ReadMe.md*. Then we source the entry file *chips.fish* and pass it all our arguments. The `; or exit $status` is simply used, so our script aborts if the library encounters an error.
