#!/bin/bash

# Usage:
# <build_bs_sf.sh>

export BLUESKY_VERSION_TAG=latest

if [[ hostname == "aeolus.wsu.edu" ]]; then
    echo "Loading go and singularity modulefiles into shell environment"
    module load go/1.11.5
    module load singularity/3.0.3/go/1.11.5
fi

# Mac OS singularity only supports remote builds
if [[ "$OSTYPE" == "darwin"* ]]; then
    export REMOTE_BUILD="--remote"
fi

echo "Creating Bluesky singularity image from Docker Image -- tag=${BLUESKY_VERSION_TAG}"
singularity build $REMOTE_BUILD bluesky.sif docker://larairpact/bluesky-framework:$BLUESKY_VERSION_TAG
echo "Done creating bluesky singularity image from Docker image"
