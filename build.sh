#!/bin/bash
set -euo pipefail

normalize_future_mtimes() {
  local now fixed
  now=$(date +%s)
  fixed=0

  while IFS= read -r -d '' file; do
	local mtime
	mtime=$(stat -c %Y "$file" 2>/dev/null || echo 0)
	if ((mtime > now)); then
	  touch "$file"
	  fixed=1
	fi
  done < <(find src include bin -type f -print0)

  if ((fixed == 1)); then
	echo "Normalized future file timestamps to avoid make clock-skew warnings."
  fi
}

echo "=== Building libappstream.so ==="
make clean 2>/dev/null || true
normalize_future_mtimes
make -j"$(nproc)" verify

echo ""
echo "=== Installing Dart dependencies ==="
dart pub get

echo ""
echo "=== Running appstream ==="
dart run bin/main.dart "$@"
