FROM netbirdio/netbird:0.77.1

RUN apk add --no-cache jq

COPY ./start.sh /start.sh
COPY ./healthcheck.sh /healthcheck.sh

ENTRYPOINT ["/start.sh"]
