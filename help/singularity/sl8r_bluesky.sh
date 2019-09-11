#!/bin/bash

# Usage:
# <hello-world.sh> 

export IMAGE_NAME=pnwairfire/bluesky

if [[ hostname == "aeolus.wsu.edu" ]]; then
    echo "Loading go and singularity modulefiles into shell environment"
    module load go/1.11.5
    module load singularity/3.0.3/go/1.11.5
fi

# Mac OS singularity only supports remote builds
if [[ "$OSTYPE" == "darwin"* ]]; then
    export REMOTE_BUILD="--remote"
fi

# Build SIF file
singularity build $REMOTE_BUILD $IMAGE_NAME.sif docker://$IMAGE_NAME

# Run it
singularity exec $IMAGE_NAME.sif echo "running bluesky"