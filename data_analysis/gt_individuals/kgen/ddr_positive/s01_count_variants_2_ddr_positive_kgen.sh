#!/bin/bash
# s01_count_variants_2_ddr_positive_kgen.sh

# Started: David Gilfoyle 27May2018
# Last updated: David Gilfoyle 28May2018

# Use:
# ./s01_count_variants_2_ddr_positive_kgen.sh &> s01_count_variants_2_ddr_positive_kgen.log

# Counting Number of Variants in VCF Files for Selected DDR Positive Individuals from 1000 Genome Project (Genotype VCF Files)

# Information about GATK CountVariants:
# https://software.broadinstitute.org/gatk/documentation/tooldocs/current/org_broadinstitute_hellbender_tools_walkers_CountVariants.php

# Starting script
echo "Starting s01_count_variants_2_ddr_positive_kgen.sh"
date
echo ""

# Stop at runtime errors
set -e

# Tools, resources, files
base_folder="/home/ec2-user"
gatk4="${base_folder}/tools/gatk_4_0/gatk-4.0.2.1/"
input_folder="${base_folder}/results/data_analysis/gt_individuals/kgen/ddr_positive/"

#
# Count variants from Individual NA19131
echo ""
echo "DDR Positive Individual NA19131 (YRI (AFR))"
echo "1 homozygous and 1 heterozygous (benign) LoF variant"
echo ""
echo "Variant count using Grep -vc ^#"
echo ""

zgrep -vc ^# "${input_folder}"/NA19131/s01_NA19131_ddr_positive_kgen_merged_raw.vcf.gz

echo ""
echo "Variant count using GATK_4 Count Variants"
echo ""

"${gatk4}"gatk CountVariants \
	-V "${input_folder}"/NA19131/s01_NA19131_ddr_positive_kgen_merged_raw.vcf.gz

#
# Count variants from Individual HG01198
echo ""
echo "DDR Positive Individual HG01198 (PUR (AMR))"
echo "1 homozygous LoF variant"
echo ""
echo "Variant count using Grep -vc ^#"
echo ""

zgrep -vc ^# "${input_folder}"/HG01198/s01_HG01198_ddr_positive_kgen_merged_raw.vcf.gz

echo ""
echo "Variant count using GATK_4 Count Variants"
echo ""

"${gatk4}"gatk CountVariants \
	-V "${input_folder}"/HG01198/s01_HG01198_ddr_positive_kgen_merged_raw.vcf.gz

#
# Count variants from Individual HG02977
echo ""
echo "DDR Positive Individual HG02977 (ESN (AFR))"
echo "1 homozygous LoF variant"
echo ""
echo "Variant count using Grep -vc ^#"
echo ""

zgrep -vc ^# "${input_folder}"/HG02977/s01_HG02977_ddr_positive_kgen_merged_raw.vcf.gz

echo ""
echo "Variant count using GATK_4 Count Variants"
echo ""

"${gatk4}"gatk CountVariants \
	-V "${input_folder}"/HG02977/s01_HG02977_ddr_positive_kgen_merged_raw.vcf.gz

#
# Count variants from Individual HG03120
echo ""
echo "DDR Positive Individual HG03120 (ESN (AFR))"
echo "1 homozygous LoF variant"
echo ""
echo "Variant count using Grep -vc ^#"
echo ""

zgrep -vc ^# "${input_folder}"/HG03120/s01_HG03120_ddr_positive_kgen_merged_raw.vcf.gz

echo ""
echo "Variant count using GATK_4 Count Variants"
echo ""

"${gatk4}"gatk CountVariants \
	-V "${input_folder}"/HG03120/s01_HG03120_ddr_positive_kgen_merged_raw.vcf.gz


# Finishing script
echo ""
echo "Completed s01_count_variants_2_ddr_positive_kgen.sh"
date
echo ""
