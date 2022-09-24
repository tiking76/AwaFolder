#!/bin/bash

# Brew path is /opt/homebrew in M1 Macs.
if test -d "/opt/homebrew/bin/"; then
  PATH="/opt/homebrew/bin/:${PATH}"
fi
export PATH

swiftlint autocorrect --format
swiftlint
