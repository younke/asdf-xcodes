# Contributing

Testing locally with asdf:

```shell
asdf plugin test <plugin-name> <plugin-url> [--asdf-tool-version <version>] [--asdf-plugin-gitref <git-ref>] [test-command*]

#
asdf plugin test xcodes https://github.com/younke/asdf-xcodes.git "xcodes --help"
```

Testing a local checkout with mise:

```shell
mise plugins link --force xcodes "$PWD"
mise exec xcodes@latest -- xcodes --help
```

Linting and formatting (the versions in `.tool-versions` are what CI uses):

```shell
scripts/lint.bash
scripts/format.bash
```

Tests are automatically run in GitHub Actions on push and PR.
