#!/usr/bin/env sh

set -eux

git config --global user.name  "🤖"
git config --global user.email "robot@example.org"

git clone https://github.com/PaperMC/Folia.git /tmp/folia
cd /tmp/folia

./gradlew --console=plain --info applyPatches
./gradlew --console=plain --info createReobfPaperclipJar

cd build/libs
sha256sum ./* > checksums.sha256

mkdir -p /dist
mv ./* /dist/

chown -R "${PUID}:${PGID}" /dist
