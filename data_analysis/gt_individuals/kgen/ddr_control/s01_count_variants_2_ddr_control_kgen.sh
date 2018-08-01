#!/bin/bash
# s01_count_variants_2_ddr_control_kgen.sh

# Started: David Gilfoyle 27May2018
# Last updated: David Gilfoyle 28May2018

# Use:
# ./s01_count_variants_2_ddr_control_kgen.sh &> s01_count_variants_2_ddr_control_kgen.log

# Counting Number of Variants in VCF Files for Selected DDR Control Individuals from 1000 Genome Project (Genotype VCF Files)

# Information about GATK CountVariants:
# https://software.broadinstitute.org/gatk/documentation/tooldocs/current/org_broadinstitute_hellbender_tools_walkers_CountVariants.php

# Starting script
echo "Starting s01_count_variants_2_ddr_control_kgen.sh"
date
echo ""

# Stop at runtime errors
set -e

# Tools, resources, files
base_folder="/home/ec2-user"
gatk4="${base_folder}/tools/gatk_4_0/gatk-4.0.2.1/"
input_folder="${base_folder}/results/data_analysis/gt_individuals/kgen/ddr_control/"

#
# Count variants from Individual NA18504
echo ""
echo "DDR Positive Individual NA18504 (YRI (AFR))"
echo "Criteria met - 13 missense variants"
echo ""
echo "Variant count using Grep -vc ^#"
echo ""

zgrep -vc ^# "${input_folder}"/NA18504/s01_NA18504_ddr_control_kgen_merged_raw.vcf.gz

echo ""
echo "Variant count using GATK_4 Count Variants"
echo ""

"${gatk4}"gatk CountVariants \
	-V "${input_folder}"/NA18504/s01_NA18504_ddr_control_kgen_merged_raw.vcf.gz

#
# Count variants from Individual HG02952
echo ""
echo "DDR Positive Individual HG02952 (ESN (AFR))"
echo "Criteria met - 10 missense variants - NEIL3 marginal - %HI 48.62%"
echo ""
echo "Variant count using Grep -vc ^#"
echo ""

zgrep -vc ^# "${input_folder}"/HG02952/s01_HG02952_ddr_control_kgen_merged_raw.vcf.gz

echo ""
echo "Variant count using GATK_4 Count Variants"
echo ""

"${gatk4}"gatk CountVariants \
	-V "${input_folder}"/HG02952/s01_HG02952_ddr_control_kgen_merged_raw.vcf.gz

#
# Count variants from Individual HG02981
echo ""
echo "DDR Positive Individual HG02981 (ESN (AFR))"
echo "Criteria met - 7 missense variants"
echo ""
echo "Variant count using Grep -vc ^#"
echo ""

zgrep -vc ^# "${input_folder}"/HG02981/s01_HG02981_ddr_control_kgen_merged_raw.vcf.gz

echo ""
echo "Variant count using GATK_4 Count Variants"
echo ""

"${gatk4}"gatk CountVariants \
	-V "${input_folder}"/HG02981/s01_HG02981_ddr_control_kgen_merged_raw.vcf.gz

#
# Count variants from Individual HG01055
echo ""
echo "DDR Positive Individual HG01055 (PUR (AMR))"
echo "criteria met - 2 missense variants"
echo ""
echo "Variant count using Grep -vc ^#"
echo ""

zgrep -vc ^# "${input_folder}"/HG01055/s01_HG01055_ddr_control_kgen_merged_raw.vcf.gz

echo ""
echo "Variant count using GATK_4 Count Variants"
echo ""

"${gatk4}"gatk CountVariants \
	-V "${input_folder}"/HG01055/s01_HG01055_ddr_control_kgen_merged_raw.vcf.gz


# Finishing script
echo ""
echo "Completed s01_count_variants_2_ddr_control_kgen.sh"
date
echo ""
