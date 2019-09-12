# How To

## Description
Builds a basic singularity image from Docker ([note that bash is required to exist in the Docker Image](https://github.com/sylabs/singularity/issues/2386) -- great design guys), runs its, and executes a basic hello world program.

## Usage (MacOS)
1. Download the beta version of [Singularity Desktop for macOS](https://sylabs.io/singularity-desktop-macos/).
1. Create an API key [here](https://cloud.sylabs.io/auth).
1. Run ```mv ~/Downloads/sylabs-token ~/.singularity/```
1. ```./hello-world.sh```

## Usage (Aeolus HPCC)
1. ```./hello-world.sh```

## Slater Addon to Run Singularity (once you have the bluesky.sif file)
* ```singularity shell bluesky.sif```
* ```bsp -i 1-fire-24hr-20140530-CA-post-ingestion.json fuelbeds consumption emissions```

## Running on Aeolus and SCP
* To copy bluesky.sif (and other files by replacing bluesky.sif) to Aeolus Dir: ```scp bluesky.sif YOURUSERNAME@aeolus.wsu.edu/home/YOURUSERNAME```
* To get singularity on aeolus: ```module load go/1.11.5``` and ```module load singularity/3.0.3/go/1.11.5```
* To run with 1-fire json: ```singularity shell bluesky.sif``` and then ```bsp -i 1-fire-24hr-20140530-CA-post-ingestion.json fuelbeds consumption emissions``` > ACSVNAME.csv
* To run with realtime json: ```singularity shell bluesky.sif``` and then ```bsp -i realtime-fire-events20190901.json fuelbeds consumption emissions``` > ACSVNAME.csv

