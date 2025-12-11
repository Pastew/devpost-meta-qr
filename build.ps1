# Clean previous builds
if (Test-Path devpost-meta-qr-chrome.zip) { Remove-Item devpost-meta-qr-chrome.zip }
if (Test-Path devpost-meta-qr-firefox.zip) { Remove-Item devpost-meta-qr-firefox.zip }

# Build for Chrome
Write-Host "Building for Chrome..."
$chromeDir = "build_chrome"
New-Item -ItemType Directory -Force -Path $chromeDir | Out-Null
Copy-Item "manifest.json", "content.js", "qrcode.min.js", "icon128.png" -Destination $chromeDir
Compress-Archive -Path "$chromeDir\*" -DestinationPath devpost-meta-qr-chrome.zip -Force
Remove-Item $chromeDir -Recurse -Force

# Build for Firefox
Write-Host "Building for Firefox..."
$firefoxDir = "build_firefox"
New-Item -ItemType Directory -Force -Path $firefoxDir | Out-Null
Copy-Item "content.js", "qrcode.min.js", "icon128.png" -Destination $firefoxDir
Copy-Item "manifest-firefox.json" -Destination "$firefoxDir\manifest.json"
Compress-Archive -Path "$firefoxDir\*" -DestinationPath devpost-meta-qr-firefox.zip -Force
Remove-Item $firefoxDir -Recurse -Force

Write-Host "Done! Created devpost-meta-qr-chrome.zip and devpost-meta-qr-firefox.zip"
