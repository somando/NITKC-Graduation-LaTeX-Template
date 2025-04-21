FROM paperist/texlive-ja:latest

RUN tlmgr update --self && \
  tlmgr install biber biblatex
