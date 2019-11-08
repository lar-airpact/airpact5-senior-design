#!/bin/bash

# Example of using this script:
# 
#   > run_bluesky_sif.sh YYYYMMDD
#

# Since singularity images are immutable and BlueSky Framework
# image writes files, we need to mount in the directories that the
# image writes to from the host file system.
# In Docker, this is unnecessary since the top layer of a Docker
# image is writeable. This is a "hack" to create a writeable layer.
# In the future, we'd recommend looking into persistent overlays.

GITHUB_ORG='lar-airpact'
GITHUB_REPO='bluesky-framework'
TAG='latest'
BSF_OUTPUT_TEMP='bsf_output_temp/'
BS_DIR='/bluesky/dist/bluesky/'
YMD=$1

# Declare an array of string with type
declare -a directoriesWrittenTo=("output" "working" "log" "conversion")
 
# Create writeable directories on host filesystem
for writeableDir in ${directoriesWrittenTo[@]}; do
   mkdir -p $BSF_OUTPUT_TEMP$writeableDir
done

# Load modules required to run Singularity if on Aeolus
if [[ `hostname` == "aeolus.wsu.edu" ]]; then
   echo "Loading go and singularity modulefiles into shell environment"
   module purge
   module list
   module load singularity/3.4.2/go/1.11.5
   module list
fi

# Create command string to add bind mounts
for writeableDir in ${directoriesWrittenTo[@]}; do
   BIND_CMD=$BIND_CMD"--bind $(pwd)/${BSF_OUTPUT_TEMP}${writeableDir}:${BS_DIR}${writeableDir} "
done

echo $BIND_CMD

# Pull the singularity image from "master" branch
# as built from https://github.com/lar-airpact/bluesky-framework
# F to overwrite existing (but still uses cache if unchanged)
singularity pull -F "shub://${GITHUB_ORG}/${GITHUB_REPO}:${TAG}"

# Execute BSF Singularity Image -- replacing Ubuntu Server :-)
BSF_IMAGE_NAME="${GITHUB_REPO}_${TAG}.sif"
singularity exec $BIND_CMD $BSF_IMAGE_NAME "${BS_DIR}BSF_EFO_AP5_SFonly.csh ${YMD}"

# Remove hacked writeable layer
rm -rf $BSF_OUTPUT_TEMP