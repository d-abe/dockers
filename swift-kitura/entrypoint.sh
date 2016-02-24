#!/bin/bash

set -eu

if [ -z "$PROJECT_NAME" ]; then
    echo >&2 'PROJECT_NAME is not specified!'
    exit 1
fi

ln -s $(pwd)/Sources /work/Sources
ln -s $(pwd)/Tests /work/Tests
ln -s $(pwd)/Package.swift /work/Package.swift

cd /work

set +e
swift build
set -e

make
gulp watch
