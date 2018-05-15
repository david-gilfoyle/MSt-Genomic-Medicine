#!/bin/bash

# s01_wget_ccds_download.sh
# Using wget to download current CCDS dataset for GRCh37 Genome Build

# Started: David Gilfoyle 7May2018
# Last updated: David Gilfoyle 7May2018

# Use:
# ./s01_wget_ccds_download.sh &> s01_wget_ccds_download.log

# Stop at runtime errors
set -e

# Start message
echo "Using wget to download CCDS dataset for GRCh37 Genome Build"
date
echo ""

# Compile file names
# File names were obtained on 7May2018 from 
# ftp://ftp.ncbi.nlm.nih.gov/pub/CCDS/

download_file="ftp://ftp.ncbi.nlm.nih.gov/pub/CCDS//archive/15/CCDS.current.txt"
target_folder="/home/ec2-user/resources/ccds"

# Progress report
echo "Target folder:"
echo "${target_folder}"
echo ""

# Copy data
mkdir -p "${target_folder}" # prepare target folder
cd "${target_folder}" # go to the target folder
wget -nv "${download_file}"

# Completion message
echo "Copied all files"
date
echo ""
