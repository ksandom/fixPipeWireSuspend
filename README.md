# fixPipeWireSuspend

Suspend on a traditional headphone jack results in unpleasant noise.

This repo includes basic fixes for when pipewire does that.

## Instructions

1. Go into the solutions directory.
1. Find the script that is named closest to the version of pipewire that you are running.
  * Eg `./1.0.3-3.1.sh`
1. Play some audio.
1. Wait 3 seconds to see if the static returns.

## Versions

Different distributions and versions of Pipewire have drastically different configurations. Hopefully this will help you find what will work for you. If not, hopefully it will give you some clues for how to solve it.

| script | Used on |
| --- | --- |
| 0.3.79.sh | Ubuntu 23.10 |
| 1.0.3-3.1.sh | Current OpenSUSE |
| oldSolution.sh | Earlier versions of OpenSUSE before I added versioning. |
| current.sh | Symlink to the current working script. |
