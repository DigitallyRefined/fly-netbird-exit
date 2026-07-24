FROM netbirdio/netbird:0.75.0

RUN apk add --no-cache jq

COPY ./start.sh /start.sh
COPY ./healthcheck.sh /healthcheck.sh

ENTRYPOINT ["/start.sh"]
