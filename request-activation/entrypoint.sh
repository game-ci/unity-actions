#!/usr/bin/env bash

if [[ -n "$UNITY_LICENSE" ]]; then
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

  # Set the license file path
  FILE_PATH=UnityLicenseFile.ulf

  # Copy license file from Github variables
  echo "$UNITY_LICENSE" > $FILE_PATH
  # echo "$UNITY_LICENSE" > /root/.local/share/unity3d/Unity/Unity_lic.ulf

  # Activate container
  # See: https://docs.unity3d.com/Manual/CommandLineArguments.html
  echo "Activating Unity"
  xvfb-run --auto-servernum --server-args='-screen 0 640x480x24' \
    /opt/Unity/Editor/Unity \
      -batchmode \
      -nographics \
      -logFile /dev/stdout \
      -quit \
      -manualLicenseFile $FILE_PATH

else
  #
  # PROFESSIONAL (SERIAL) LICENSE MODE
  #
  # This will activate unity, using the activating process.
  #
  # Note: This is the preferred way for PROFESSIONAL LICENSES.
  #
  # TODO - Verify this using some pro license
  #
  xvfb-run --auto-servernum --server-args='-screen 0 640x480x24' \
    /opt/Unity/Editor/Unity \
      -batchmode \
      -nographics \
      -logFile /dev/stdout \
      -quit \
      -serial "$UNITY_SERIAL" \
      -username "$UNITY_EMAIL" \
      -password "$UNITY_PASSWORD"

fi
