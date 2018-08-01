#!/bin/bash
# s01_discord_variants_HG00179-HG00351_gatk4.sh

# Started: David Gilfoyle 04Jul2018
# Last updated: David Gilfoyle 04Jul2018

# Use:
# ./s01_discord_variants_HG00179-HG00351_gatk4.sh &> s01_discord_variants_HG00179-HG00351_gatk4.log

# Selection of Discoradant Variants from 1000 Genome Project Individuals HG00179 (FIN; DDR-) and HG00351 (FIN; DDR-)
# Selected variants are present in Individual HG00179 but not in HG00351

# Information about GATK-4 SelectVariants:
# https://software.broadinstitute.org/gatk/documentation/tooldocs/current/org_broadinstitute_hellbender_tools_walkers_variantutils_SelectVariants.php
# https://software.broadinstitute.org/gatk/documentation/article?id=11009
# https://gatkforums.broadinstitute.org/gatk/discussion/1742/using-selectvariants-to-output-pass-records

# Stop at runtime errors
set -e

# Start message
echo "Started s01_discord_variants_HG00179-HG00351_gatk4.sh"
date
echo ""

# Tools, resources, files
base_folder="/home/ec2-user"

gatk4="${base_folder}/tools/gatk_4_0/gatk-4.0.2.1/"
ref_genome="${base_folder}/resources/gatk_b37_bundle/human_g1k_v37.fasta" # GATK SelectVariants requires uncompressed reference file

vcf1="${base_folder}/results/data_analysis/gt_individuals/kgen/ddr_control/HG00351/s01_HG00351_ddr_control_kgen_merged_raw.vcf.gz"
vcf2="${base_folder}/results/data_analysis/gt_individuals/kgen/ddr_control/HG00179/s01_HG00179_ddr_control_kgen_merged_raw.vcf.gz"

output_vcf="${base_folder}/results/data_analysis/gt_individuals/kgen/discordant/s01_HG00179-HG00351_discordant.vcf"
output_log="${base_folder}/results/data_analysis/gt_individuals/kgen/discordant/s01_HG00179-HG00351_discordant.log"

# Select discordant variants
echo "Selecting discordant variants ..."

"${gatk4}"gatk SelectVariants \
  -R "${ref_genome}" \
  -V "${vcf2}" \
  --discordance "${vcf1}" \
  -O "${output_vcf}" \
  &> "${output_log}"

# Completion mesage
echo ""
echo "Completed s01_discord_variants_HG00179-HG00351_gatk4.sh"
date
