FROM alpine:edge
LABEL maintainer "jrofurtado@gmail.com"
RUN apk add --no-cache nghttp2 python openssl ca-certificates nodejs inotify-tools
HEALTHCHECK --interval=30s --timeout=3s --start-period=10s --retries=3 CMD node /healthcheck.js
CMD /entrypoint.sh
ENTRYPOINT [ ]
COPY files/ /
