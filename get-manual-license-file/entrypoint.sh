#!/usr/bin/env bash

set -e

xvfb-run --auto-servernum --server-args='-screen 0 640x480x24' \
  /opt/Unity/Editor/Unity \
    -batchmode \
    -nographics \
    -logFile /dev/stdout \
    -createManualActivationFile

echo "Use this file for manual activation and add it to \$UNITY_LICENSE variabe."
cat Unity_v2019.2.11f1.alf

cp Unity_v2019.2.11f1.alf $HOME/Unity_v2019.2.11f1.alf
