#!/bin/bash
wget https://dl.google.com/linux/direct/google-chrome-unstable_current_amd64.deb
dpkg --fsys-tarfile google-chrome-unstable_current_amd64.deb | tar xfO - ./opt/google/chrome/libpdf.so | sudo tee /usr/lib/chromium-browser/libpdf.so > /dev/null
sudo chown root:root /usr/lib/chromium-browser/libpdf.so
sudo chmod 644 /usr/lib/chromium-browser/libpdf.so
rm google-chrome-unstable_current_amd64.deb
