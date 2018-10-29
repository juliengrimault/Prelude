#!/bin/bash

# Checks if swiftlint has been installed, displaying an error in Xcode if it's missing.

if [ "A${SKIP_LINTING}" != "A" ] ; then
  echo "SKIP_LINTING is set -> not linting."
  exit 0
elif which swiftlint >/dev/null; then
  swiftlint lint --path ${PROJECT_DIR} --config $1
else
  echo "warning: SwiftLint not installed, download from https://github.com/realm/SwiftLint"
fi
