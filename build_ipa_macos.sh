#!/usr/bin/env bash
set -euo pipefail

cd "$(dirname "$0")"
if ! command -v xcodegen >/dev/null 2>&1; then
  echo "Installing xcodegen via Homebrew..."
  brew install xcodegen
fi

xcodegen generate

xcodebuild -project FlappyRemix.xcodeproj \
  -scheme FlappyRemix \
  -sdk iphoneos \
  -configuration Release \
  -derivedDataPath build \
  CODE_SIGN_IDENTITY="" \
  CODE_SIGNING_REQUIRED=NO \
  CODE_SIGNING_ALLOWED=NO \
  clean build

rm -rf Payload FlappyRemix.ipa
mkdir -p Payload
cp -r build/Build/Products/Release-iphoneos/FlappyRemix.app Payload/
zip -r9 ../FlappyRemix.ipa Payload
echo "Done! Sideloadable IPA created at: ../FlappyRemix.ipa"
