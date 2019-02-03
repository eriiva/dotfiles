#!/bin/sh

help() {
  echo "Usage: $0 <package>"
}

setup() {
  pkg=$1
  target=$2
  cd "$pkg" || return 1

  dirs="$(find . -mindepth 1 -type d | sed "s|./||")"
  for d in $dirs; do
    mkdir -p "$target/$d"
    echo "Created directory $target/$d"
  done

  files="$(find . -type f | sed "s|./||")"
  for f in $files; do
    targetf="$target/$f"
    sourcef="$(pwd)/$f"
    ln -b -s "$sourcef" "$targetf" || return 1
    echo "Linked file $f"
  done
}

if [ -z "$1" ]; then
  help
  exit 1
fi

cd "$(dirname "$0")" || return 1
setup "$1" "$HOME"
