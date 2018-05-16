#!/usr/bin/env bash
set -e

EYOC_ROOT="$(eyoc-source.sh location)"
rm "$EYOC_ROOT"/bin/eyoc-*
rm -r "$EYOC_ROOT"/libexec/eyoc/

echo "Uninstalled eyoc from $EYOC_ROOT/bin/"
