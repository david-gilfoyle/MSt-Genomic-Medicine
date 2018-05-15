#!/bin/bash
# s01_merge_vcfs_kgen_ddr_picard.sh

# Started: David Gilfoyle 20Apr2018
# Last updated: David Gilfoyle 20Apr2018

# Use:
# ./s01_merge_vcfs_kgen_ddr_picard.sh &> s01_merge_vcfs_kgen_ddr_picard.log

# Merge of 1000 Genome Project Genotype VCF Files (Selected DNA Repair Genes)
# Requires Picard (using version 2.18.2)

# Information about Picard MergeVcfs:
# https://software.broadinstitute.org/gatk/documentation/tooldocs/current/picard_vcf_MergeVcfs.php

# Starting script
echo "Starting s01_merge_vcfs_kgen_picard.sh"
date
echo ""

# Stop at runtime errors
set -e

# Tools, resources, files
base_folder="/home/ec2-user"
picard_tool="${base_folder}/tools/picard"
kgen_results="${base_folder}/results/preprocessed/kgen"

# Merging 1000 Genome Project VCF files (Selected DNA Repair Genes)
# Omitting Chromosome 21 and Y which do not contain selected DNA repair genes
java -jar "${picard_tool}"/picard.jar MergeVcfs \
I="${kgen_results}"/s01_ddr_kgen_chr1_raw.vcf \
I="${kgen_results}"/s01_ddr_kgen_chr2_raw.vcf \
I="${kgen_results}"/s01_ddr_kgen_chr3_raw.vcf \
I="${kgen_results}"/s01_ddr_kgen_chr4_raw.vcf \
I="${kgen_results}"/s01_ddr_kgen_chr5_raw.vcf \
I="${kgen_results}"/s01_ddr_kgen_chr6_raw.vcf \
I="${kgen_results}"/s01_ddr_kgen_chr7_raw.vcf \
I="${kgen_results}"/s01_ddr_kgen_chr8_raw.vcf \
I="${kgen_results}"/s01_ddr_kgen_chr9_raw.vcf \
I="${kgen_results}"/s01_ddr_kgen_chr10_raw.vcf \
I="${kgen_results}"/s01_ddr_kgen_chr11_raw.vcf \
I="${kgen_results}"/s01_ddr_kgen_chr12_raw.vcf \
I="${kgen_results}"/s01_ddr_kgen_chr13_raw.vcf \
I="${kgen_results}"/s01_ddr_kgen_chr14_raw.vcf \
I="${kgen_results}"/s01_ddr_kgen_chr15_raw.vcf \
I="${kgen_results}"/s01_ddr_kgen_chr16_raw.vcf \
I="${kgen_results}"/s01_ddr_kgen_chr17_raw.vcf \
I="${kgen_results}"/s01_ddr_kgen_chr18_raw.vcf \
I="${kgen_results}"/s01_ddr_kgen_chr19_raw.vcf \
I="${kgen_results}"/s01_ddr_kgen_chr20_raw.vcf \
I="${kgen_results}"/s01_ddr_kgen_chr22_raw.vcf \
I="${kgen_results}"/s01_ddr_kgen_chrX_raw.vcf \
O="${kgen_results}"/s01_ddr_kgen_merged_raw.vcf.gz

# Finishing script
echo "Finishing s01_merge_vcfs_kgen_picard.sh"
date
echo ""

