#!/usr/bin/env bash

if pgrep zen >/dev/null; then
  	wlrctl toplevel focus zen
else
	zen-browser 2>&1 &
fi
