# NetBird Fly.io exit node

A fork of [patte/fly-tailscale-exit](https://github.com/patte/fly-tailscale-exit) for NetBird.

```bash
docker run --rm -it -v .fly:/.fly -v .:/app -w /app flyio/flyctl launch
docker run --rm -it -v .fly:/.fly -v .:/app -w /app flyio/flyctl scale count 1
docker run --rm -it -v .fly:/.fly -v .:/app -w /app flyio/flyctl ips allocate-v6
docker run --rm -it -v .fly:/.fly -v .:/app -w /app flyio/flyctl secrets set NB_MANAGEMENT_URL="https://netbird.example.com" NB_SETUP_KEY="..."
docker run --rm -it -v .fly:/.fly -v .:/app -w /app flyio/flyctl deploy
docker run --rm -it -v .fly:/.fly -v .:/app -w /app flyio/flyctl logs
```
