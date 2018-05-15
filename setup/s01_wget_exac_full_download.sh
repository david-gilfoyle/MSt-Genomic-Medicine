#!/bin/bash
# s01_wget_exac_full_download.sh

# Started: David Gilfoyle 14Mar2018
# Last updated : David Gilfoyle 14Mar2018

# Use:
# ./s01_wget_exac_full_download.sh &> s01_wget_exac_full_download.log

# Stop at runtime errors
set -e

# Start message
echo "Using wget to download ExAC version 1 dataset (including non-TCGA subset)"
date
echo ""

# File names were obtained on 14Mar2018 from 
# http://exac.broadinstitute.org/downloads via Google Cloud SDK

base_exac_folder="ftp://ftp.broadinstitute.org/pub/ExAC_release/release1"
base_rds_folder="/home/ec2-user"

# Download ExAC v1 (including non-TCGA subset)
echo "Downloading ExAC v1 (including non-TCGA subset)"
echo ""
echo "Files to download"
echo "${base_exac_folder}/ExAC.r1.sites.vep.vcf.gz" # 5.4GB
echo "${base_exac_folder}/ExAC.r1.sites.vep.vcf.gz.tbi"
echo "${base_exac_folder}/subsets/ExAC_nonTCGA.r1.sites.vep.vcf.gz" # 5.0GB
echo "${base_exac_folder}/subsets/ExAC_nonTCGA.r1.sites.vep.vcf.gz.tbi"
echo "${base_exac_folder}/README.ftp_structure"
echo "${base_exac_folder}/README.histogram_annotation"
echo "${base_exac_folder}/README.known_issues"
echo "${base_exac_folder}/README.new_annotations"
echo "${base_exac_folder}/README.population_annotations"
echo "${base_exac_folder}/README.release1"
echo "${base_exac_folder}/README.VEP_annotations" 
echo ""
echo "Target folder:"
echo "${base_rds_folder}/resources/exac_v1"

mkdir -p "${base_rds_folder}/resources/exac_v1"
cd "${base_rds_folder}/resources/exac_v1"

wget -nv "${base_exac_folder}/ExAC.r1.sites.vep.vcf.gz"
wget -nv "${base_exac_folder}/ExAC.r1.sites.vep.vcf.gz.tbi"
wget -nv "${base_exac_folder}/subsets/ExAC_nonTCGA.r1.sites.vep.vcf.gz" 
wget -nv "${base_exac_folder}/subsets/ExAC_nonTCGA.r1.sites.vep.vcf.gz.tbi"
wget -nv "${base_exac_folder}/README.ftp_structure"
wget -nv "${base_exac_folder}/README.histogram_annotation"
wget -nv "${base_exac_folder}/README.known_issues"
wget -nv "${base_exac_folder}/README.new_annotations"
wget -nv "${base_exac_folder}/README.population_annotations"
wget -nv "${base_exac_folder}/README.release1"
wget -nv "${base_exac_folder}/README.VEP_annotations"

# Completion message
echo ""
echo "Completed downloading all data"
date
echo ""
