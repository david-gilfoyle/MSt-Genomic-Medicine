#!/bin/bash
# s01_wget_b37_ref_genome_download.sh

# Started: David Gilfoyle 14Mar2018
# Last updated : David Gilfoyle 14Mar2018

# Use:
# ./s01_wget_b37_ref_genome_download.sh &> s01_wget_b37_ref_genome_download.log

# Stop at runtime errors
set -e

# Start message
echo "Using wget to download GRCh37/hg19 Human Reference Genome"
date
echo ""

# File names were obtained on 24Mar2018 from 
# ftp://gsapubftp-anonymous@ftp.broadinstitute.org/bundle/

base_broad_folder="ftp://gsapubftp-anonymous@ftp.broadinstitute.org/bundle/"
base_rds_folder="/home/ec2-user"

# Download GRCh37/hg19 Human Reference Genome
echo "Downloading GRCh37/hg19 Human Reference Genome"
echo ""
echo "Files to download"
echo "${base_broad_folder}/b37/human_g1k_v37.dict.gz"
echo "${base_broad_folder}/b37/human_g1k_v37.dict.gz.md5"
echo "${base_broad_folder}/b37/human_g1k_v37.fasta.fai.gz"
echo "${base_broad_folder}/b37/human_g1k_v37.fasta.fai.gz.md5"
echo "${base_broad_folder}/b37/human_g1k_v37.fasta.gz"
echo "${base_broad_folder}/b37/human_g1k_v37.fasta.gz.md5"
echo ""
echo "Target folder:"
echo "${base_rds_folder}/resources/gatk_b37_bundle"

mkdir -p "${base_rds_folder}/resources/gatk_b37_bundle"
cd "${base_rds_folder}/resources/gatk_b37_bundle"

wget -nv "${base_broad_folder}/b37/human_g1k_v37.dict.gz"
wget -nv "${base_broad_folder}/b37/human_g1k_v37.dict.gz.md5"
wget -nv "${base_broad_folder}/b37/human_g1k_v37.fasta.fai.gz"
wget -nv "${base_broad_folder}/b37/human_g1k_v37.fasta.fai.gz.md5"
wget -nv "${base_broad_folder}/b37/human_g1k_v37.fasta.gz"
wget -nv "${base_broad_folder}/b37/human_g1k_v37.fasta.gz.md5"

# Check of md5 checksums
echo ""
echo "md5 checksums prior to and following transfer"
echo "human_g1k_v37.dict.gz.md5"
cat human_g1k_v37.dict.gz.md5
md5sum human_g1k_v37.dict.gz
echo ""
echo "human_g1k_v37.fasta.fai.gz.md5"
cat human_g1k_v37.fasta.fai.gz.md5
md5sum human_g1k_v37.fasta.fai.gz
echo ""
echo "human_g1k_v37.fasta.gz.md5"
cat human_g1k_v37.fasta.gz.md5
md5sum human_g1k_v37.fasta.gz

# Completion message
echo ""
echo "Completed downloading all data"
date
echo ""
