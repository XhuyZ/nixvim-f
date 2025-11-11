#!/usr/bin/env bash
set -euo pipefail

echo "🔹 Removing all .bak files..."

# Find all .bak files and delete them
find . -type f -name "*.bak" -print -exec rm -f {} \;

echo "✅ All .bak files removed."
