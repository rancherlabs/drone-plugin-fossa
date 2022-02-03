FROM alpine:latest

COPY entrypoint.sh /usr/local/bin/drone-plugin-fossa

RUN apk update && \
    apk add bash \
            curl && \
    chmod +x /usr/local/bin/drone-plugin-fossa && \
    curl -H 'Cache-Control: no-cache' https://raw.githubusercontent.com/fossas/fossa-cli/master/install-latest.sh | bash

ENTRYPOINT ["/usr/local/bin/drone-plugin-fossa"]
