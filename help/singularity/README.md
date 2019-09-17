# How To

## Description

Builds a basic singularity image from Docker ([note that bash is required to exist in the Docker Image](https://github.com/sylabs/singularity/issues/2386) -- great design guys), runs its, and executes a basic hello world program.

## Usage (MacOS)

1. Download the beta version of [Singularity Desktop for macOS](https://sylabs.io/singularity-desktop-macos/).
1. Create an API key [here](https://cloud.sylabs.io/auth).
1. Run `mv ~/Downloads/sylabs-token ~/.singularity/`
1. `./hello-world.sh`

## Usage (Aeolus HPCC)

1. `./hello-world.sh`

## Slater Addon to Run Singularity (once you have the bluesky.sif file)

- **Running on Aeolus**
- From the help/singularity/ directory: `scp bluesky.sif YOURUSERNAME@aeolus.wsu.edu:/home/YOURUSERNAME`
- `scp 1-fire-24hr-20140530-CA-post-ingestion.json YOURUSERNAME@aeolus.wsu.edu:/home/YOURUSERNAME`
- Within Aeolus, go into your directory:
- `module load go/1.11.5`
- `module load singularity/3.0.3/go/1.11.5`
- `singularity shell bluesky.sif`
- Finally: `bsp -i 1-fire-24hr-20140530-CA-post-ingestion.json fuelbeds consumption emissions > test_csv_output.csv`

- The directory _bluesky_comparisons_4.1.2_v_4.1.11_ holds data for actual input/output data from pnwairfire which is found [here](https://github.com/pnwairfire/bluesky/blob/master/docs/examples.md). This data is for version 4.1.2 of bluesky but the numbers matchup accordingly.

$$
$$
