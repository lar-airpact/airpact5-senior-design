#!/bin/csh

# Example of using this script:
# 
#   > run_bluesky_sif.csh YYYYMMDD
#

# Since singularity images are immutable and BlueSky Framework
# image writes files, we need to mount in the directories that the
# image writes to from the host file system.
# In Docker, this is unnecessary since the top layer of a Docker
# image is writeable. This is a "hack" to create a writeable layer.
# In the future, we'd recommend looking into persistent overlays.

set GITHUB_ORG = 'lar-airpact'
set GITHUB_REPO = 'bluesky-framework'
set TAG = 'latest'
set BSF_OUTPUT_TEMP = 'bsf_output_temp/'
set BS_DIR = '/bluesky/dist/bluesky/'
set YMD = $1

# Declare an array of string with type
set directoriesWrittenTo=("output" "working" "log" "conversion/output")
 
# Create writeable directories on host filesystem
foreach writeableDir ( $directoriesWrittenTo )
   mkdir -p $BSF_OUTPUT_TEMP$writeableDir
end

# Load modules required to run Singularity
module purge
module list
module load singularity/3.4.2/go/1.11.5
module list

# Create command string to add bind mounts
set BIND_CMD = ''
set CWD = `pwd`
foreach writeableDir ( $directoriesWrittenTo )
   set BIND_CMD = "${BIND_CMD}--bind ${CWD}/${BSF_OUTPUT_TEMP}${writeableDir}:${BS_DIR}${writeableDir} "
end

# Pull the singularity image from "master" branch
# as built from https://github.com/lar-airpact/bluesky-framework
# F to overwrite existing (but still uses cache if unchanged)
singularity pull -F "shub://${GITHUB_ORG}/${GITHUB_REPO}:${TAG}"

# Execute BSF Singularity Image -- replacing Ubuntu Server :-)
set BSF_IMAGE_NAME = "${GITHUB_REPO}_${TAG}.sif"
singularity exec $BIND_CMD $BSF_IMAGE_NAME bash -c "${BS_DIR}BSF_EFO_AP5_SFonly.csh ${YMD}"

# echo command for debugging
echo "singularity exec $BIND_CMD $BSF_IMAGE_NAME ${BS_DIR}BSF_EFO_AP5_SFonly.csh ${YMD}"

# Remove hacked writeable layer
rm -rf $BSF_OUTPUT_TEMP
