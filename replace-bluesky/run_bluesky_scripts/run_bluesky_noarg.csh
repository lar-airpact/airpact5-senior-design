#!/bin/csh -fX
#
# Example of using this script:
# 
#   > run_bluesky_noarg.csh
#
# Author: Farren L Herron-Thorpe 
#  Description:
#
#       This script runs with no argument and is set to run daily in crontab.
#       This script calls the BlueSky script on aeolus virtual server
#       using 'tomorrow' as the date argument to pass to BlueSky. 
#
#       JKV added rm -f on transfer/* dir to avoid any spurious effects from another version of this script being 
#       run for purposes of exploring docker containerizaton using the bluesky scripting as a test code. 082819.
#
date

   set day   = `perl -e 'printf "%d\n", (gmtime(time()))[3]'` #This should give "Tomorrow" in local time since cron runs at 10 pm PST.
   set month = `perl -e 'printf "%d\n", (gmtime(time()))[4]+1'`#format month (January = 0)
   set year  = `perl -e 'printf "%d\n", (gmtime(time()))[5]+1900'`#format year

 if ( $month < 10 ) set month = 0${month}
 if ( $day < 10 ) set day = 0${day}

        set YMD=${year}${month}${day};
   rm -f ~/AIRHOME/run_ap5_day1/emis/fire_orl/transfer/*
   mkdir -p /data/lar/projects/airpact5/AIRRUN/${year}/${YMD}00/EMISSION/fire/bluesky
   mkdir -p /data/lar/projects/airpact5/AIRRUN/${year}/${YMD}00/LOGS
   setenv bluenode 10.1.1.28
   ssh $bluenode "/opt/bluesky/bluesky_3.5.1/BSF_EFO_AP5_SFonly.csh ${YMD}" >&! /data/lar/projects/airpact5/AIRRUN/${year}/${YMD}00/LOGS/bluesky_cron.log
   mv ~/AIRHOME/run_ap5_day1/emis/fire_orl/transfer/bluesky_job.log /data/lar/projects/airpact5/AIRRUN/${year}/${YMD}00/LOGS/
   mv ~/AIRHOME/run_ap5_day1/emis/fire_orl/transfer/* /data/lar/projects/airpact5/AIRRUN/${year}/${YMD}00/EMISSION/fire/bluesky/

date

exit(0)

