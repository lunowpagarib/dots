#!/usr/bin/env bash

if pgrep thunar  >/dev/null; then
        wlrctl toplevel focus thunar
else
        thunar  2>&1 &
fi
