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

BSF_IMAGE_NAME='bluesky.sif'
BSF_OUTPUT_TEMP='bsf_output_temp/'
BS_DIR='/bluesky/dist/bluesky/'
YMD=$1

# Declare an array of string with type
declare -a directoriesWrittenTo=("output" "working" "log" "conversion")
 
# Create writeable directories on host filesystem
for writeableDir in ${directoriesWrittenTo[@]}; do
   mkdir -p $BSF_OUTPUT_TEMP$writeableDir
done

# Load modules required to run Singularity
module load go/1.11.5
module load singularity/3.0.3/go/1.11.5

# Create command string to add bind mounts
for writeableDir in ${directoriesWrittenTo[@]}; do
   echo $BSF_OUTPUT_TEMP$writeableDir
   BIND_CMD=$BIND_CMD"--bind $(pwd)/${BSF_OUTPUT_TEMP}${writeableDir}:${BS_DIR}${writeableDir} "
done

# Pull the singularity image from "master" branch
# as built from https://github.com/lar-airpact/bluesky-framework
singularity pull shub://lar-airpact/bluesky-framework:latest

# Execute BSF Singularity Image -- replacing Ubuntu Server :-)
singularity exec $BIND_CMD $BSF_IMAGE_NAME "${BS_DIR}BSF_EFO_AP5_SFonly.csh ${YMD}00Z"

# Remove hacked writeable layer
rm -rf $BSF_OUTPUT_TEMP