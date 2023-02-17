<div align="center">

# asdf-xcodes [![Build](https://github.com/younke/asdf-xcodes/actions/workflows/build.yml/badge.svg)](https://github.com/younke/asdf-xcodes/actions/workflows/build.yml) [![Lint](https://github.com/younke/asdf-xcodes/actions/workflows/lint.yml/badge.svg)](https://github.com/younke/asdf-xcodes/actions/workflows/lint.yml)


[xcodes](https://github.com/RobotsAndPencils/xcodes) plugin for the [asdf version manager](https://asdf-vm.com).

</div>

# Contents

- [Dependencies](#dependencies)
- [Install](#install)
- [Contributing](#contributing)
- [License](#license)

# Dependencies

**TODO: adapt this section**

- `bash`, `curl`, `tar`: generic POSIX utilities.
- `SOME_ENV_VAR`: set this environment variable in your shell config to load the correct version of tool x.

# Install

Plugin:

```shell
asdf plugin add xcodes
# or
asdf plugin add xcodes https://github.com/younke/asdf-xcodes.git
```

xcodes:

```shell
# Show all installable versions
asdf list-all xcodes

# Install specific version
asdf install xcodes latest

# Set a version globally (on your ~/.tool-versions file)
asdf global xcodes latest

# Now xcodes commands are available
xcodes --help
```

Check [asdf](https://github.com/asdf-vm/asdf) readme for more instructions on how to
install & manage versions.

# Contributing

Contributions of any kind welcome! See the [contributing guide](contributing.md).

[Thanks goes to these contributors](https://github.com/younke/asdf-xcodes/graphs/contributors)!

# License

See [LICENSE](LICENSE) © [Vasily Ptitsyn](https://github.com/younke/)
