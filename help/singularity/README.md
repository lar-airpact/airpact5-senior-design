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
* ```
  echo '{
    "fire_information": [{
        "id": "SF11C14225236095807750",
        "event_of": {
            "id": "SF11E826544",
            "name": "Natural Fire near Snoqualmie Pass, WA"
        },
        "location": {
            "perimeter": {
                "type": "MultiPolygon",
                "coordinates": [
                    [
                        [
                            [-121.4522115, 47.4316976],
                            [-121.3990506, 47.4316976],
                            [-121.3990506, 47.4099293],
                            [-121.4522115, 47.4099293],
                            [-121.4522115, 47.4316976]
                        ]
                    ]
                ]
            },
            "ecoregion": "southern",
}' | bsp  fuelbeds consumption emissions
```