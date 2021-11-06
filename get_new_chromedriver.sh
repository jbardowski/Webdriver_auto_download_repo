#!usr/bin/env bash

#takes in 1 positional parameter; pre-written to download Chromedriver for Mac64
#base url stems from https://chromedriver.chromium.org/downloads, which offers zip files to download
#unzipping extracts the chromedriver file; move that, then delete the zip
#Mac blocks the unknown chromedriver developer; xattr is a work-around
#-d causes the given attribute name (and associated value) to be removed


BASE_URL='https://chromedriver.storage.googleapis.com'
MAC_VERSION="${1}/chromedriver_mac64.zip"

FULL_URL="${BASE_URL}/${MAC_VERSION}"
echo "Downloading zip file from..."
echo $FULL_URL

curl -O $FULL_URL

unzip chromedriver_mac64.zip
mv chromedriver /usr/local/bin
rm chromedriver_mac64.zip
echo "Successully downloaded, unzipped, and moved chromedriver into the path."

echo "Stripping the xattr com.apple.quarantine attribute from the file..."
xattr -d com.apple.quarantine $(which chromedriver)
