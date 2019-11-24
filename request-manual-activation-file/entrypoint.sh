#!/usr/bin/env bash

# Request the manual activation file for activating unity personal
# Expected output file: "Unity_v${{ unity-tag }}.alf"
xvfb-run --auto-servernum --server-args='-screen 0 640x480x24' \
  /opt/Unity/Editor/Unity \
    -batchmode \
    -nographics \
    -logFile /dev/stdout \
    -quit \
    -createManualActivationFile

# Output the resulting file as an output variable (Strategy 1)
ACTIVATION_FILE=$(cat Unity_v2019.2.11f1.alf)
echo $ACTIVATION_FILE
echo "Use this file for manual activation and add it to \$UNITY_LICENSE variabe."
#echo "::add-mask::$ACTIVATION_FILE"
echo "::set-output name=activationFile::$ACTIVATION_FILE"

# Output the resulting file by copying (Strategy 2)
cp Unity_v2019.2.11f1.alf $HOME/Unity_v2019.2.11f1.alf
