#!/bin/bash
# s01_count_variants_ddr_control_kgen.sh

# Started: David Gilfoyle 27May2018
# Last updated: David Gilfoyle 27May2018

# Use:
# ./s01_count_variants_ddr_control_kgen.sh &> s01_count_variants_ddr_control_kgen.log

# Counting Number of Variants in VCF Files for Selected DDR Control Individuals from 1000 Genome Project (Genotype VCF Files)

# Information about GATK CountVariants:
# https://software.broadinstitute.org/gatk/documentation/tooldocs/current/org_broadinstitute_hellbender_tools_walkers_CountVariants.php

# Starting script
echo "Starting s01_count_variants_ddr_control_kgen.sh"
date
echo ""

# Stop at runtime errors
set -e

# Tools, resources, files
base_folder="/home/ec2-user"
gatk4="${base_folder}/tools/gatk_4_0/gatk-4.0.2.1/"
input_folder="${base_folder}/results/data_analysis/gt_individuals/kgen/ddr_control/"

#
# Count variants from Individual HG00179
echo ""
echo "DDR Positive Individual HG00179 (FIN (EUR))"
echo "Criteria met - 9 missense variants"
echo ""
echo "Variant count using Grep -vc ^#"
echo ""

zgrep -vc ^# "${input_folder}"/HG00179/s01_HG00179_ddr_control_kgen_merged_raw.vcf.gz

echo ""
echo "Variant count using GATK_4 Count Variants"
echo ""

"${gatk4}"gatk CountVariants \
	-V "${input_folder}"/HG00179/s01_HG00179_ddr_control_kgen_merged_raw.vcf.gz

#
# Count variants from Individual HG00351
echo ""
echo "DDR Positive Individual HG00351 (FIN (EUR))"
echo "Criteria met - 6 missense variants"
echo ""
echo "Variant count using Grep -vc ^#"
echo ""

zgrep -vc ^# "${input_folder}"/HG00351/s01_HG00351_ddr_control_kgen_merged_raw.vcf.gz

echo ""
echo "Variant count using GATK_4 Count Variants"
echo ""

"${gatk4}"gatk CountVariants \
	-V "${input_folder}"/HG00351/s01_HG00351_ddr_control_kgen_merged_raw.vcf.gz

#
# Count variants from Individual HG02050
echo ""
echo "DDR Positive Individual HG02050 (KHV (EAS))"
echo "Criteria met - 4 missense variants"
echo ""
echo "Variant count using Grep -vc ^#"
echo ""

zgrep -vc ^# "${input_folder}"/HG02050/s01_HG02050_ddr_control_kgen_merged_raw.vcf.gz

echo ""
echo "Variant count using GATK_4 Count Variants"
echo ""

"${gatk4}"gatk CountVariants \
	-V "${input_folder}"/HG02050/s01_HG02050_ddr_control_kgen_merged_raw.vcf.gz

#
# Count variants from Individual HG02067
echo ""
echo "DDR Positive Individual HG02067 (KHV (EAS))"
echo "criteria met - 0 missense variants"
echo ""
echo "Variant count using Grep -vc ^#"
echo ""

zgrep -vc ^# "${input_folder}"/HG02067/s01_HG02067_ddr_control_kgen_merged_raw.vcf.gz

echo ""
echo "Variant count using GATK_4 Count Variants"
echo ""

"${gatk4}"gatk CountVariants \
	-V "${input_folder}"/HG02067/s01_HG02067_ddr_control_kgen_merged_raw.vcf.gz

#
# Count variants from Individual HG02462
echo ""
echo "DDR Positive Individual HG02462 (GWD (AFR))"
echo "Criteria met - 17 missense variants"
echo ""
echo "Variant count using Grep -vc ^#"
echo ""

zgrep -vc ^# "${input_folder}"/HG02462/s01_HG02462_ddr_control_kgen_merged_raw.vcf.gz

echo ""
echo "Variant count using GATK_4 Count Variants"
echo ""

"${gatk4}"gatk CountVariants \
	-V "${input_folder}"/HG02462/s01_HG02462_ddr_control_kgen_merged_raw.vcf.gz

#
# Count variants from Individual NA19315
echo ""
echo "DDR Positive Individual NA19315 (LWK (AFR))"
echo "Criteria met - 7 missense / 1 NC_transcript_exon_variant"
echo ""
echo "Variant count using Grep -vc ^#"
echo ""

zgrep -vc ^# "${input_folder}"/NA19315/s01_NA19315_ddr_control_kgen_merged_raw.vcf.gz

echo ""
echo "Variant count using GATK_4 Count Variants"
echo ""

"${gatk4}"gatk CountVariants \
	-V "${input_folder}"/NA19315/s01_NA19315_ddr_control_kgen_merged_raw.vcf.gz
	
#
# Count variants from Individual NA19908
echo ""
echo "DDR Positive Individual NA19908 (ASW (AFR))"
echo "Criteria met - 12 missense variants"
echo ""
echo "Variant count using Grep -vc ^#"
echo ""

zgrep -vc ^# "${input_folder}"/NA19908/s01_NA19908_ddr_control_kgen_merged_raw.vcf.gz

echo ""
echo "Variant count using GATK_4 Count Variants"
echo ""

"${gatk4}"gatk CountVariants \
	-V "${input_folder}"/NA19908/s01_NA19908_ddr_control_kgen_merged_raw.vcf.gz	

# Finishing script
echo ""
echo "Completed s01_count_variants_ddr_control_kgen.sh"
date
echo ""
