#!/bin/bash

set -eu

if [ -z "$PROJECT_NAME" ]; then
    echo >&2 'PROJECT_NAME is not specified!'
    exit 1
fi

mkdir /work
cp -rf * /work

cd /work

set +e
swift build
set -e

make
exec ".build/debug/${PROJECT_NAME}"
