#!/bin/bash

sudo cloudflared service install "$CLOUDFLARE_TUNNEL_TOKEN"
export PORT=5000
node build