#!/bin/sh

set -e

FILES=$(find . -name "*.tex")

if [ -z "$FILES" ]; then
  echo "No tex file found. Compile skipping..."
  exit 0
fi

mkdir -p outputs

for file in *.tex; do
  if [ -f .texignore ] && grep -qx "$file" .texignore; then
    echo "Skipping $file (listed in .texignore)"
  else
    echo "Compiling $file..."
    platex -shell-escape "$file"
  fi
done
echo "Compilation complete. PDFs are in the outputs directory."

cp main.toc contents.toc

for file in *.tex; do
  if [ -f .texignore ] && grep -qx "$file" .texignore; then
    echo "Skipping $file (listed in .texignore)"
  else
    echo "Compiling $file..."
    platex -shell-escape "$file"
    dvipdfmx -o "outputs/${file%.tex}.pdf" "${file%.tex}.dvi"
  fi
done
echo "Recompilation complete. PDFs are in the output directory."

echo "Cleaning up..."
rm -f *.aux *.log *.dvi *.toc *.out *.fls *.fdb_latexmk
echo "Done."

echo "All done!"
