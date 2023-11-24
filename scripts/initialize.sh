#!/bin/bash

# Setup dependencies
apt install -y npm
npm i --omit dev
npm run build