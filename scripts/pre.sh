#!/bin/bash

# exit on errors
set -e

if [[ ! -e "$HOME/.nvm/nvm.sh" ]]; then
  echo "nvm command not found; need nvm to continue."
  exit 1
fi

. "$HOME/.nvm/nvm.sh"
nvm install 10

if [[ ! -d "$HOME/.space-elevator" ]] || [[ ! -e "$HOME/.space-elevator/ip" ]]; then
  echo "Space Elevator not provisioned; run `provision` command first."
  exit 1
fi

if [[ -d "$HOME/.ssb" ]]; then
  # backup any .ssb garbage present
  echo "Warning, found existing ~/.ssb folder. Temporarily moving to ~/.ssb.old"
  mv "$HOME/.ssb" "$HOME/.ssb.old"
fi

mkdir -p "$HOME/.ssb"

IP=`cat "$HOME/.space-elevator/ip"`

# copy manifest.json and secret locally
scp "spaceman@$IP":"/home/spaceman/.ssb/{manifest.json,secret}" "$HOME/.ssb/"

MAIN_DIR=`pwd`
