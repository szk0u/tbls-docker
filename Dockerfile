FROM alpine:3.7

ENV TBLS_VERSION v0.9.0

RUN apk add --update  \
  curl graphviz font-bitstream-type1

RUN curl -sSL https://github.com/k1LoW/tbls/releases/download/${TBLS_VERSION}/tbls_${TBLS_VERSION}_linux_amd64.tar.gz -o tbls_${TBLS_VERSION}_linux_amd64.tar.gz && \
  tar -xzf tbls_${TBLS_VERSION}_linux_amd64.tar.gz && \
  mv tbls_${TBLS_VERSION}_linux_amd64/tbls /usr/local/bin/tbls && \
  chmod +x /usr/local/bin/tbls

ENTRYPOINT [ "/usr/local/bin/tbls" ]
CMD [ "help" ]