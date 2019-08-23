# BlueSky Docker-ization Guide

## Update the BlueSky Docker Image
First, hopefully you've [copied the Bluesky files to this directory](#copy-bluesky). Next, you can simply run:
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

## Copying Files From BlueSky to Your Computer <a name="copy-bluesky"></a>
1. Open two terminals to this directory. Set up environment variables in both terminals. Make sure to change to your username.
```
export AEOLUSHPCC=aeolus.wsu.edu
export BSUSER=klitte
export UNUSED_PORT_ON_AEOLUS=17196
export SCP_PORT=22
export BLUENODE=10.1.1.28
```
2. In terminal #1, run:
```
./create_ssh_tunnel.sh
```
3. In terminal #2, run:
```
./get_blue_sky_files.sh
```

4. In terminal #1, end ```cat``` command with a Ctrl+D or Ctrl+C.