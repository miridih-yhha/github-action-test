#!/bin/bash

VERSION=($(echo `cat version` | tr '.' ' '))
echo "MAJOR: ${VERSION[0]}"
echo "MINOR: ${VERSION[1]}"
echo "PATCH: ${VERSION[2]}"

if [ "$1" == "major" ]; then
    VERSION[0]=$((${VERSION[0]} + 1))
    VERSION[1]=0
    VERSION[2]=0
elif [ "$1" == "minor" ]; then
    VERSION[1]=$((${VERSION[1]} + 1))
    VERSION[2]=0
elif [ "$1" == "patch" ]; then
    VERSION[2]=$((${VERSION[2]} + 1))
else
    echo "Usage: upgrade-version.sh [major|minor|patch]"
    exit 1
fi

#echo "Version Upgrade `cat version` -> ${VERSION[0]}.${VERSION[1]}.${VERSION[2]}"
echo "${VERSION[0]}.${VERSION[1]}.${VERSION[2]}" > version
