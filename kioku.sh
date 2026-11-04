#!/bin/sh
cd "$(dirname "$0")" || exit 1
chmod +x ./Kioku 2>/dev/null || true
./Kioku &
pid=$!
i=0
while [ "$i" -lt 40 ]; do
  if curl -fsS -o /dev/null --max-time 1 http://127.0.0.1:5184/ >/dev/null 2>&1; then
    break
  fi
  i=$((i + 1))
  sleep 1
done
if command -v xdg-open >/dev/null 2>&1; then
  xdg-open http://127.0.0.1:5184 >/dev/null 2>&1 || true
fi
wait "$pid"
