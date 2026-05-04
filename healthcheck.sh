#!/usr/bin/env sh
set -eu

STATUS_JSON=$(netbird status --json 2>/dev/null || true)
if [ -z "$STATUS_JSON" ]; then
  echo "netbird status unavailable"
  exit 1
fi

echo "$STATUS_JSON" | jq -e '.daemonStatus == "Connected"' >/dev/null || {
  echo "netbird daemon not connected"
  exit 1
}

echo "$STATUS_JSON" | jq -e '.management.connected == true' >/dev/null || {
  echo "netbird management not connected"
  exit 1
} 

echo "$STATUS_JSON" | jq -e '.signal.connected == true' >/dev/null || {
  echo "netbird signal not connected"
  exit 1
}

exit 0
