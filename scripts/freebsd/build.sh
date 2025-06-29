#!/bin/sh

set -ex

if ! command -v pkg; then
	echo "This script should be run in a FreeBSD environment"
	exit 1
fi

pkg update
pkg install -y bash binutils meson mimalloc pkgconf sudo wget zstd

pw user add -n vmuser -m -g wheel
echo "vmuser ALL=(ALL) NOPASSWD: ALL" >> /usr/local/etc/sudoers

bash scripts/common/install-dependencies.sh
bash scripts/build-runtime.sh
