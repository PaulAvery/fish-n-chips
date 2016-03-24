# fish-n-chips documentation
The branch of the fish-n-chips repository responsible for documentation generation. The documentation itself resides in `docs` with images in `assets/img`.

The following make tasks are available:
* `make`: Generate documentation into the `out` directory.
* `make publish`: Generate the documentation and push it to the `gh-pages` branch.
* `make clean`: Remove generated files including npm dependencies.
* `make serve`: Start a webserver on port 9080 which shows your docs and rebuilds (and reloads the page) on any template or content changes.

The theme is a modified version of the [Cayman](https://github.com/jasonlong/cayman-theme) theme by Jason Long.
