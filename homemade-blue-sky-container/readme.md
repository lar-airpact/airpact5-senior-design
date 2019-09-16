# BlueSky Docker-ization Guide

## Update the BlueSky Docker Image
First, hopefully you've [copied the Bluesky files to this directory](/help/scp/readme.md). Next, you can simply run:
```
./rebuild_docker.sh
```
This rebuilds the image locally, re-tags it, and re-pushes it to DockerHub.

## Run the BlueSky Docker Container
```
./run_docker.sh
```
This pulls down the image from DockerHub and runs it in interactive mode. You'll then have to kick off the BlueSky job by running the script like so:
```
./BSF_EFO_AP5_SFonly.csh %YYYY%MM%DD
```
where obviously the argument passed to the script is a formatted date.


## BlueSky Baby
- Input can be found [here](http://128.208.123.111/smartfire/streams/realtime).
- You input a date as YYYYMMDD (same as Aeolus)
- 
- Out