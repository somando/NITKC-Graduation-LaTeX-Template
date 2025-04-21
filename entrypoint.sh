#!/bin/sh

set -e

FILES=$(find . -name "*.tex")

if [ -z "$FILES" ]; then
  echo "No tex file found. Compile skipping..."
  exit 0
fi

mkdir -p outputs

platex -shell-escape main.tex

biber main

platex -shell-escape main.tex

platex -shell-escape main.tex
dvipdfmx -o outputs/main.pdf main.dvi

rm -f *.aux *.log *.dvi *.toc *.out *.fls *.fdb_latexmk *.bbl *.bcf *.blg *.run.xml
