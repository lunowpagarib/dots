#!/usr/bin/env bash

# Check if a process with that exact command line exists.
if pgrep -x "$1" > 0; then
    # Kill all matching processes.
    # echo "$1"
    pkill "$1"
else
    # Launch the command in the background, preserving its arguments.
    # `exec` replaces the shell with the command; `&` puts it in the background.
   	"$@"
fi
