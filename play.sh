#!/usr/bin/env bash
# Launch ARENA STRIKE in the real Chrome.
# GPU is online on kernels 137/138 (nvidia 580 + GTX 1070), so we render on
# hardware by default. Pass --sw to force Chrome's software (SwiftShader)
# renderer, e.g. if you're booted into a kernel with no GPU (110).
# Resolve index.html relative to this script so the repo can move freely.
DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
GAME="file://$DIR/index.html"

if [ "$1" = "--sw" ]; then
  shift
  exec google-chrome --enable-unsafe-swiftshader "$GAME" "$@"
else
  exec google-chrome "$GAME" "$@"
fi
