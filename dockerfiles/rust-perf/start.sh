#!/bin/bash

# Helper script to start the rust-perf container securely, see: https://github.com/moby/moby/blob/master/profiles/seccomp/default.json
docker run \
    -ti \
    -u dev \
    --rm \
    --cap-drop=all \
    --security-opt no-new-privileges \
    --read-only \
    --cpus 4 \
    --memory=4g \
    --memory-swap=4g \
    --security-opt seccomp=seccomp-perf.json \
    perf-rust -- /bin/sh
