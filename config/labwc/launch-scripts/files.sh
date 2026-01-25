#!/usr/bin/env bash

if pgrep "Thunar|thunar"  >/dev/null; then
        wlrctl window focus Thunar
else
        thunar 2>&1 &
fi
