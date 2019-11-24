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
  # The license file can be acquired in two possible ways:
  #   * Utilize `webbertakken/unity-actions/request-manual-activation-file`
  #   * Copy from your local machine (may be unstable due to different server specs)
  #       - Windows:   C:/ProgramData/Unity/Unity_lic.ulf
  #       - MacOS:     /Library/Application Support/Unity/Unity_lic.ulf
  #       - Linux:     -
  #
  # CLI arguments reference: https://docs.unity3d.com/Manual/CommandLineArguments.html

  # Set the license file path
  FILE_PATH=UnityLicenseFile.ulf

  # Copy license file from Github variables
  echo "$UNITY_LICENSE" | tr -d '\r' > $FILE_PATH
  echo "$UNITY_LICENSE" | tr -d '\r' > /root/.local/share/unity3d/Unity/Unity_lic.ulf

  ##
  ## Activate license
  ##
  echo "Requesting activation"
  xvfb-run --auto-servernum --server-args='-screen 0 640x480x24' \
    /opt/Unity/Editor/Unity \
      -batchmode \
      -nographics \
      -logFile /dev/stdout \
      -quit \
      -manualLicenseFile $FILE_PATH
  # This is expected to always exit with code 1 (both success and failure).
  # Convert to exit code 0 by echoing the current exit code.
  echo $?
  # Exit code is now 0

  ##
  ## Verify activated license
  ##
  echo "Verifying activation"
  # Run any command that requires activation to verify
  xvfb-run --auto-servernum --server-args='-screen 0 640x480x24' \
    /opt/Unity/Editor/Unity \
      -batchmode \
      -nographics \
      -logFile /dev/stdout \
      -quit

  # Store the exit code from the verify command
  UNITY_EXIT_CODE=$?

  # Display information about the result
  if [ $UNITY_EXIT_CODE -eq 0 ]; then
    echo "Activation complete"
  else
    echo "Unclassified error occured while trying to activate license"
    echo "Exit code was: $UNITY_EXIT_CODE"
  fi

  # Exit with the code from the license verification step
  exit $UNITY_EXIT_CODE

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
