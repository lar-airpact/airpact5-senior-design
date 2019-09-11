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