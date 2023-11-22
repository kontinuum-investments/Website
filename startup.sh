#!/bin/bash

npm i --omit dev
npm run build
PORT=443 node build