# Replace Ubuntu BlueSky Server (Aeolus) with BlueSky Framework Image

## How to Run/Test

#### Get the Docker Image
```
docker pull larairpact/bluesky-framework:latest
```

#### Get the Singularity Image
```
singularity pull shub://larairpact/bluesky-framework:latest
```

#### Run the Docker Container
```
docker exec larairpact/bluesky-framework:latest <YYYYMMDD>
```

#### Run the Singularity Container
Note that the script that runs the BlueSky Framework expects to be able to write its output data to the directory: ```~/AIRHOME/run_ap5_day1/emis/fire_orl/transfer```. This wasn't our choice, but it's where the next job of AIRPACT expects its data. Also, the script expects to be able to run a script that sets a fire season enviroment variable. This script doesn't actually do anything relevant to the output of the BlueSky Framework, but we wanted to keep it since it's not our job to delete it...

This is all to say that if you're not running this on Aeolus, make sure to run
```
mkdir -p ~/AIRHOME/run_ap5_day1/emis/fire_orl/transfer
touch ~/AIRHOME/run_ap5_day1/set_AIRPACT_fire_season.csh
```
before attempting to run this script.

Finally, to run the Singularity image, run
```
./run_bluesky_sif.sh <YYYYMMDD>
```
or if you like C Shell
```
./run_bluesky_sif.csh <YYYYMMDD>
```
or if you're on Aeolus
```
qsub -v YMD=<YYYYMMDD> run_bluesky_torque.csh
```

Why is this a call to a script rather than a ```singularity exec``` command, you ask? Because Singularity is dumb. To make a writeable Singularity image, it's a pain. The script we wrote creates a temporary non-overlay file system (fancy-speak for a set of directories on the host machine) and mounts these in to the Singularity container. This set of directories is very specific to what BlueSky Framework expects to be able to write data to.

## How We Built This
This is a story...

## How To Replace the SSH Call to the Ubuntu BlueSky Server (Aeolus) with the Call to Our BlueSky Framework Singularity Image
First, copy the important script (```run_bluesky_sif.csh```) to where you want it. I think the following will suffice:
```
cp /home/klitte/run_bluesky_sif.csh /home/airpact5/AIRHOME/run_ap5_day1/emis/
```

Find files:
- ```/home/airpact5/AIRHOME/run_ap5_day1/emis/fire_orl/run_bluesky_noarg.csh```
- ```/home/airpact5/AIRHOME/run_ap5_day1/emis/fire_orl/run_bluesky_arg.csh```

Replace line:
```
ssh $bluenode "/opt/bluesky/bluesky_3.5.1/BSF_EFO_AP5_SFonly.csh ${YMD}" >&! /data/lar/projects/airpact5/AIRRUN/${year}/${YMD}00/LOGS/bluesky_cron.log
```
with
```
/home/airpact5/AIRHOME/run_ap5_day1/emis/run_bluesky_sif.csh $YMD >&! /data/lar/projects/airpact5/AIRRUN/${year}/${YMD}00/LOGS/bluesky_cron.log
```