#!/bin/bash
# Fix the audio suspend issue after an update.

whereToFix="/usr/share/pipewire"
fileToModify="minimal.conf"

# Backup.
cd "$whereToFix"
[ ! -e "$fileToModify".old ] && sudo cp "$fileToModify" "$fileToModify".old

# Modify.
sudo sed -i 's/ *node.suspend-on-idle *= *true/node.suspend-on-idle   = false/g' "$fileToModify"

# Restart pipewire.
systemctl --user restart pipewire

# Make sure we play something to run it through a cycle.
echo "Now play something briefly, and then wait to see if the problem recurs."

