#!/bin/bash
#
# Build a Debian package for the host machine architecture.

msg-run() {
	echo -e "\E[32;1m> $*\E[m"
	"$@"
}

# Install build dependnecies.
#msg-run sudo apt-get build-dep .
msg-run dpkg-buildpackage -b --no-sign

# Run ""./debian/rules clean" to cleanup artifacts.
