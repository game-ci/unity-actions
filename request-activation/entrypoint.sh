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
  echo "$UNITY_LICENSE" | tr -d '\r' > /root/.local/share/unity3d/Unity/Unity_lic.ulf

  set -x

  # Activate container
  # See: https://docs.unity3d.com/Manual/CommandLineArguments.html

  echo "Strategy 1 - Run without activation or test command"
  xvfb-run --auto-servernum --server-args='-screen 0 640x480x24' \
    /opt/Unity/Editor/Unity \
      -batchmode \
      -nographics \
      -logFile /dev/stdout \
      -quit \
  UNITY_EXIT_CODE=$?
  echo "Exited with code $UNITY_EXIT_CODE \n\n"

  echo "Strategy 2 - Run activation + test command"
  xvfb-run --auto-servernum --server-args='-screen 0 640x480x24' \
    /opt/Unity/Editor/Unity \
      -batchmode \
      -nographics \
      -logFile /dev/stdout \
      -quit \
      -manualLicenseFile $FILE_PATH \
      -runTests
  UNITY_EXIT_CODE=$?
  echo "Exited with code $UNITY_EXIT_CODE \n\n"

  echo "Strategy 3 - No activation, rely on license file"
  xvfb-run --auto-servernum --server-args='-screen 0 640x480x24' \
    /opt/Unity/Editor/Unity \
      -batchmode \
      -nographics \
      -logFile /dev/stdout \
      -quit \
      -runTests
  UNITY_EXIT_CODE=$?
  echo "Exited with code $UNITY_EXIT_CODE \n\n"

  # Display information about the result
  UNITY_EXIT_CODE=$?
  if [ $UNITY_EXIT_CODE -eq 0 ]; then
    echo "Activation complete"
  else
    echo "Unclassified error occured, trying to activate license"
    echo "Exit code was: $UNITY_EXIT_CODE"
  fi

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
