#!/usr/bin/env bash
set -euo pipefail

agentshield_root() {
  if [[ -f /agent/repos/agentshield/package.json ]]; then
    echo /agent/repos/agentshield
  elif [[ -f /workspace/package.json ]]; then
    echo /workspace
  elif [[ -f package.json ]]; then
    pwd
  else
    echo "AgentShield package.json not found" >&2
    exit 1
  fi
}

cd "$(agentshield_root)"
npm ci
npm run build
