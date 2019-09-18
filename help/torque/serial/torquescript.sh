#!/bin/bash

#PBS -V

#PBS -N bluesky_test

## Define compute options
#PBS -l nodes=1:dev:amd:ppn=4
  ##PBS -l nodes=1:dev:intel:ppn=4
#PBS -l mem=16gb
#PBS -l walltime=01:00:00
#PBS -q batch

## Define path for output & error logs
#PBS -k o
  ##PBS -j oe
#PBS -e /fastscratch/klitte/bluesky_test.e
#PBS -o /fastscratch/klitte/bluesky_test.o

## Define path for reporting
#PBS -M kyler.little@wsu.edu
#PBS -m abe


# Hello world
echo "Hello world!"