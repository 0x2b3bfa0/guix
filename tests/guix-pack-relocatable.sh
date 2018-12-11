# GNU Guix --- Functional package management for GNU
# Copyright © 2018 Ludovic Courtès <ludo@gnu.org>
#
# This file is part of GNU Guix.
#
# GNU Guix is free software; you can redistribute it and/or modify it
# under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 3 of the License, or (at
# your option) any later version.
#
# GNU Guix is distributed in the hope that it will be useful, but
# WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with GNU Guix.  If not, see <http://www.gnu.org/licenses/>.

#
# Test the 'guix pack --relocatable' using the external store, if any.
#

guix pack --version

# 'guix pack --relocatable' requires a C compiler and libc.a, which our
# bootstrap binaries don't provide.  To make the test relatively inexpensive,
# run it on the user's global store if possible, on the grounds that binaries
# may already be there or can be built or downloaded inexpensively.

NIX_STORE_DIR="`guile -c '(use-modules (guix config))(display %storedir)'`"
localstatedir="`guile -c '(use-modules (guix config))(display %localstatedir)'`"
GUIX_DAEMON_SOCKET="$localstatedir/guix/daemon-socket/socket"
export NIX_STORE_DIR GUIX_DAEMON_SOCKET

if ! guile -c '(use-modules (guix)) (exit (false-if-exception (open-connection)))'
then
    exit 77
fi

STORE_PARENT="`dirname $NIX_STORE_DIR`"
export STORE_PARENT
if test "$STORE_PARENT" = "/"; then exit 77; fi

# This test requires user namespaces and associated command-line tools.
if ! unshare -mrf sh -c 'mount -t tmpfs none "$STORE_PARENT"'
then
    exit 77
fi

test_directory="`mktemp -d`"
export test_directory
trap 'chmod -Rf +w "$test_directory"; rm -rf "$test_directory"' EXIT

tarball="`guix pack -R -S /Bin=bin sed`"
(cd "$test_directory"; tar xvf "$tarball")

# Run that relocatable 'sed' in a user namespace where we "erase" the store by
# mounting an empty file system on top of it.  That way, we exercise the
# wrapper code that creates the user namespace and bind-mounts the store.
unshare -mrf sh -c 'mount -t tmpfs none "$STORE_PARENT"; echo "$STORE_PARENT"/*; "$test_directory/Bin/sed" --version > "$test_directory/output"'
grep 'GNU sed' "$test_directory/output"
