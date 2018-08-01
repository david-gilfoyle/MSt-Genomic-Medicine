#!/bin/bash
# s01_sort_merge_NA19908_ddr_control_kgen.sh

# Started: David Gilfoyle 27May2018
# Last updated: David Gilfoyle 27May2018

# Use:
# ./s01_sort_merge_NA19908_ddr_control_kgen.sh &> s01_sort_merge_NA19908_ddr_control_kgen.log

# Sorting and Remerging of VCF Files for Selected DDR Control Individuals from 1000 Genome Project (Genotype VCF Files)

# The initial merging of VCF files from control subject NA19908 failed during chromosome 7
# This script sorts the chromosome 7 VCF file before remerging

# Information about Picard SortVcf and MergeVcfs:
# http://broadinstitute.github.io/picard/command-line-overview.html#SortVcf
# https://software.broadinstitute.org/gatk/documentation/tooldocs/current/picard_vcf_MergeVcfs.php

# Starting script
echo "Starting s01_sort_merge_NA19908_ddr_control_kgen.sh"
date
echo ""

# Stop at runtime errors
set -e

# Set 1000 Genomes Project Individual ID
individual_id="NA19908"

# Tools, resources, files
base_folder="/home/ec2-user"
picard_tool="${base_folder}/tools/picard"
input_folder="${base_folder}/results/data_analysis/gt_individuals/kgen/ddr_control/${individual_id}"

# VCF File Sorting Using Picard
echo ""
echo "Sorting individual genotype VCF file (chromosome 7) from 1000 Genome Project"
date

java -jar "${picard_tool}"/picard.jar SortVcf \
	I="${input_folder}"/s01_${individual_id}_ddr_control_kgen_chr7_raw.vcf \
	O="${input_folder}"/s01_${individual_id}_ddr_control_kgen_chr7_raw_sorted.vcf

# Merging 1000 Genome Individual Genotype VCF files
echo ""
echo "Merging DDR control individual genotype VCF files (including sorted chromosome 7) from 1000 Genome Project"
date

java -jar "${picard_tool}"/picard.jar MergeVcfs \
I="${input_folder}"/s01_${individual_id}_ddr_control_kgen_chr1_raw.vcf \
I="${input_folder}"/s01_${individual_id}_ddr_control_kgen_chr2_raw.vcf \
I="${input_folder}"/s01_${individual_id}_ddr_control_kgen_chr3_raw.vcf \
I="${input_folder}"/s01_${individual_id}_ddr_control_kgen_chr4_raw.vcf \
I="${input_folder}"/s01_${individual_id}_ddr_control_kgen_chr5_raw.vcf \
I="${input_folder}"/s01_${individual_id}_ddr_control_kgen_chr6_raw.vcf \
I="${input_folder}"/s01_${individual_id}_ddr_control_kgen_chr7_raw_sorted.vcf \
I="${input_folder}"/s01_${individual_id}_ddr_control_kgen_chr8_raw.vcf \
I="${input_folder}"/s01_${individual_id}_ddr_control_kgen_chr9_raw.vcf \
I="${input_folder}"/s01_${individual_id}_ddr_control_kgen_chr10_raw.vcf \
I="${input_folder}"/s01_${individual_id}_ddr_control_kgen_chr11_raw.vcf \
I="${input_folder}"/s01_${individual_id}_ddr_control_kgen_chr12_raw.vcf \
I="${input_folder}"/s01_${individual_id}_ddr_control_kgen_chr13_raw.vcf \
I="${input_folder}"/s01_${individual_id}_ddr_control_kgen_chr14_raw.vcf \
I="${input_folder}"/s01_${individual_id}_ddr_control_kgen_chr15_raw.vcf \
I="${input_folder}"/s01_${individual_id}_ddr_control_kgen_chr16_raw.vcf \
I="${input_folder}"/s01_${individual_id}_ddr_control_kgen_chr17_raw.vcf \
I="${input_folder}"/s01_${individual_id}_ddr_control_kgen_chr18_raw.vcf \
I="${input_folder}"/s01_${individual_id}_ddr_control_kgen_chr19_raw.vcf \
I="${input_folder}"/s01_${individual_id}_ddr_control_kgen_chr20_raw.vcf \
I="${input_folder}"/s01_${individual_id}_ddr_control_kgen_chr21_raw.vcf \
I="${input_folder}"/s01_${individual_id}_ddr_control_kgen_chr22_raw.vcf \
I="${input_folder}"/s01_${individual_id}_ddr_control_kgen_chrX_raw.vcf \
O="${input_folder}"/s01_${individual_id}_ddr_control_kgen_merged_raw.vcf.gz

# Finishing script
echo "Completed s01_sort_merge_NA19908_ddr_control_kgen.sh"
date
echo ""
