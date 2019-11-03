#!/usr/bin/env bash

set -e

if [[ ! -z "$UNITY_LICENSE" ]]; then
  #
  # PERSONAL LICENSE MODE
  #
  # This will activate Unity, using a license file
  #
  # Note that this is the ONLY WAY for PERSONAL LICENSES in 2019.
  #   * See for more details: https://gitlab.com/gableroux/unity3d-gitlab-ci-example/issues/5#note_72815478
  #
  # The license file can be found here:
  #   * Windows:   C:/ProgramData/Unity/Unity_lic.ulf
  #   * MacOS:     /Library/Application Support/Unity/Unity_lic.ulf
  #
  echo "$UNITY_LICENSE" > /root/.local/share/unity3d/Unity/Unity_lic.ulf
else
  #
  # PROFESSIONAL (SERIAL) LICENSE MODE
  #
  # This will activate unity, using the activating process.
  #
  # Note: This is the preferred way for PROFESSIONAL LICENSES.
  #
  xvfb-run --auto-servernum --server-args='-screen 0 640x480x24' \
    /opt/Unity/Editor/Unity \
      -logFile /dev/stdout \
      -batchmode \
      -username "$UNITY_EMAIL" \
      -password "$UNITY_PASSWORD" \
      -serial "$UNITY_SERIAL" \
      -nographics \
      -verbose \
      -quit \
      -projectPath "$(pwd)"
fi
