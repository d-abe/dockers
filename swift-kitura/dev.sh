#!/bin/bash

set -eu

if [ -z "$PROJECT_NAME" ]; then
    echo >&2 'PROJECT_NAME is not specified!'
    exit 1
fi

if [ -z "$WORKING_DIR" ]; then
    echo >&2 'WORKING_DIR is not specified!'
    exit 1
fi

# nfsやVMの共有フォルダだとサブディレクトリが認識されないのでコピーする
cp -rf * /work

cd /work

make

set +e
if [ -e ".build/debug/spectre-build" ]; then
    .build/debug/spectre-build
fi
set -e

gulp watch
