#!/usr/bin/env sh

echo 'Starting up...'

echo "fly-$PRIMARY_REGION" > /etc/hostname
hostname -F /etc/hostname

# Start NetBird in the background
netbird-entrypoint.sh &
NETBIRD_PID=$!

healthcheck_loop() {
    while true; do
        sleep 30
        if ! /healthcheck.sh; then
            echo "Healthcheck failed; restarting NetBird"
            netbird down
            sleep 5
            netbird up
        fi
    done
}

# Run healthcheck loop in background
healthcheck_loop &

# Wait for NetBird process to exit
wait $NETBIRD_PID
