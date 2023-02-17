# Contributing

Testing Locally:

```shell
asdf plugin test <plugin-name> <plugin-url> [--asdf-tool-version <version>] [--asdf-plugin-gitref <git-ref>] [test-command*]

#
asdf plugin test xcodes https://github.com/younke/asdf-xcodes.git "xcodes --help"
```

Tests are automatically run in GitHub Actions on push and PR.
