#!/usr/bin/env bash

set -e

xvfb-run --auto-servernum --server-args='-screen 0 640x480x24' \
  /opt/Unity/Editor/Unity \
    -logFile /dev/stdout \
    -batchmode \
    -username "$UNITY_USERNAME" -password "$UNITY_PASSWORD"
