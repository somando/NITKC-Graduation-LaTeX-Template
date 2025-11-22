#!/bin/sh

set -eu

OUT_DIR="outputs"
TARGET_TEX="${1:-main.tex}"
JOBNAME="$(basename "$TARGET_TEX" .tex)"

FILES=$(find . -name "*.tex" -type f)
if [ -z "$FILES" ]; then
  echo "[INFO] No tex file found. Compile skipping..."
  exit 0
fi

if [ ! -f "$TARGET_TEX" ]; then
  if [ "$TARGET_TEX" = "main.tex" ]; then
    FALLBACK=$(find . -maxdepth 1 -name "*.tex" -type f | head -n 1 || true)
    if [ -n "$FALLBACK" ]; then
      TARGET_TEX="$FALLBACK"
      JOBNAME="$(basename "$TARGET_TEX" .tex)"
      echo "[WARN] main.tex not found. Fallback to: $TARGET_TEX"
    else
      echo "[ERROR] main.tex not found and no top-level tex files to compile."
      exit 1
    fi
  else
    echo "[ERROR] Target tex not found: $TARGET_TEX"
    exit 1
  fi
fi

echo "[INFO] Compile target: $TARGET_TEX (jobname: $JOBNAME)"

latexmk -pdfdvi -interaction=nonstopmode -shell-escape "$TARGET_TEX"

if [ ! -f "${JOBNAME}.pdf" ]; then
  echo "[ERROR] PDF not generated."
  exit 1
fi

mkdir -p "$OUT_DIR"
mv -f "${JOBNAME}.pdf" "$OUT_DIR/${JOBNAME}.pdf"
echo "[INFO] Output PDF: $OUT_DIR/${JOBNAME}.pdf"

latexmk -c "$TARGET_TEX"
echo "[INFO] Clean done."
