#!/bin/bash
cd "/c/Users/marka/OneDrive/Documents/GitHub/bar-replay-miner"
while true; do
  node global-scan.js >> global-scan-loop.log 2>&1
  DONE=$(node -e "const s=JSON.parse(require('fs').readFileSync('global-scan-state.json')); console.log(s.done)")
  if [ "$DONE" = "true" ]; then
    echo "SCAN COMPLETE" >> global-scan-loop.log
    break
  fi
  sleep 2
done
