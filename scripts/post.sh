#!/bin/bash

# exit on errors
set -e

# cleanup
rm -rf "$HOME/.ssb"

# restore backup if we made one
if [[ -d "$HOME/.ssb.old" ]]; then
  mv "$HOME/.ssb.old" "$HOME/.ssb"
fi