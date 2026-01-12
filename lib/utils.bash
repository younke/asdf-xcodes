#!/usr/bin/env bash

set -euo pipefail

GH_REPO="https://github.com/XcodesOrg/xcodes"
TOOL_NAME="xcodes"
TOOL_TEST="xcodes --help"

fail() {
	echo -e "asdf-$TOOL_NAME: $*"
	exit 1
}

curl_opts=(-fsSL)

if [ -n "${GITHUB_TOKEN:-}" ]; then
	curl_opts=("${curl_opts[@]}" -H "Authorization: token $GITHUB_TOKEN")
fi

sort_versions() {
	sed 'h; s/[+-]/./g; s/.p\([[:digit:]]\)/.z\1/; s/$/.z/; G; s/\n/ /' |
		LC_ALL=C sort -t. -k 1,1 -k 2,2n -k 3,3n -k 4,4n -k 5,5n | awk '{print $2}'
}

get_arch() {
	local arch
	arch=$(uname -m)
	case "$arch" in
	arm64 | aarch64) echo "arm64" ;;
	x86_64) echo "i386" ;;
	*) fail "Unsupported architecture: $arch" ;;
	esac
}

list_github_tags() {
	git ls-remote --tags --refs "$GH_REPO" |
		grep -o 'refs/tags/.*' | cut -d/ -f3- |
		sed 's/^v//'
}

list_all_versions() {
	list_github_tags
}

get_arch_url() {
	local version="$1"
	local arch
	arch=$(get_arch)
	echo "$GH_REPO/releases/download/${version}/${TOOL_NAME}-${version}.macos.${arch}.tar.gz"
}

get_zip_url() {
	local version="$1"
	echo "$GH_REPO/releases/download/${version}/${TOOL_NAME}.zip"
}

# Check if URL exists (returns 0 if exists, 1 otherwise)
url_exists() {
	curl -sfIL "$1" >/dev/null 2>&1
}

# Download release, trying architecture-specific binary first, falling back to zip
# Sets RELEASE_EXT to the extension of the downloaded file (used by caller)
# shellcheck disable=SC2034
download_release() {
	local version="$1"
	local filename_base="$2"
	local arch_url zip_url

	arch_url=$(get_arch_url "$version")
	zip_url=$(get_zip_url "$version")

	echo "* Downloading $TOOL_NAME release $version..."

	if url_exists "$arch_url"; then
		RELEASE_EXT="tar.gz"
		curl "${curl_opts[@]}" -o "${filename_base}.tar.gz" "$arch_url" || fail "Could not download $arch_url"
	else
		RELEASE_EXT="zip"
		curl "${curl_opts[@]}" -o "${filename_base}.zip" "$zip_url" || fail "Could not download $zip_url"
	fi
}

install_version() {
	local install_type="$1"
	local version="$2"
	local install_path="${3%/bin}/bin"

	if [ "$install_type" != "version" ]; then
		fail "asdf-$TOOL_NAME supports release installs only"
	fi

	(
		mkdir -p "$install_path"
		cp -r "$ASDF_DOWNLOAD_PATH"/* "$install_path"

		local tool_cmd
		tool_cmd="$(echo "$TOOL_TEST" | cut -d' ' -f1)"
		test -x "$install_path/$tool_cmd" || fail "Expected $install_path/$tool_cmd to be executable."

		echo "$TOOL_NAME $version installation was successful!"
	) || (
		rm -rf "$install_path"
		fail "An error occurred while installing $TOOL_NAME $version."
	)
}
