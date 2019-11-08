#!/bin/csh

#PBS -V

## Define a job name
#PBS -N bluesky_framework_torque

## Define compute options
#PBS -l nodes=1:dev:amd:ppn=4
  ##PBS -l nodes=1:dev:intel:ppn=4
#PBS -l mem=16gb
#PBS -l walltime=01:00:00
#PBS -q batch

# Run Singularity Container
csh run_bluesky_sif.csh $YMD
