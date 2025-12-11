#!/bin/bash

# Clean previous builds
rm -f devpost-meta-qr-chrome.zip devpost-meta-qr-firefox.zip

# Build for Chrome
echo "Building for Chrome..."
mkdir -p build_chrome
cp manifest.json content.js qrcode.min.js icon128.png build_chrome/

cd build_chrome
zip -r ../devpost-meta-qr-chrome.zip .
cd ..
rm -rf build_chrome

# Build for Firefox
echo "Building for Firefox..."
mkdir -p build_firefox
cp content.js qrcode.min.js icon128.png build_firefox/
cp manifest-firefox.json build_firefox/manifest.json

cd build_firefox
zip -r ../devpost-meta-qr-firefox.zip .
cd ..
rm -rf build_firefox

echo "Done! Created devpost-meta-qr-chrome.zip and devpost-meta-qr-firefox.zip"
