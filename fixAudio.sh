#!/bin/bash
# Fix the audio suspend issue after an update.

whereToFix="/usr/share/wireplumber/main.lua.d"
fileToModify="90-6-suspend-idle-nodes.lua"

cd "$whereToFix" || {
  echo "Did not successfully get into \"$whereToFix\" . Exiting." >&2
  exit 1
}

if [ ! -e "$fileToModify" ]; then
  echo "Can not see \"$fileToModify\" . Exiting." >&2
  exit 1
fi

# *** Do the modification. ***
before="$(cat "$fileToModify" | sha1sum)"
sudo sed -i 's#^\(load_script("suspend-node.lua")\)#-- \1#g' 90-6-suspend-idle-nodes.lua
after="$(cat "$fileToModify" | sha1sum)"

# Did we change anything?
if [ "$after" == "$before" ]; then
  echo "No configuration changed. This probably won't fix anything."
else
  echo "Configuration changed."
fi

# Restart pipewire.
systemctl --user restart pipewire

# Make sure we play something to run it through a cycle.
echo "Now play something briefly, and then wait to see if the problem recurs."
