#!/bin/bash
set -e

version=$1

tag="ghcr.io/korylprince/kmfddm-docker"

docker build --no-cache --build-arg "VERSION=$version" \
    --label "org.opencontainers.image.source=https://github.com/korylprince/kmfddm-docker" \
    --label "org.opencontainers.image.title=kmfddm-docker" \
    --tag "$tag:$version" .

docker push "$tag:$version"

if [ "$2" = "latest" ]; then
    docker tag "$tag:$version" "$tag:latest"
    docker push "$tag:latest"
fi
