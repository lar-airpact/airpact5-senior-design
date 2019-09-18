sudo -i
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
            "utc_offset": "-09:00"
        },
        "growth": [{
            "pct": 100,
            "start": "20150120",
            "end": "20150120"
        }]
    }]
}' | singularity exec bluesky.sif bsp fuelbeds consumption emissions

singularity shell bluesky.sif
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
            "utc_offset": "-09:00"
        },
        "growth": [{
            "pct": 100,
            "start": "20150120",
            "end": "20150120"
        }]
    }]
}' | bsp fuelbeds consumption emissions


