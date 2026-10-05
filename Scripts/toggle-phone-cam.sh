#!/usr/bin/env bash

if pkill -x scrcpy; then
  dms ipc call toast info "Phone camera stopped"
else
  scrcpy \
    --serial=192.168.0.196:33927 \
    --video-source=camera \
    --camera-facing=front \
    --camera-size=1920x1080 \
    --camera-fps=30 \
    --v4l2-sink=/dev/video10 \
    --no-window \
    --no-audio \
    >/dev/null 2>&1 &

  dms ipc call toast info "Phone camera starting"
fi