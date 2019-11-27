#!/usr/bin/env bash

  # Set the license file path
  LICENSE_FILE_PATH=UnityLicenseFile.ulf
  UNITY_PROJECT_PATH=$GITHUB_WORKSPACE/$UNITY_PROJECT

  # Copy license file from Github variables
  echo "$UNITY_LICENSE" | tr -d '\r' > $LICENSE_FILE_PATH
  echo "$UNITY_LICENSE" | tr -d '\r' > /root/.local/share/unity3d/Unity/Unity_lic.ulf
  # TODO - test if this line has any effect
  echo "$UNITY_LICENSE" | tr -d '\r' > /root/.local/share/unity3d/Unity/Unity_v2019.x.ulf

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
      -manualLicenseFile $LICENSE_FILE_PATH
  # This is expected to always exit with code 1 (both success and failure).
  # Convert to exit code 0 by echoing the current exit code.
  echo $?
  # Exit code is now 0

echo "Testing the 2019.2 way"
# Reference: https://docs.unity3d.com/2019.2/Documentation/Manual/CommandLineArguments.html
echo "Using path: $UNITY_PROJECT_PATH"
ls -alh $UNITY_PROJECT_PATH
xvfb-run --auto-servernum --server-args='-screen 0 640x480x24' \
  /opt/Unity/Editor/Unity \
    -batchmode \
    -logfile /dev/stdout \
    -runEditorTests "$UNITY_PROJECT_PATH" \
    -editorTestsResultFile "$UNITY_PROJECT_PATH/old-results.xml"

UNITY_EXIT_CODE=$?

if [ $UNITY_EXIT_CODE -eq 0 ]; then
  echo "Run succeeded, no failures occurred";
elif [ $UNITY_EXIT_CODE -eq 2 ]; then
  echo "Run succeeded, some tests failed";
elif [ $UNITY_EXIT_CODE -eq 3 ]; then
  echo "Run failure (other failure)";
else
  echo "Unexpected exit code $UNITY_EXIT_CODE";
fi

# Test 2019.3 mode
# Reference: https://docs.unity3d.com/2019.3/Documentation/Manual/CommandLineArguments.html

#
# EditMode
#

ls -alh $UNITY_PROJECT_PATH
echo "Testing the 2019.3 way (editmode)"
xvfb-run --auto-servernum --server-args='-screen 0 640x480x24' \
  /opt/Unity/Editor/Unity \
    -batchmode \
    -logfile /dev/stdout \
    -runTests "$UNITY_PROJECT_PATH" \
    -testPlatform editmode \
    -testResults "$UNITY_PROJECT_PATH/editmode-results.xml"

UNITY_EXIT_CODE=$?

if [ $UNITY_EXIT_CODE -eq 0 ]; then
  echo "Run succeeded, no failures occurred";
elif [ $UNITY_EXIT_CODE -eq 2 ]; then
  echo "Run succeeded, some tests failed";
elif [ $UNITY_EXIT_CODE -eq 3 ]; then
  echo "Run failure (other failure)";
else
  echo "Unexpected exit code $UNITY_EXIT_CODE";
fi

#
# PlayMode
#

ls -alh $UNITY_PROJECT_PATH
echo "Testing the 2019.3 way (playmode)"
xvfb-run --auto-servernum --server-args='-screen 0 640x480x24' \
  /opt/Unity/Editor/Unity \
    -batchmode \
    -logfile /dev/stdout \
    -runTests "$UNITY_PROJECT_PATH" \
    -testPlatform playmode \
    -testResults "$UNITY_PROJECT_PATH/playmode-results.xml"

UNITY_EXIT_CODE=$?

if [ $UNITY_EXIT_CODE -eq 0 ]; then
  echo "Run succeeded, no failures occurred";
elif [ $UNITY_EXIT_CODE -eq 2 ]; then
  echo "Run succeeded, some tests failed";
elif [ $UNITY_EXIT_CODE -eq 3 ]; then
  echo "Run failure (other failure)";
else
  echo "Unexpected exit code $UNITY_EXIT_CODE";
fi

#
# Results
#

ls -alh $UNITY_PROJECT_PATH

echo "Results:"
cat "$UNITY_PROJECT_PATH/$TEST_PLATFORM-results.xml"
cat "$UNITY_PROJECT_PATH/$TEST_PLATFORM-results.xml" | grep test-run | grep Passed
echo "\n\nEditMode Results\n\n"
cat "$UNITY_PROJECT_PATH/editmode-results.xml"
cat "$UNITY_PROJECT_PATH/editmode-results.xml" | grep test-run | grep Passed
echo "\n\nPlayMode Results\n\n"
cat "$UNITY_PROJECT_PATH/playmode-results.xml"
cat "$UNITY_PROJECT_PATH/playmode-results.xml" | grep test-run | grep Passed

#
# Exit
#

exit $UNITY_EXIT_CODE
