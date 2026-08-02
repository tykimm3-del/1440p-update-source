#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")"

PACKER=""
for candidate in ./hacbrewpack ./hacBrewPack; do
  if [[ -x "$candidate" ]]; then
    PACKER="$candidate"
    break
  fi
done

if [[ -z "$PACKER" ]]; then
  echo "ERROR: executable hacbrewpack was not found in this folder." >&2
  exit 1
fi

if [[ ! -f keys.dat ]]; then
  echo "ERROR: keys.dat was not found. Keep your own keyset local." >&2
  exit 1
fi

for required in exefs/main exefs/main.npdm control/control.nacp; do
  if [[ ! -f "$required" ]]; then
    echo "ERROR: missing $required" >&2
    exit 1
  fi
done

rm -rf hacbrewpack_temp hacbrewpack_nca hacbrewpack_nsp

"$PACKER" -k keys.dat \
  --exefsdir exefs \
  --romfsdir romfs \
  --controldir control \
  --nologo \
  --tempdir hacbrewpack_temp \
  --ncadir hacbrewpack_nca \
  --nspdir hacbrewpack_nsp

echo "Completed. Check ./hacbrewpack_nsp/"
