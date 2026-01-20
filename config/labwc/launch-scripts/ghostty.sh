#!/usr/bin/env bash

if pgrep ghostty  >/dev/null; then
  	wlrctl toplevel focus com.mitchellh.ghostty
else
	ghostty 2>&1 &
fi
