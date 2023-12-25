#!/bin/bash

export PORT=5000
echo "Starting cloudflared with token $CLOUDFLARE_TUNNEL_TOKEN"
sudo cloudflared service install "$CLOUDFLARE_TUNNEL_TOKEN"
echo "cloudflared started successfully"
node build