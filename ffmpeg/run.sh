#!/usr/bin/env bash

set -e

while true; do
  ffmpeg \
    -rtsp_transport tcp \
    -i rtsp://test-stream.assaia.com:8554/plane \
    -f image2 \
    -update 1 \
    -y /shared/plane.jpg

  sleep 1
done
