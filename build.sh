#!/bin/sh -xe

git clone https://github.com/microsoft/vscode
cd vscode
git checkout `git tag | sort -V | grep ^[0-9] | tail -n 1`

sed -e s/4095/1024/g -e s/8192/1024/g -i package.json

yarn
yarn run gulp vscode-linux-arm64-min
yarn run gulp vscode-linux-arm64-build-deb
