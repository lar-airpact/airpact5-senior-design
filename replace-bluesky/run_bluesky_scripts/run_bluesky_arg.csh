#!/bin/csh -f
#
# Example of using this script:
# 
#   > run_bluesky_arg.csh YYYYMMDD
#
# Author: Farren L Herron-Thorpe 
#  Description:
#
#       This script calls the BlueSky script on aeolus virtual server
#       Update 06/26/18 JKV matching changes in the run_bluesky_noarg.csh script 

   set YMD = $1
   set year = `echo $YMD | cut -c1-4`
   mkdir -p /data/lar/projects/airpact5/AIRRUN/${year}/${YMD}00/EMISSION/fire/bluesky
   mkdir -p /data/lar/projects/airpact5/AIRRUN/${year}/${YMD}00/LOGS
   setenv bluenode 10.1.1.28
   ssh $bluenode "/opt/bluesky/bluesky_3.5.1/BSF_EFO_AP5_SFonly.csh ${YMD}" >&! /data/lar/projects/airpact5/AIRRUN/${year}/${YMD}00/LOGS/bluesky_cron.log
   mv ~/AIRHOME/run_ap5_day1/emis/fire_orl/transfer/bluesky_job.log /data/lar/projects/airpact5/AIRRUN/${year}/${YMD}00/LOGS/
   mv ~/AIRHOME/run_ap5_day1/emis/fire_orl/transfer/* /data/lar/projects/airpact5/AIRRUN/${year}/${YMD}00/EMISSION/fire/bluesky/
#   ssh $bluenode "/opt/bluesky/bluesky_3.5.1/BSF_EFO_AP5.csh ${1}" >&! ~airpact5/AIRHOME/run_ap5_day1/emis/fire_orl/bluesky_arg.log
#   mv ~/AIRHOME/run_ap5_day1/emis/fire_orl/transfer/bluesky_job.log /data/lar/projects/airpact5/AIRRUN/${year}/${YMD}00/LOGS/
#   mv ~/AIRHOME/run_ap5_day1/emis/fire_orl/transfer/* /data/lar/projects/airpact5/AIRRUN/${year}/${YMD}00/EMISSION/fire/bluesky/
	
exit(0)

