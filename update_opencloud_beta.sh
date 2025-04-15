#!/bin/bash
# Script to update OpenCloud Desktop Beta cask
#
# USAGE:
#   ./update_opencloud_beta.sh <version>
#
# EXAMPLE:
#   ./update_opencloud_beta.sh 1.0.0-rc.3
#
# DESCRIPTION:
#   This script automatically updates the opencloud-beta.rb cask file with a new version.
#   It downloads the SHA256 checksum files from GitHub and updates the cask accordingly.
#
# REQUIREMENTS:
#   - gh CLI tool (GitHub CLI) must be installed and authenticated
#   - Homebrew must be installed
#   - You must run this from the homebrew directory that contains homebrew-opencloud

set -e

if [ $# -ne 1 ]; then
  echo "Usage: $0 <version>"
  echo "Example: $0 1.0.0-rc.3"
  exit 1
fi

VERSION="$1"
CASK_PATH="homebrew-opencloud/Casks/o/opencloud-beta.rb"
TEMP_DIR="/tmp/opencloud"

# Create temp directory if it doesn't exist
mkdir -p "$TEMP_DIR"

# Download SHA256 files
echo "Downloading SHA256 files for version $VERSION..."
gh release download "v$VERSION" --repo opencloud-eu/desktop --pattern "*.sha256" --dir "$TEMP_DIR"

# Read SHA256 values
ARM64_SHA256=$(cat "$TEMP_DIR/OpenCloud_Desktop-v$VERSION-macos-clang-arm64.pkg.sha256")
INTEL_SHA256=$(cat "$TEMP_DIR/OpenCloud_Desktop-v$VERSION-macos-clang-x86_64.pkg.sha256")

echo "ARM64 SHA256: $ARM64_SHA256"
echo "Intel SHA256: $INTEL_SHA256"

# Update cask file
echo "Updating $CASK_PATH..."
sed -i '' "s/version \".*\"/version \"$VERSION\"/" "$CASK_PATH"
sed -i '' "s/sha256 arm:   \"[0-9a-f]*\",/sha256 arm:   \"$ARM64_SHA256\",/" "$CASK_PATH"
sed -i '' "s/intel: \"[0-9a-f]*\"/intel: \"$INTEL_SHA256\"/" "$CASK_PATH"

# Check style
echo "Checking style..."
cd "$(dirname "$CASK_PATH")" && brew style --fix "$CASK_PATH"

echo "Done! Cask updated to version $VERSION"
echo "You can now test it with: HOMEBREW_NO_INSTALL_FROM_API=1 brew install --cask ./$CASK_PATH"