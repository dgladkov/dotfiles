#!/bin/sh
wget -nc https://dl.google.com/linux/direct/google-chrome-unstable_current_amd64.deb
ar x google-chrome-unstable_current_amd64.deb data.tar.lzma
lzma -cd data.tar.lzma | tar xfO - ./opt/google/chrome-unstable/libpdf.so | sudo tee /usr/lib/chromium/libpdf.so > /dev/null
sudo chown root:root /usr/lib/chromium/libpdf.so
sudo chmod 644 /usr/lib/chromium/libpdf.so
rm data.tar.lzma google-chrome-unstable_current_amd64.deb
