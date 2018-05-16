#!/usr/bin/env bash
set -e

DIR=$( dirname "${BASH_SOURCE[0]}" )
source "$DIR/bin/eyoc-source.sh"

PREFIX="$1"
if [ -z "$1" ]; then
  { echo "usage: $0 <prefix>"
    echo "  e.g. $0 /usr/local"
  } >&2
  exit 1
fi

EYOC_ROOT="$(abs_dirname "$0")"
mkdir -p "$PREFIX"/{bin,libexec,share/man/man1}
cp -R "$EYOC_ROOT"/bin/* "$PREFIX"/bin
cp -R "$EYOC_ROOT"/libexec/* "$PREFIX"/libexec
# TODO write man page (e.g. generate from README)
#cp "$EYOC_ROOT"/man/eyoc.1 "$PREFIX"/share/man/man1

echo "Installed eyoc to $PREFIX/bin/"
