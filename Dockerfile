FROM netbirdio/netbird:0.82.1

RUN apk add --no-cache jq

COPY ./start.sh /start.sh
COPY ./healthcheck.sh /healthcheck.sh

ENTRYPOINT ["/start.sh"]
