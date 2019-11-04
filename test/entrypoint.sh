#!/usr/bin/env bash

set -e

echo "$UNITY_LICENSE" > /root/.local/share/unity3d/Unity/Unity_lic.ulf

set -x

echo "Testing for $TEST_PLATFORM"

${UNITY_EXECUTABLE:-xvfb-run --auto-servernum --server-args='-screen 0 640x480x24' /opt/Unity/Editor/Unity} \
  -batchmode \
  -nographics \
  -logFile /dev/stdout \
  -batchmode \
  -nographics \
  -verbose \
  -quit \
  -projectPath $GITHUB_WORKSPACE \
  -runTests \
  -testPlatform $TEST_PLATFORM \
  -testResults $GITHUB_WORKSPACE/$TEST_PLATFORM-results.xml

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

cat $(pwd)/$TEST_PLATFORM-results.xml | grep test-run | grep Passed
exit $UNITY_TEST_EXIT_CODE
