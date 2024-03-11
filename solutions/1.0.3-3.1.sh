#!/bin/bash
# Fix the audio suspend issue after an update.

whereToFix="/usr/share/wireplumber/scripts/node"
fileToModify="suspend-node.lua"

cd "$whereToFix"
sudo mv "$fileToModify" "$fileToModify".old

# Restart pipewire.
systemctl --user restart pipewire

# Make sure we play something to run it through a cycle.
echo "Now play something briefly, and then wait to see if the problem recurs."

