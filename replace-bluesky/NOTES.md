## Notes

#### Get the Image
```
docker pull pnwairfire/bluesky-framework
docker run -ti pnwairfire/bluesky-framework
```

#### Copy config file
```
export CONTAINER_ID=123456789
docker cp defaultLAR_SFonly.ini $CONTAINER_ID:/bluesky/dist/bluesky/setup/
```

#### Run the Container
* need to copy in the defaultLAR_SFonly.ini file into the container -- should just be there... I suppose we could fork the image
* run the container
```
/bluesky/dist/bluesky/base/lib/bluesky -d 2019090100Z -K no-archive defaultLAR_SFonly
```
* get the following python scripts to work (will need to edit the hardcoded paths and what not...)
  * fire_ptday_SFonly_Zhang.py
  * fire_ptinv_SFonly_Zhang.py
  * write_kml.py
* get the output from the container and put it where Aeolus expects...