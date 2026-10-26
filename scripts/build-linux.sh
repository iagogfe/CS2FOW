#!/usr/bin/env bash
set -euo pipefail

repo="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
if [[ "${1:-}" == "--install-tools" ]]; then
  apt-get -o Acquire::Retries=3 update
  # Versions already in the pinned SteamRT3 image, so the install is a no-op instead of an upgrade.
  apt-get install -y binutils=2.35.2-2 ca-certificates=20230311+deb12u1~deb11u1 \
    curl=7.74.0-1.3+steamrt3.2+deb11u16+bsrt3.1 g++=4:10.2.1-1 git=1:2.30.2-1+deb11u5 \
    python3=3.9.2-3 unzip=6.0-26+deb11u1
fi
python3 "$repo/scripts/build.py" --platform linux --skip-studio
