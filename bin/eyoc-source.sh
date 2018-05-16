#!/usr/bin/env bash

resolve_link() {
  $(type -p greadlink readlink | head -1) "$1"
}

abs_dirname() {
  local cwd="$(pwd)"
  local path="$1"

  while [ -n "$path" ]; do
    cd "${path%/*}"
    local name="${path##*/}"
    path="$(resolve_link "$name" || true)"
  done

  pwd
  cd "$cwd"
}

key_file() {
  local host="$1"
  local port="$2"
  echo "eyoc@$host:$port"
}

EYOC_LIBEXEC="$(dirname $(abs_dirname "$0"))/libexec"
export PATH="$EYOC_LIBEXEC:$PATH"
