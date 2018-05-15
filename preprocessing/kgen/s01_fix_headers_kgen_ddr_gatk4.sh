#!/bin/bash
# s01_fix_headers_kgen_ddr_gatk4.sh

# Started: David Gilfoyle 20Apr2018
# Last updated: David Gilfoyle 20Apr2018

# Use:
# ./s01_fix_headers_kgen_ddr_gatk4.sh &> s01_fix_headers_kgen_ddr_gatk4.log

# Check and Fix Headers from 1000 Genome Project (Split Multiallelic VCF Files)

# Information about GATK-4 ValidateVariants:
# https://software.broadinstitute.org/gatk/documentation/tooldocs/current/org_broadinstitute_hellbender_tools_walkers_variantutils_ValidateVariants.php

# Starting script
echo "Starting s01_fix_headers_kgen_gatk4.sh"
date
echo ""

# Stop at runtime errors
set -e

# Tools, resources, files
base_folder="/home/ec2-user"

gatk4="${base_folder}/tools/gatk_4_0/gatk-4.0.2.1/"
picard="${base_folder}/tools/picard/"
ref_genome="${base_folder}/resources/gatk_b37_bundle/human_g1k_v37.fasta" # GATK SelectVariants requires uncompressed reference file

# Check VCF format for adherence to VCF format, including REF allele match
echo "Checking VCF format for adherence to VCF format, including REF allele match using GATK v 4.0.2.1"
date
echo ""

kgen_vcf="${base_folder}/results/preprocessed/kgen/s01_ddr_kgen_split.vcf"
kgen_fixed_vcf="${base_folder}/results/preprocessed/kgen/s01_ddr_kgen_split_fixed.vcf"

"${gatk4}"gatk ValidateVariants \
  -V "${kgen_vcf}" \
  -R "${ref_genome}" 

# Fix VCF header
echo "Fixing VCF header using Picard v 2.18.2)"
date
echo ""

java -jar "${picard}"picard.jar FixVcfHeader \
I="${kgen_vcf}" \
O="${kgen_fixed_vcf}"   

# Finishing script
echo "Finishing s01_fix_headers_kgen_gatk4.sh"
date
echo ""
