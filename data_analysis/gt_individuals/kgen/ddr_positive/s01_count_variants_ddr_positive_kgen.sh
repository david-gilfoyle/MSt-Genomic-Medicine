#!/bin/bash
# s01_count_variants_ddr_positive_kgen.sh

# Started: David Gilfoyle 27May2018
# Last updated: David Gilfoyle 27May2018

# Use:
# ./s01_count_variants_ddr_positive_kgen.sh &> s01_count_variants_ddr_positive_kgen.log

# Counting Number of Variants in VCF Files for Selected DDR Positive Individuals from 1000 Genome Project (Genotype VCF Files)

# Information about GATK CountVariants:
# https://software.broadinstitute.org/gatk/documentation/tooldocs/current/org_broadinstitute_hellbender_tools_walkers_CountVariants.php

# Starting script
echo "Starting s01_count_variants_ddr_positive_kgen.sh"
date
echo ""

# Stop at runtime errors
set -e

# Tools, resources, files
base_folder="/home/ec2-user"
gatk4="${base_folder}/tools/gatk_4_0/gatk-4.0.2.1/"
input_folder="${base_folder}/results/data_analysis/gt_individuals/kgen/ddr_positive/"

#
# Count variants from Individual HG00310
echo ""
echo "DDR Positive Individual HG00310 (FIN (EUR))"
echo "3 heterozygous LoF variants"
echo ""
echo "Variant count using Grep -vc ^#"
echo ""

zgrep -vc ^# "${input_folder}"/HG00310/s01_HG00310_ddr_positive_kgen_merged_raw.vcf.gz

echo ""
echo "Variant count using GATK_4 Count Variants"
echo ""

"${gatk4}"gatk CountVariants \
	-V "${input_folder}"/HG00310/s01_HG00310_ddr_positive_kgen_merged_raw.vcf.gz

#
# Count variants from Individual HG00365
echo ""
echo "DDR Positive Individual HG00365 (FIN (EUR))"
echo "3 heterozygous LoF variants; 1 (likely) pathogenic"
echo ""
echo "Variant count using Grep -vc ^#"
echo ""

zgrep -vc ^# "${input_folder}"/HG00365/s01_HG00365_ddr_positive_kgen_merged_raw.vcf.gz

echo ""
echo "Variant count using GATK_4 Count Variants"
echo ""

"${gatk4}"gatk CountVariants \
	-V "${input_folder}"/HG00365/s01_HG00365_ddr_positive_kgen_merged_raw.vcf.gz

#
# Count variants from Individual HG02121
echo ""
echo "DDR Positive Individual HG02121 (KHV (EAS))"
echo "1 heterozygous LoF variant; (likely) pathogenic in a HI gene"
echo ""
echo "Variant count using Grep -vc ^#"
echo ""

zgrep -vc ^# "${input_folder}"/HG02121/s01_HG02121_ddr_positive_kgen_merged_raw.vcf.gz

echo ""
echo "Variant count using GATK_4 Count Variants"
echo ""

"${gatk4}"gatk CountVariants \
	-V "${input_folder}"/HG02121/s01_HG02121_ddr_positive_kgen_merged_raw.vcf.gz

#
# Count variants from Individual HG02122
echo ""
echo "DDR Positive Individual HG02122 (KHV (EAS))"
echo "1 homozygous LoF variant; (likely) pathogenic"
echo ""
echo "Variant count using Grep -vc ^#"
echo ""

zgrep -vc ^# "${input_folder}"/HG02122/s01_HG02122_ddr_positive_kgen_merged_raw.vcf.gz

echo ""
echo "Variant count using GATK_4 Count Variants"
echo ""

"${gatk4}"gatk CountVariants \
	-V "${input_folder}"/HG02122/s01_HG02122_ddr_positive_kgen_merged_raw.vcf.gz

#
# Count variants from Individual HG02623
echo ""
echo "DDR Positive Individual HG02623 (GWD (AFR))"
echo "1 hemizygous LoF variant; benign"
echo ""
echo "Variant count using Grep -vc ^#"
echo ""

zgrep -vc ^# "${input_folder}"/HG02623/s01_HG02623_ddr_positive_kgen_merged_raw.vcf.gz

echo ""
echo "Variant count using GATK_4 Count Variants"
echo ""

"${gatk4}"gatk CountVariants \
	-V "${input_folder}"/HG02623/s01_HG02623_ddr_positive_kgen_merged_raw.vcf.gz

#
# Count variants from Individual NA19043
echo ""
echo "DDR Positive Individual NA19043 (LWK (AFR))"
echo "1 homozygous / 1 heterozygous LoF variant"
echo ""
echo "Variant count using Grep -vc ^#"
echo ""

zgrep -vc ^# "${input_folder}"/NA19043/s01_NA19043_ddr_positive_kgen_merged_raw.vcf.gz

echo ""
echo "Variant count using GATK_4 Count Variants"
echo ""

"${gatk4}"gatk CountVariants \
	-V "${input_folder}"/NA19043/s01_NA19043_ddr_positive_kgen_merged_raw.vcf.gz
	
#
# Count variants from Individual NA19834
echo ""
echo "DDR Positive Individual NA19834 (ASW (AFR))"
echo "1 hemizygous LoF variant; benign"
echo ""
echo "Variant count using Grep -vc ^#"
echo ""

zgrep -vc ^# "${input_folder}"/NA19834/s01_NA19834_ddr_positive_kgen_merged_raw.vcf.gz

echo ""
echo "Variant count using GATK_4 Count Variants"
echo ""

"${gatk4}"gatk CountVariants \
	-V "${input_folder}"/NA19834/s01_NA19834_ddr_positive_kgen_merged_raw.vcf.gz	

# Finishing script
echo ""
echo "Completed s01_count_variants_ddr_positive_kgen.sh"
date
echo ""
