#!/usr/bin/env bash

set -euo pipefail

# Usage:
# link_same TARGET LINK_NAME
#
# Create a link to TARGET only if LINK_NAME does not exist
# if LINK_NAME exists and links to TARGET, then do nothing
# otherwise, fail
link_same() {
  if [[ ! -e $1 ]]; then
    printf 'Missing link source: %s\n' "$1" >&2
    return 1
  fi
  mkdir -p "$(dirname "$2")"
  (ln -sT "$1" "$2" &> /dev/null && echo "Linked $2 -> $1") \
   || ([ "$(readlink "$2")" = "$1" ] && echo "Already linked $2") \
   || (echo -e "\033[0;31mUnable to link $2 -> $1\033[0m" && false)
}

# Usage:
# link_same_files SOURCE_DIR TARGET_DIR
#
# Similar to link_same, but links each file inside of TARGET
link_same_files() {
  if [[ ! -d $1 ]]; then
    printf 'Missing source directory: %s\n' "$1" >&2
    return 1
  fi
  local f
  for f in "$1"/* "$1"/.[!.]* "$1"/..?*; do
    [[ -e $f || -L $f ]] || continue
    link_same "$f" "$2/$(basename "$f")"
  done
}

# Usage
# link_same_single SOURCE_DIR FILENAME TARGET_DIR
#
# Links the file with the semantics of link_same and creates
# the directory if not exists
link_same_single() {
  link_same "$1/$2" "$3/$2"
}
