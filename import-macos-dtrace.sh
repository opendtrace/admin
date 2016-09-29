#!/bin/sh
#
# Author: George V. Neville-Neil
#
# Import an Apple DTrace tarball into the OpenDTrace git repo.
#
# This must be run from the root of the repo and there has to be a
# base revision already checked in.
#

tarball=$1
os_version=$2

# Prep for a new import
rm -rf *

# Point this at your directory of tarballs
tar --strip-components 1 -xf ../tarballs/opensource.apple.com/tarballs/dtrace/${tarball}.tar.gz

git add .

git commit -m "OSX: $os_version, Tar File: $tarball"

# Tag this commit
git tag $os_version
git tag $tarball

