FROM paperist/texlive-ja:latest

WORKDIR /workdir

RUN tlmgr update --self && \
  tlmgr install biber biblatex

COPY entrypoint.sh /usr/local/bin/entrypoint.sh

RUN sed -i 's/\r$//' /usr/local/bin/entrypoint.sh && chmod +x /usr/local/bin/entrypoint.sh

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
