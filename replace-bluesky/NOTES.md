## Notes

#### Get the Image
```
docker pull larairpact/bluesky-framework
docker run -ti larairpact/bluesky-framework
```

#### Run the Container
* run the container
```
./bluesky -d 2019090100Z -K no-archive defaultLAR_SFonly
```

#### TODOs
* replace the above call with a call to ```BSF_EFO_AP5_SFonly.csh``` so that the following python scripts work (will probably need to edit the hardcoded paths and what not...)
  * fire_ptday_SFonly_Zhang.py
  * fire_ptinv_SFonly_Zhang.py
  * write_kml.py
* if running NOT on Aeolus, don't do anything with the output. Otherwise, get the output from the container and put it where Aeolus expects. Should be able to write directly to the host's file system using Singularity.