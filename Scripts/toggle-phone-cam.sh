#!/usr/bin/env bash
PHONE_IP="192.168.0.196"
DEV="/dev/video10"

toast() { dms ipc call toast "$1" "$2" >/dev/null 2>&1; }

# If it's running, stop it (the original instance shows the "stopped" toast)
if pkill -f -- "--v4l2-sink=$DEV"; then
  exit 0
fi

if [[ ! -e $DEV ]]; then
  toast error "Phone camera: $DEV not found (v4l2loopback not loaded)"
  exit 1
fi

toast info "Phone camera: looking for phone…"

# 1. mDNS via avahi
PORT=$(avahi-browse -rpt _adb-tls-connect._tcp 2>/dev/null \
  | awk -F';' -v ip="$PHONE_IP" '$1=="=" && $8==ip {print $9; exit}')

# 2. Fallback: port scan, then try each open port
if [[ -z $PORT ]]; then
  for p in $(nmap -p 30000-50000 --open -oG - "$PHONE_IP" 2>/dev/null \
      | grep -oP '\d+(?=/open)'); do
    if adb connect "$PHONE_IP:$p" 2>&1 | grep -qE '^(already )?connected'; then
      PORT=$p
      break
    fi
  done
fi

if [[ -z $PORT ]]; then
  toast error "Phone camera: phone not found (is Wireless debugging on?)"
  exit 1
fi

SERIAL="$PHONE_IP:$PORT"
adb connect "$SERIAL" >/dev/null 2>&1

toast info "Phone camera: starting…"

scrcpy --serial="$SERIAL" \
  --video-source=camera \
  --camera-facing=front \
  --camera-size=1920x1080 \
  --camera-fps=30 \
  --v4l2-sink="$DEV" \
  --no-window \
  --no-audio

toast warn "Phone camera: stopped"