#!/bin/sh

COMMIT_ID=$1
if [ -z "$COMMIT_ID" ]; then
    echo "Usage: ./bootstrap.sh <commit-id>"
    exit 1
fi
docker run -it runtimeverificationinc/kframework-k:ubuntu-focal-$COMMIT_ID
