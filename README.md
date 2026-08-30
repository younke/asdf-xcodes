<div align="center">

# asdf-xcodes

[![Build](https://github.com/younke/asdf-xcodes/actions/workflows/build.yml/badge.svg)](https://github.com/younke/asdf-xcodes/actions/workflows/build.yml)
[![Lint](https://github.com/younke/asdf-xcodes/actions/workflows/lint.yml/badge.svg)](https://github.com/younke/asdf-xcodes/actions/workflows/lint.yml)
[![Mise](https://github.com/younke/asdf-xcodes/actions/workflows/test-mise.yml/badge.svg)](https://github.com/younke/asdf-xcodes/actions/workflows/test-mise.yml)

[xcodes](https://github.com/XcodesOrg/xcodes) plugin for the [asdf version manager](https://asdf-vm.com)
and [mise](https://mise.jdx.dev).

</div>

# Contents

- [Dependencies](#dependencies)
- [Install](#install)
  - [asdf](#asdf)
  - [mise](#mise)
- [Contributing](#contributing)
- [License](#license)

# Dependencies

- macOS: `xcodes` is only released for macOS.
- `bash`, `curl`, `git`, `tar`, `unzip`: generic POSIX utilities.

# Install

## asdf

Requires asdf `0.16.0` or newer (the commands below use the current CLI; on
older releases use `asdf list-all` and `asdf global` instead).

Plugin:

```shell
asdf plugin add xcodes
# or
asdf plugin add xcodes https://github.com/younke/asdf-xcodes.git
```

xcodes:

```shell
# Show all installable versions
asdf list all xcodes

# Install specific version
asdf install xcodes latest

# Set a version for the current directory (writes ./.tool-versions)
asdf set xcodes latest

# Or set it for your user (writes ~/.tool-versions)
asdf set -u xcodes latest

# Now xcodes commands are available
xcodes --help
```

Check the [asdf documentation](https://asdf-vm.com/guide/getting-started.html)
for more instructions on how to install & manage versions.

## mise

mise can use this plugin directly through its
[asdf backend](https://mise.jdx.dev/dev-tools/backends/asdf.html):

```shell
# Install and use the latest version
mise use -g "asdf:https://github.com/younke/asdf-xcodes@latest"

# Or run it without adding it to a config file
mise exec "asdf:https://github.com/younke/asdf-xcodes@latest" -- xcodes --help
```

Or in `mise.toml`:

```toml
[tools]
"asdf:https://github.com/younke/asdf-xcodes" = "latest"
```

Note that mise ships its own `xcodes` registry entry backed by
[aqua](https://mise.jdx.dev/dev-tools/backends/aqua.html), so a bare
`mise use xcodes` does not go through this plugin. Use the `asdf:` form above to
select it explicitly.

# Contributing

Contributions of any kind welcome! See the [contributing guide](contributing.md).

[Thanks goes to these contributors](https://github.com/younke/asdf-xcodes/graphs/contributors)!

# License

See [LICENSE](LICENSE) © [Vasily Ptitsyn](https://github.com/younke/)
