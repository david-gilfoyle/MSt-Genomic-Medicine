#!/bin/bash

# s02_wget_1kg_genotypes.sh
# Using wget to download 1000 genome project dataset
# Approximate download time 160 minutes (2.7 hours)

# Started: David Gilfoyle 14Mar2018
# Last updated: David Gilfoyle 24Mar2018

# Use:
# ./s02_wget_1kg_full_download.sh &> s02_wget_1kg_full_download.log

# Stop at runtime errors
set -e

# Start message
echo "Using wget to download 1000 genome project dataset"
date
echo ""

# Compile file names
# File names were obtained on 14Mar2018 from 
# http://www.internationalgenome.org/data#download

base_address="http://ftp.1000genomes.ebi.ac.uk/vol1/ftp/release/20130502"

annotations_file="${base_address}/integrated_call_samples_v3.20130502.ALL.panel"

pedegree_file="${base_address}/integrated_call_samples_v2.20130502.ALL.ped"

sites_vcf="${base_address}/ALL.wgs.phase3_shapeit2_mvncall_integrated_v5b.20130502.sites.vcf.gz" # 1.98GB
sites_vcf_ind="${sites_vcf}.tbi"

genotypes_vcf_chr1="${base_address}/ALL.chr1.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz" # 1.32GB
genotypes_vcf_chr1_ind="${genotypes_vcf_chr1}.tbi"

genotypes_vcf_chr2="${base_address}/ALL.chr2.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz" # 1.43GB
genotypes_vcf_chr2_ind="${genotypes_vcf_chr2}.tbi"

genotypes_vcf_chr3="${base_address}/ALL.chr3.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz" # 1.19GB
genotypes_vcf_chr3_ind="${genotypes_vcf_chr3}.tbi"

genotypes_vcf_chr4="${base_address}/ALL.chr4.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz" # 1.19GB
genotypes_vcf_chr4_ind="${genotypes_vcf_chr4}.tbi"

genotypes_vcf_chr5="${base_address}/ALL.chr5.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz" # 1.12GB
genotypes_vcf_chr5_ind="${genotypes_vcf_chr5}.tbi"

genotypes_vcf_chr6="${base_address}/ALL.chr6.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz" # 1.12GB
genotypes_vcf_chr6_ind="${genotypes_vcf_chr6}.tbi"

genotypes_vcf_chr7="${base_address}/ALL.chr7.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz" # 1.02GB
genotypes_vcf_chr7_ind="${genotypes_vcf_chr7}.tbi"

genotypes_vcf_chr8="${base_address}/ALL.chr8.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz" # 0.96GB
genotypes_vcf_chr8_ind="${genotypes_vcf_chr8}.tbi"

genotypes_vcf_chr9="${base_address}/ALL.chr9.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz" # 0.76GB
genotypes_vcf_chr9_ind="${genotypes_vcf_chr9}.tbi"

genotypes_vcf_chr10="${base_address}/ALL.chr10.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz" # 0.87GB
genotypes_vcf_chr10_ind="${genotypes_vcf_chr10}.tbi"

genotypes_vcf_chr11="${base_address}/ALL.chr11.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz" # 0.86GB
genotypes_vcf_chr11_ind="${genotypes_vcf_chr11}.tbi"

genotypes_vcf_chr12="${base_address}/ALL.chr12.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz" # 0.84GB
genotypes_vcf_chr12_ind="${genotypes_vcf_chr12}.tbi"

genotypes_vcf_chr13="${base_address}/ALL.chr13.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz" # 0.63GB
genotypes_vcf_chr13_ind="${genotypes_vcf_chr13}.tbi"

genotypes_vcf_chr14="${base_address}/ALL.chr14.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz" # 0.57GB
genotypes_vcf_chr14_ind="${genotypes_vcf_chr14}.tbi"

genotypes_vcf_chr15="${base_address}/ALL.chr15.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz" # 0.52GB
genotypes_vcf_chr15_ind="${genotypes_vcf_chr15}.tbi"

genotypes_vcf_chr16="${base_address}/ALL.chr16.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz" # 0.52GB
genotypes_vcf_chr16_ind="${genotypes_vcf_chr16}.tbi"

genotypes_vcf_chr17="${base_address}/ALL.chr17.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz" # 0.49GB
genotypes_vcf_chr17_ind="${genotypes_vcf_chr17}.tbi"

genotypes_vcf_chr18="${base_address}/ALL.chr18.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz" # 0.49GB
genotypes_vcf_chr18_ind="${genotypes_vcf_chr18}.tbi"

genotypes_vcf_chr19="${base_address}/ALL.chr19.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz" # 0.38GB
genotypes_vcf_chr19_ind="${genotypes_vcf_chr19}.tbi"

genotypes_vcf_chr20="${base_address}/ALL.chr20.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz" # 0.38GB
genotypes_vcf_chr20_ind="${genotypes_vcf_chr20}.tbi"

genotypes_vcf_chr21="${base_address}/ALL.chr21.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz" # 0.24GB
genotypes_vcf_chr21_ind="${genotypes_vcf_chr21}.tbi"

genotypes_vcf_chr22="${base_address}/ALL.chr22.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz" # 0.24GB
genotypes_vcf_chr22_ind="${genotypes_vcf_chr22}.tbi"

genotypes_vcf_chrX="${base_address}/ALL.chrX.phase3_shapeit2_mvncall_integrated_v1b.20130502.genotypes.vcf.gz" # 1.95GB
genotypes_vcf_chrX_ind="${genotypes_vcf_chrX}.tbi"

genotypes_vcf_chrY="${base_address}/ALL.chrY.phase3_integrated_v2a.20130502.genotypes.vcf.gz" # 0.01GB
genotypes_vcf_chrY_ind="${genotypes_vcf_chrY}.tbi"

target_folder="/home/ec2-user/resources/kgen/source"

# Progress report
echo "Files to download:"
echo "annotations_file: ${annotations_file}"
echo "pedegree_file: ${pedegree_file}"
echo "sites_vcf: ${sites_vcf}"
echo "sites_vcf_ind: ${sites_vcf_ind}"
echo "genotypes_vcf_chr1: ${genotypes_vcf_chr1}"
echo "genotypes_vcf_chr1_ind: ${genotypes_vcf_chr1_ind}"
echo "genotypes_vcf_chr2: ${genotypes_vcf_chr2}"
echo "genotypes_vcf_chr2_ind: ${genotypes_vcf_chr2_ind}"
echo "genotypes_vcf_chr3: ${genotypes_vcf_chr3}"
echo "genotypes_vcf_chr3_ind: ${genotypes_vcf_chr3_ind}"
echo "genotypes_vcf_chr4: ${genotypes_vcf_chr4}"
echo "genotypes_vcf_chr4_ind: ${genotypes_vcf_chr4_ind}"
echo "genotypes_vcf_chr5: ${genotypes_vcf_chr5}"
echo "genotypes_vcf_chr5_ind: ${genotypes_vcf_chr5_ind}"
echo "genotypes_vcf_chr6: ${genotypes_vcf_chr6}"
echo "genotypes_vcf_chr6_ind: ${genotypes_vcf_chr6_ind}"
echo "genotypes_vcf_chr7: ${genotypes_vcf_chr7}"
echo "genotypes_vcf_chr7_ind: ${genotypes_vcf_chr7_ind}"
echo "genotypes_vcf_chr8: ${genotypes_vcf_chr8}"
echo "genotypes_vcf_chr8_ind: ${genotypes_vcf_chr8_ind}"
echo "genotypes_vcf_chr9: ${genotypes_vcf_chr9}"
echo "genotypes_vcf_chr9_ind: ${genotypes_vcf_chr9_ind}"
echo "genotypes_vcf_chr10: ${genotypes_vcf_chr10}"
echo "genotypes_vcf_chr10_ind: ${genotypes_vcf_chr10_ind}"
echo "genotypes_vcf_chr11: ${genotypes_vcf_chr11}"
echo "genotypes_vcf_chr11_ind: ${genotypes_vcf_chr11_ind}"
echo "genotypes_vcf_chr12: ${genotypes_vcf_chr12}"
echo "genotypes_vcf_chr12_ind: ${genotypes_vcf_chr12_ind}"
echo "genotypes_vcf_chr13: ${genotypes_vcf_chr13}"
echo "genotypes_vcf_chr13_ind: ${genotypes_vcf_chr13_ind}"
echo "genotypes_vcf_chr14: ${genotypes_vcf_chr14}"
echo "genotypes_vcf_chr14_ind: ${genotypes_vcf_chr14_ind}"
echo "genotypes_vcf_chr15: ${genotypes_vcf_chr15}"
echo "genotypes_vcf_chr15_ind: ${genotypes_vcf_chr15_ind}"
echo "genotypes_vcf_chr16: ${genotypes_vcf_chr16}"
echo "genotypes_vcf_chr16_ind: ${genotypes_vcf_chr16_ind}"
echo "genotypes_vcf_chr17: ${genotypes_vcf_chr17}"
echo "genotypes_vcf_chr17_ind: ${genotypes_vcf_chr17_ind}"
echo "genotypes_vcf_chr18: ${genotypes_vcf_chr18}"
echo "genotypes_vcf_chr18_ind: ${genotypes_vcf_chr18_ind}"
echo "genotypes_vcf_chr19: ${genotypes_vcf_chr19}"
echo "genotypes_vcf_chr19_ind: ${genotypes_vcf_chr19_ind}"
echo "genotypes_vcf_chr20: ${genotypes_vcf_chr20}"
echo "genotypes_vcf_chr20_ind: ${genotypes_vcf_chr20_ind}"
echo "genotypes_vcf_chr21: ${genotypes_vcf_chr21}"
echo "genotypes_vcf_chr21_ind: ${genotypes_vcf_chr21_ind}"
echo "genotypes_vcf_chr22: ${genotypes_vcf_chr22}"
echo "genotypes_vcf_chr22_ind: ${genotypes_vcf_chr22_ind}"
echo "genotypes_vcf_chrX: ${genotypes_vcf_chrX}"
echo "genotypes_vcf_chrX_ind: ${genotypes_vcf_chrX_ind}"
echo "genotypes_vcf_chrY: ${genotypes_vcf_chrY}"
echo "genotypes_vcf_chrY_ind: ${genotypes_vcf_chrY_ind}"
echo "README_known_issues_20160715"
echo "README_phase3_callset_20150220"
echo "README_phase3_chrY_calls_20141104"
echo "README_vcf_info_annotation.20141104"
echo ""
echo "Target folder:"
echo "${target_folder}"
echo ""

# Copy data
mkdir -p "${target_folder}" # prepare target folder
cd "${target_folder}" # go to the target folder
wget -nv "${annotations_file}"
wget -nv "${pedegree_file}"
wget -nv "${sites_vcf}" # up to 10 min
wget -nv "${sites_vcf_ind}"
wget -nv "${genotypes_vcf_chr1}" # up to 10 min
wget -nv "${genotypes_vcf_chr1_ind}"
wget -nv "${genotypes_vcf_chr2}" # up to 10 min
wget -nv "${genotypes_vcf_chr2_ind}"
wget -nv "${genotypes_vcf_chr3}" # up to 9 min
wget -nv "${genotypes_vcf_chr3_ind}"
wget -nv "${genotypes_vcf_chr4}" # up to 9 min
wget -nv "${genotypes_vcf_chr4_ind}"
wget -nv "${genotypes_vcf_chr5}" # up to 8 min
wget -nv "${genotypes_vcf_chr5_ind}"
wget -nv "${genotypes_vcf_chr6}" # up to 8 min
wget -nv "${genotypes_vcf_chr6_ind}"
wget -nv "${genotypes_vcf_chr7}" # up to 8 min
wget -nv "${genotypes_vcf_chr7_ind}"
wget -nv "${genotypes_vcf_chr8}" # up to 8 min
wget -nv "${genotypes_vcf_chr8_ind}"
wget -nv "${genotypes_vcf_chr9}" # up to 6 min
wget -nv "${genotypes_vcf_chr9_ind}"
wget -nv "${genotypes_vcf_chr10}" # up to 6 min
wget -nv "${genotypes_vcf_chr10_ind}"
wget -nv "${genotypes_vcf_chr11}" # up to 6 min
wget -nv "${genotypes_vcf_chr11_ind}"
wget -nv "${genotypes_vcf_chr12}" # up to 6 min
wget -nv "${genotypes_vcf_chr12_ind}"
wget -nv "${genotypes_vcf_chr13}" # up to 5 min
wget -nv "${genotypes_vcf_chr13_ind}"
wget -nv "${genotypes_vcf_chr14}" # up to 5 min
wget -nv "${genotypes_vcf_chr14_ind}"
wget -nv "${genotypes_vcf_chr15}" # up to 5 min
wget -nv "${genotypes_vcf_chr15_ind}"
wget -nv "${genotypes_vcf_chr16}" # up to 5 min
wget -nv "${genotypes_vcf_chr16_ind}"
wget -nv "${genotypes_vcf_chr17}" # up to 4 min
wget -nv "${genotypes_vcf_chr17_ind}"
wget -nv "${genotypes_vcf_chr18}" # up to 4 min
wget -nv "${genotypes_vcf_chr18_ind}"
wget -nv "${genotypes_vcf_chr19}" # up to 4 min
wget -nv "${genotypes_vcf_chr19_ind}"
wget -nv "${genotypes_vcf_chr20}" # up to 4 min
wget -nv "${genotypes_vcf_chr20_ind}"
wget -nv "${genotypes_vcf_chr21}" # up to 2 min
wget -nv "${genotypes_vcf_chr21_ind}"
wget -nv "${genotypes_vcf_chr22}" # up to 2 min
wget -nv "${genotypes_vcf_chr22_ind}"
wget -nv "${genotypes_vcf_chrX}" # up to 15 min
wget -nv "${genotypes_vcf_chrX_ind}"
wget -nv "${genotypes_vcf_chrY}" # up to 1 min
wget -nv "${genotypes_vcf_chrY_ind}"
wget -nv "${base_address}/README_known_issues_20160715"
wget -nv "${base_address}/README_phase3_callset_20150220"
wget -nv "${base_address}/README_phase3_chrY_calls_20141104"
wget -nv "${base_address}/README_vcf_info_annotation.20141104"

# Completion message
echo "Copied all files"
date
echo ""
