#!/bin/sh
# Pack the veida-go v0.2.0 CLI (release assets) into one snap per architecture.
set -e
V=0.2.0
for a in amd64 arm64; do
  mkdir -p build/$a/meta build/$a/bin && sed "s/ARCH/$a/" snap.yaml > build/$a/meta/snap.yaml
  curl -sSfL -o build/$a/bin/veida https://github.com/hanshs474/veida-go/releases/download/v$V/veida-linux-$a
  chmod 755 build/$a/bin/veida
done
docker run --rm -v "$PWD/build:/b" node:22-alpine sh -c 'apk add -q squashfs-tools &&
  for a in amd64 arm64; do mksquashfs /b/$a /b/veida_'$V'_$a.snap -noappend -comp xz -all-root -no-xattrs -no-fragments -quiet; done'
ls -la build/*.snap
