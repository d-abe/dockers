#!/bin/bash

swift build
make

if [ -e ".build/debug/spectre-build" ]; then
    .build/debug/spectre-build
fi
