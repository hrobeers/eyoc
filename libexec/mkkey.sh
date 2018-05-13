#!/usr/bin/env bash
set -e

[ -n "$KEY_DIR" ] || KEY_DIR="$HOME/.keys"
mkdir -p "$KEY_DIR"

KEY_NAME="$1"
[ -n "$KEY_NAME" ] || {
  echo "usage: mkkey <key-name>" >&2
  exit 1
}

KEY_FILE="${KEY_DIR%/}/$KEY_NAME"
[ ! -f "$KEY_FILE" ] || {
  echo "mkkey: file exists: $KEY_FILE" >&2
  exit 2
}

openssl rand 512 > "$KEY_FILE"
