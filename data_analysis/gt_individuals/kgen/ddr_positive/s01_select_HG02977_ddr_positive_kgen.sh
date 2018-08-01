#!/bin/bash
# s01_select_HG02977_ddr_positive_kgen.sh

# Started: David Gilfoyle 23May2018
# Last updated: David Gilfoyle 27May2018

# Use:
# ./s01_select_HG02977_ddr_positive_kgen.sh &> s01_select_HG02977_ddr_positive_kgen.log

# Selection of DDR Positive 'Test' Individual (HG02977; ESN (AFR)) from 1000 Genome Project (Genotype VCF Files)

# Information about GATK-4 SelectVariants:
# https://software.broadinstitute.org/gatk/documentation/tooldocs/current/org_broadinstitute_hellbender_tools_walkers_variantutils_SelectVariants.php
# https://software.broadinstitute.org/gatk/documentation/article?id=11009
# https://gatkforums.broadinstitute.org/gatk/discussion/1742/using-selectvariants-to-output-pass-records

# Information about Picard MergeVcfs:
# https://software.broadinstitute.org/gatk/documentation/tooldocs/current/picard_vcf_MergeVcfs.php

# Set 1000 Genomes Project Individual ID
individual_id="HG02977"

# Starting script
echo "Starting s01_select_${individual_id}_ddr_positive_kgen.sh"
date
echo ""
echo "1000 Genomes Project Individual ID - DDR positive genotype to be extracted - ${individual_id}"
echo ""

# Stop at runtime errors
set -e

# Tools, resources, files
base_folder="/home/ec2-user"
gatk4="${base_folder}/tools/gatk_4_0/gatk-4.0.2.1/"
picard_tool="${base_folder}/tools/picard"
ref_genome="${base_folder}/resources/gatk_b37_bundle/human_g1k_v37.fasta" # GATK SelectVariants requires uncompressed reference file

# Create individual specific subfolder
mkdir "${base_folder}/results/data_analysis/gt_individuals/kgen/ddr_positive/${individual_id}/"

# Select individual variants from 1000 Genome Project - Chromosome 1
kgen_vcf="${base_folder}/resources/kgen/source/ALL.chr1.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz"
individ_kgen_vcf="${base_folder}/results/data_analysis/gt_individuals/kgen/ddr_positive/${individual_id}/s01_${individual_id}_ddr_positive_kgen_chr1_raw.vcf"
individ_kgen_log="${base_folder}/results/data_analysis/gt_individuals/kgen/ddr_positive/${individual_id}/s01_${individual_id}_ddr_positive_kgen_chr1_raw.log"

echo "Selecting DDR positive individual genotype from 1000 Genome Project (Chromosome 1) ..."
date

"${gatk4}"gatk SelectVariants \
  -R "${ref_genome}" \
  -V "${kgen_vcf}" \
  -O "${individ_kgen_vcf}" \
  --exclude-filtered TRUE \
  --exclude-non-variants TRUE \
  --remove-unused-alternates TRUE \
  -sn "${individual_id}" \
  &> "${individ_kgen_log}"

# Completion message
echo ""
echo "Completed DDR positive individual genotype from 1000 Genome Project (Chromosome 1)"
date
echo ""

# Select individual variants from 1000 Genome Project - Chromosome 2
kgen_vcf="${base_folder}/resources/kgen/source/ALL.chr2.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz"
individ_kgen_vcf="${base_folder}/results/data_analysis/gt_individuals/kgen/ddr_positive/${individual_id}/s01_${individual_id}_ddr_positive_kgen_chr2_raw.vcf"
individ_kgen_log="${base_folder}/results/data_analysis/gt_individuals/kgen/ddr_positive/${individual_id}/s01_${individual_id}_ddr_positive_kgen_chr2_raw.log"

echo "Selecting DDR positive individual genotype from 1000 Genome Project (Chromosome 2) ..."
date

"${gatk4}"gatk SelectVariants \
  -R "${ref_genome}" \
  -V "${kgen_vcf}" \
  -O "${individ_kgen_vcf}" \
  --exclude-filtered TRUE \
  --exclude-non-variants TRUE \
  --remove-unused-alternates TRUE \
  -sn "${individual_id}" \
  &> "${individ_kgen_log}"

# Completion message
echo ""
echo "Completed DDR positive individual genotype from 1000 Genome Project (Chromosome 2)"
date
echo ""

# Select individual variants from 1000 Genome Project - Chromosome 3
kgen_vcf="${base_folder}/resources/kgen/source/ALL.chr3.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz"
individ_kgen_vcf="${base_folder}/results/data_analysis/gt_individuals/kgen/ddr_positive/${individual_id}/s01_${individual_id}_ddr_positive_kgen_chr3_raw.vcf"
individ_kgen_log="${base_folder}/results/data_analysis/gt_individuals/kgen/ddr_positive/${individual_id}/s01_${individual_id}_ddr_positive_kgen_chr3_raw.log"

echo "Selecting DDR positive individual genotype from 1000 Genome Project (Chromosome 3) ..."
date

"${gatk4}"gatk SelectVariants \
  -R "${ref_genome}" \
  -V "${kgen_vcf}" \
  -O "${individ_kgen_vcf}" \
  --exclude-filtered TRUE \
  --exclude-non-variants TRUE \
  --remove-unused-alternates TRUE \
  -sn "${individual_id}" \
  &> "${individ_kgen_log}"

# Completion message
echo ""
echo "Completed DDR positive individual genotype from 1000 Genome Project (Chromosome 3)"
date
echo ""

# Select individual variants from 1000 Genome Project - Chromosome 4
kgen_vcf="${base_folder}/resources/kgen/source/ALL.chr4.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz"
individ_kgen_vcf="${base_folder}/results/data_analysis/gt_individuals/kgen/ddr_positive/${individual_id}/s01_${individual_id}_ddr_positive_kgen_chr4_raw.vcf"
individ_kgen_log="${base_folder}/results/data_analysis/gt_individuals/kgen/ddr_positive/${individual_id}/s01_${individual_id}_ddr_positive_kgen_chr4_raw.log"

echo "Selecting DDR positive individual genotype from 1000 Genome Project (Chromosome 4) ..."
date

"${gatk4}"gatk SelectVariants \
  -R "${ref_genome}" \
  -V "${kgen_vcf}" \
  -O "${individ_kgen_vcf}" \
  --exclude-filtered TRUE \
  --exclude-non-variants TRUE \
  --remove-unused-alternates TRUE \
  -sn "${individual_id}" \
  &> "${individ_kgen_log}"

# Completion message
echo ""
echo "Completed DDR positive individual genotype from 1000 Genome Project (Chromosome 4)"
date
echo ""

# Select individual variants from 1000 Genome Project - Chromosome 5
kgen_vcf="${base_folder}/resources/kgen/source/ALL.chr5.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz"
individ_kgen_vcf="${base_folder}/results/data_analysis/gt_individuals/kgen/ddr_positive/${individual_id}/s01_${individual_id}_ddr_positive_kgen_chr5_raw.vcf"
individ_kgen_log="${base_folder}/results/data_analysis/gt_individuals/kgen/ddr_positive/${individual_id}/s01_${individual_id}_ddr_positive_kgen_chr5_raw.log"

echo "Selecting DDR positive individual genotype from 1000 Genome Project (Chromosome 5) ..."
date

"${gatk4}"gatk SelectVariants \
  -R "${ref_genome}" \
  -V "${kgen_vcf}" \
  -O "${individ_kgen_vcf}" \
  --exclude-filtered TRUE \
  --exclude-non-variants TRUE \
  --remove-unused-alternates TRUE \
  -sn "${individual_id}" \
  &> "${individ_kgen_log}"

# Completion message
echo ""
echo "Completed DDR positive individual genotype from 1000 Genome Project (Chromosome 5)"
date
echo ""

# Select individual variants from 1000 Genome Project - Chromosome 6
kgen_vcf="${base_folder}/resources/kgen/source/ALL.chr6.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz"
individ_kgen_vcf="${base_folder}/results/data_analysis/gt_individuals/kgen/ddr_positive/${individual_id}/s01_${individual_id}_ddr_positive_kgen_chr6_raw.vcf"
individ_kgen_log="${base_folder}/results/data_analysis/gt_individuals/kgen/ddr_positive/${individual_id}/s01_${individual_id}_ddr_positive_kgen_chr6_raw.log"

echo "Selecting DDR positive individual genotype from 1000 Genome Project (Chromosome 6) ..."
date

"${gatk4}"gatk SelectVariants \
  -R "${ref_genome}" \
  -V "${kgen_vcf}" \
  -O "${individ_kgen_vcf}" \
  --exclude-filtered TRUE \
  --exclude-non-variants TRUE \
  --remove-unused-alternates TRUE \
  -sn "${individual_id}" \
  &> "${individ_kgen_log}"

# Completion message
echo ""
echo "Completed DDR positive individual genotype from 1000 Genome Project (Chromosome 6)"
date
echo ""

# Select individual variants from 1000 Genome Project - Chromosome 7
kgen_vcf="${base_folder}/resources/kgen/source/ALL.chr7.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz"
individ_kgen_vcf="${base_folder}/results/data_analysis/gt_individuals/kgen/ddr_positive/${individual_id}/s01_${individual_id}_ddr_positive_kgen_chr7_raw.vcf"
individ_kgen_log="${base_folder}/results/data_analysis/gt_individuals/kgen/ddr_positive/${individual_id}/s01_${individual_id}_ddr_positive_kgen_chr7_raw.log"

echo "Selecting DDR positive individual genotype from 1000 Genome Project (Chromosome 7) ..."
date

"${gatk4}"gatk SelectVariants \
  -R "${ref_genome}" \
  -V "${kgen_vcf}" \
  -O "${individ_kgen_vcf}" \
  --exclude-filtered TRUE \
  --exclude-non-variants TRUE \
  --remove-unused-alternates TRUE \
  -sn "${individual_id}" \
  &> "${individ_kgen_log}"

# Completion message
echo ""
echo "Completed DDR positive individual genotype from 1000 Genome Project (Chromosome 7)"
date
echo ""

# Select individual variants from 1000 Genome Project - Chromosome 8
kgen_vcf="${base_folder}/resources/kgen/source/ALL.chr8.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz"
individ_kgen_vcf="${base_folder}/results/data_analysis/gt_individuals/kgen/ddr_positive/${individual_id}/s01_${individual_id}_ddr_positive_kgen_chr8_raw.vcf"
individ_kgen_log="${base_folder}/results/data_analysis/gt_individuals/kgen/ddr_positive/${individual_id}/s01_${individual_id}_ddr_positive_kgen_chr8_raw.log"

echo "Selecting DDR positive individual genotype from 1000 Genome Project (Chromosome 8) ..."
date

"${gatk4}"gatk SelectVariants \
  -R "${ref_genome}" \
  -V "${kgen_vcf}" \
  -O "${individ_kgen_vcf}" \
  --exclude-filtered TRUE \
  --exclude-non-variants TRUE \
  --remove-unused-alternates TRUE \
  -sn "${individual_id}" \
  &> "${individ_kgen_log}"

# Completion message
echo ""
echo "Completed DDR positive individual genotype from 1000 Genome Project (Chromosome 8)"
date
echo ""

# Select individual variants from 1000 Genome Project - Chromosome 9
kgen_vcf="${base_folder}/resources/kgen/source/ALL.chr9.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz"
individ_kgen_vcf="${base_folder}/results/data_analysis/gt_individuals/kgen/ddr_positive/${individual_id}/s01_${individual_id}_ddr_positive_kgen_chr9_raw.vcf"
individ_kgen_log="${base_folder}/results/data_analysis/gt_individuals/kgen/ddr_positive/${individual_id}/s01_${individual_id}_ddr_positive_kgen_chr9_raw.log"

echo "Selecting DDR positive individual genotype from 1000 Genome Project (Chromosome 9) ..."
date

"${gatk4}"gatk SelectVariants \
  -R "${ref_genome}" \
  -V "${kgen_vcf}" \
  -O "${individ_kgen_vcf}" \
  --exclude-filtered TRUE \
  --exclude-non-variants TRUE \
  --remove-unused-alternates TRUE \
  -sn "${individual_id}" \
  &> "${individ_kgen_log}"

# Completion message
echo ""
echo "Completed DDR positive individual genotype from 1000 Genome Project (Chromosome 9)"
date
echo ""

# Select individual variants from 1000 Genome Project - Chromosome 10
kgen_vcf="${base_folder}/resources/kgen/source/ALL.chr10.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz"
individ_kgen_vcf="${base_folder}/results/data_analysis/gt_individuals/kgen/ddr_positive/${individual_id}/s01_${individual_id}_ddr_positive_kgen_chr10_raw.vcf"
individ_kgen_log="${base_folder}/results/data_analysis/gt_individuals/kgen/ddr_positive/${individual_id}/s01_${individual_id}_ddr_positive_kgen_chr10_raw.log"

echo "Selecting DDR positive individual genotype from 1000 Genome Project (Chromosome 10) ..."
date

"${gatk4}"gatk SelectVariants \
  -R "${ref_genome}" \
  -V "${kgen_vcf}" \
  -O "${individ_kgen_vcf}" \
  --exclude-filtered TRUE \
  --exclude-non-variants TRUE \
  --remove-unused-alternates TRUE \
  -sn "${individual_id}" \
  &> "${individ_kgen_log}"

# Completion message
echo ""
echo "Completed DDR positive individual genotype from 1000 Genome Project (Chromosome 10)"
date
echo ""

# Select individual variants from 1000 Genome Project - Chromosome 11
kgen_vcf="${base_folder}/resources/kgen/source/ALL.chr11.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz"
individ_kgen_vcf="${base_folder}/results/data_analysis/gt_individuals/kgen/ddr_positive/${individual_id}/s01_${individual_id}_ddr_positive_kgen_chr11_raw.vcf"
individ_kgen_log="${base_folder}/results/data_analysis/gt_individuals/kgen/ddr_positive/${individual_id}/s01_${individual_id}_ddr_positive_kgen_chr11_raw.log"

echo "Selecting DDR positive individual genotype from 1000 Genome Project (Chromosome 11) ..."
date

"${gatk4}"gatk SelectVariants \
  -R "${ref_genome}" \
  -V "${kgen_vcf}" \
  -O "${individ_kgen_vcf}" \
  --exclude-filtered TRUE \
  --exclude-non-variants TRUE \
  --remove-unused-alternates TRUE \
  -sn "${individual_id}" \
  &> "${individ_kgen_log}"

# Completion message
echo ""
echo "Completed DDR positive individual genotype from 1000 Genome Project (Chromosome 11)"
date
echo ""

# Select individual variants from 1000 Genome Project - Chromosome 12
kgen_vcf="${base_folder}/resources/kgen/source/ALL.chr12.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz"
individ_kgen_vcf="${base_folder}/results/data_analysis/gt_individuals/kgen/ddr_positive/${individual_id}/s01_${individual_id}_ddr_positive_kgen_chr12_raw.vcf"
individ_kgen_log="${base_folder}/results/data_analysis/gt_individuals/kgen/ddr_positive/${individual_id}/s01_${individual_id}_ddr_positive_kgen_chr12_raw.log"

echo "Selecting DDR positive individual genotype from 1000 Genome Project (Chromosome 12) ..."
date

"${gatk4}"gatk SelectVariants \
  -R "${ref_genome}" \
  -V "${kgen_vcf}" \
  -O "${individ_kgen_vcf}" \
  --exclude-filtered TRUE \
  --exclude-non-variants TRUE \
  --remove-unused-alternates TRUE \
  -sn "${individual_id}" \
  &> "${individ_kgen_log}"

# Completion message
echo ""
echo "Completed DDR positive individual genotype from 1000 Genome Project (Chromosome 12)"
date
echo ""

# Select individual variants from 1000 Genome Project - Chromosome 13
kgen_vcf="${base_folder}/resources/kgen/source/ALL.chr13.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz"
individ_kgen_vcf="${base_folder}/results/data_analysis/gt_individuals/kgen/ddr_positive/${individual_id}/s01_${individual_id}_ddr_positive_kgen_chr13_raw.vcf"
individ_kgen_log="${base_folder}/results/data_analysis/gt_individuals/kgen/ddr_positive/${individual_id}/s01_${individual_id}_ddr_positive_kgen_chr13_raw.log"

echo "Selecting DDR positive individual genotype from 1000 Genome Project (Chromosome 13) ..."
date

"${gatk4}"gatk SelectVariants \
  -R "${ref_genome}" \
  -V "${kgen_vcf}" \
  -O "${individ_kgen_vcf}" \
  --exclude-filtered TRUE \
  --exclude-non-variants TRUE \
  --remove-unused-alternates TRUE \
  -sn "${individual_id}" \
  &> "${individ_kgen_log}"

# Completion message
echo ""
echo "Completed DDR positive individual genotype from 1000 Genome Project (Chromosome 13)"
date
echo ""

# Select individual variants from 1000 Genome Project - Chromosome 14
kgen_vcf="${base_folder}/resources/kgen/source/ALL.chr14.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz"
individ_kgen_vcf="${base_folder}/results/data_analysis/gt_individuals/kgen/ddr_positive/${individual_id}/s01_${individual_id}_ddr_positive_kgen_chr14_raw.vcf"
individ_kgen_log="${base_folder}/results/data_analysis/gt_individuals/kgen/ddr_positive/${individual_id}/s01_${individual_id}_ddr_positive_kgen_chr14_raw.log"

echo "Selecting DDR positive individual genotype from 1000 Genome Project (Chromosome 14) ..."
date

"${gatk4}"gatk SelectVariants \
  -R "${ref_genome}" \
  -V "${kgen_vcf}" \
  -O "${individ_kgen_vcf}" \
  --exclude-filtered TRUE \
  --exclude-non-variants TRUE \
  --remove-unused-alternates TRUE \
  -sn "${individual_id}" \
  &> "${individ_kgen_log}"

# Completion message
echo ""
echo "Completed DDR positive individual genotype from 1000 Genome Project (Chromosome 14)"
date
echo ""

# Select individual variants from 1000 Genome Project - Chromosome 15
kgen_vcf="${base_folder}/resources/kgen/source/ALL.chr15.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz"
individ_kgen_vcf="${base_folder}/results/data_analysis/gt_individuals/kgen/ddr_positive/${individual_id}/s01_${individual_id}_ddr_positive_kgen_chr15_raw.vcf"
individ_kgen_log="${base_folder}/results/data_analysis/gt_individuals/kgen/ddr_positive/${individual_id}/s01_${individual_id}_ddr_positive_kgen_chr15_raw.log"

echo "Selecting DDR positive individual genotype from 1000 Genome Project (Chromosome 15) ..."
date

"${gatk4}"gatk SelectVariants \
  -R "${ref_genome}" \
  -V "${kgen_vcf}" \
  -O "${individ_kgen_vcf}" \
  --exclude-filtered TRUE \
  --exclude-non-variants TRUE \
  --remove-unused-alternates TRUE \
  -sn "${individual_id}" \
  &> "${individ_kgen_log}"

# Completion message
echo ""
echo "Completed DDR positive individual genotype from 1000 Genome Project (Chromosome 15)"
date
echo ""

# Select individual variants from 1000 Genome Project - Chromosome 16
kgen_vcf="${base_folder}/resources/kgen/source/ALL.chr16.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz"
individ_kgen_vcf="${base_folder}/results/data_analysis/gt_individuals/kgen/ddr_positive/${individual_id}/s01_${individual_id}_ddr_positive_kgen_chr16_raw.vcf"
individ_kgen_log="${base_folder}/results/data_analysis/gt_individuals/kgen/ddr_positive/${individual_id}/s01_${individual_id}_ddr_positive_kgen_chr16_raw.log"

echo "Selecting DDR positive individual genotype from 1000 Genome Project (Chromosome 16) ..."
date

"${gatk4}"gatk SelectVariants \
  -R "${ref_genome}" \
  -V "${kgen_vcf}" \
  -O "${individ_kgen_vcf}" \
  --exclude-filtered TRUE \
  --exclude-non-variants TRUE \
  --remove-unused-alternates TRUE \
  -sn "${individual_id}" \
  &> "${individ_kgen_log}"

# Completion message
echo ""
echo "Completed DDR positive individual genotype from 1000 Genome Project (Chromosome 16)"
date
echo ""

# Select individual variants from 1000 Genome Project - Chromosome 17
kgen_vcf="${base_folder}/resources/kgen/source/ALL.chr17.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz"
individ_kgen_vcf="${base_folder}/results/data_analysis/gt_individuals/kgen/ddr_positive/${individual_id}/s01_${individual_id}_ddr_positive_kgen_chr17_raw.vcf"
individ_kgen_log="${base_folder}/results/data_analysis/gt_individuals/kgen/ddr_positive/${individual_id}/s01_${individual_id}_ddr_positive_kgen_chr17_raw.log"

echo "Selecting DDR positive individual genotype from 1000 Genome Project (Chromosome 17) ..."
date

"${gatk4}"gatk SelectVariants \
  -R "${ref_genome}" \
  -V "${kgen_vcf}" \
  -O "${individ_kgen_vcf}" \
  --exclude-filtered TRUE \
  --exclude-non-variants TRUE \
  --remove-unused-alternates TRUE \
  -sn "${individual_id}" \
  &> "${individ_kgen_log}"

# Completion message
echo ""
echo "Completed DDR positive individual genotype from 1000 Genome Project (Chromosome 17)"
date
echo ""

# Select individual variants from 1000 Genome Project - Chromosome 18
kgen_vcf="${base_folder}/resources/kgen/source/ALL.chr18.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz"
individ_kgen_vcf="${base_folder}/results/data_analysis/gt_individuals/kgen/ddr_positive/${individual_id}/s01_${individual_id}_ddr_positive_kgen_chr18_raw.vcf"
individ_kgen_log="${base_folder}/results/data_analysis/gt_individuals/kgen/ddr_positive/${individual_id}/s01_${individual_id}_ddr_positive_kgen_chr18_raw.log"

echo "Selecting DDR positive individual genotype from 1000 Genome Project (Chromosome 18) ..."
date

"${gatk4}"gatk SelectVariants \
  -R "${ref_genome}" \
  -V "${kgen_vcf}" \
  -O "${individ_kgen_vcf}" \
  --exclude-filtered TRUE \
  --exclude-non-variants TRUE \
  --remove-unused-alternates TRUE \
  -sn "${individual_id}" \
  &> "${individ_kgen_log}"

# Completion message
echo ""
echo "Completed DDR positive individual genotype from 1000 Genome Project (Chromosome 18)"
date
echo ""

# Select individual variants from 1000 Genome Project - Chromosome 19
kgen_vcf="${base_folder}/resources/kgen/source/ALL.chr19.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz"
individ_kgen_vcf="${base_folder}/results/data_analysis/gt_individuals/kgen/ddr_positive/${individual_id}/s01_${individual_id}_ddr_positive_kgen_chr19_raw.vcf"
individ_kgen_log="${base_folder}/results/data_analysis/gt_individuals/kgen/ddr_positive/${individual_id}/s01_${individual_id}_ddr_positive_kgen_chr19_raw.log"

echo "Selecting DDR positive individual genotype from 1000 Genome Project (Chromosome 19) ..."
date

"${gatk4}"gatk SelectVariants \
  -R "${ref_genome}" \
  -V "${kgen_vcf}" \
  -O "${individ_kgen_vcf}" \
  --exclude-filtered TRUE \
  --exclude-non-variants TRUE \
  --remove-unused-alternates TRUE \
  -sn "${individual_id}" \
  &> "${individ_kgen_log}"

# Completion message
echo ""
echo "Completed DDR positive individual genotype from 1000 Genome Project (Chromosome 19)"
date
echo ""

# Select individual variants from 1000 Genome Project - Chromosome 20
kgen_vcf="${base_folder}/resources/kgen/source/ALL.chr20.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz"
individ_kgen_vcf="${base_folder}/results/data_analysis/gt_individuals/kgen/ddr_positive/${individual_id}/s01_${individual_id}_ddr_positive_kgen_chr20_raw.vcf"
individ_kgen_log="${base_folder}/results/data_analysis/gt_individuals/kgen/ddr_positive/${individual_id}/s01_${individual_id}_ddr_positive_kgen_chr20_raw.log"

echo "Selecting DDR positive individual genotype from 1000 Genome Project (Chromosome 20) ..."
date

"${gatk4}"gatk SelectVariants \
  -R "${ref_genome}" \
  -V "${kgen_vcf}" \
  -O "${individ_kgen_vcf}" \
  --exclude-filtered TRUE \
  --exclude-non-variants TRUE \
  --remove-unused-alternates TRUE \
  -sn "${individual_id}" \
  &> "${individ_kgen_log}"

# Completion message
echo ""
echo "Completed DDR positive individual genotype from 1000 Genome Project (Chromosome 20)"
date
echo ""

# Select individual variants from 1000 Genome Project - Chromosome 21
kgen_vcf="${base_folder}/resources/kgen/source/ALL.chr21.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz"
individ_kgen_vcf="${base_folder}/results/data_analysis/gt_individuals/kgen/ddr_positive/${individual_id}/s01_${individual_id}_ddr_positive_kgen_chr21_raw.vcf"
individ_kgen_log="${base_folder}/results/data_analysis/gt_individuals/kgen/ddr_positive/${individual_id}/s01_${individual_id}_ddr_positive_kgen_chr21_raw.log"

echo "Selecting DDR positive individual genotype from 1000 Genome Project (Chromosome 21) ..."
date

"${gatk4}"gatk SelectVariants \
  -R "${ref_genome}" \
  -V "${kgen_vcf}" \
  -O "${individ_kgen_vcf}" \
  --exclude-filtered TRUE \
  --exclude-non-variants TRUE \
  --remove-unused-alternates TRUE \
  -sn "${individual_id}" \
  &> "${individ_kgen_log}"

# Completion message
echo ""
echo "Completed DDR positive individual genotype from 1000 Genome Project (Chromosome 21)"
date
echo ""

# Select individual variants from 1000 Genome Project - Chromosome 22
kgen_vcf="${base_folder}/resources/kgen/source/ALL.chr22.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz"
individ_kgen_vcf="${base_folder}/results/data_analysis/gt_individuals/kgen/ddr_positive/${individual_id}/s01_${individual_id}_ddr_positive_kgen_chr22_raw.vcf"
individ_kgen_log="${base_folder}/results/data_analysis/gt_individuals/kgen/ddr_positive/${individual_id}/s01_${individual_id}_ddr_positive_kgen_chr22_raw.log"

echo "Selecting DDR positive individual genotype from 1000 Genome Project (Chromosome 22) ..."
date

"${gatk4}"gatk SelectVariants \
  -R "${ref_genome}" \
  -V "${kgen_vcf}" \
  -O "${individ_kgen_vcf}" \
  --exclude-filtered TRUE \
  --exclude-non-variants TRUE \
  --remove-unused-alternates TRUE \
  -sn "${individual_id}" \
  &> "${individ_kgen_log}"

# Completion message
echo ""
echo "Completed DDR positive individual genotype from 1000 Genome Project (Chromosome 22)"
date
echo ""

# Select individual variants from 1000 Genome Project - Chromosome X
kgen_vcf="${base_folder}/resources/kgen/source/ALL.chrX.phase3_shapeit2_mvncall_integrated_v1b.20130502.genotypes.vcf.gz"
individ_kgen_vcf="${base_folder}/results/data_analysis/gt_individuals/kgen/ddr_positive/${individual_id}/s01_${individual_id}_ddr_positive_kgen_chrX_raw.vcf"
individ_kgen_log="${base_folder}/results/data_analysis/gt_individuals/kgen/ddr_positive/${individual_id}/s01_${individual_id}_ddr_positive_kgen_chrX_raw.log"

echo "Selecting DDR positive individual genotype from 1000 Genome Project (Chromosome X) ..."
date

"${gatk4}"gatk SelectVariants \
  -R "${ref_genome}" \
  -V "${kgen_vcf}" \
  -O "${individ_kgen_vcf}" \
  --exclude-filtered TRUE \
  --exclude-non-variants TRUE \
  --remove-unused-alternates TRUE \
  -sn "${individual_id}" \
  &> "${individ_kgen_log}"

# Completion message
echo ""
echo "Completed DDR positive individual genotype from 1000 Genome Project (Chromosome X)"
date
echo ""

# Merging 1000 Genome Individual Genotype VCF files
echo ""
echo "Merging DDR positive individual genotype VCF files from 1000 Genome Project"
date

input_folder="${base_folder}/results/data_analysis/gt_individuals/kgen/ddr_positive/${individual_id}"

java -jar "${picard_tool}"/picard.jar MergeVcfs \
I="${input_folder}"/s01_${individual_id}_ddr_positive_kgen_chr1_raw.vcf \
I="${input_folder}"/s01_${individual_id}_ddr_positive_kgen_chr2_raw.vcf \
I="${input_folder}"/s01_${individual_id}_ddr_positive_kgen_chr3_raw.vcf \
I="${input_folder}"/s01_${individual_id}_ddr_positive_kgen_chr4_raw.vcf \
I="${input_folder}"/s01_${individual_id}_ddr_positive_kgen_chr5_raw.vcf \
I="${input_folder}"/s01_${individual_id}_ddr_positive_kgen_chr6_raw.vcf \
I="${input_folder}"/s01_${individual_id}_ddr_positive_kgen_chr7_raw.vcf \
I="${input_folder}"/s01_${individual_id}_ddr_positive_kgen_chr8_raw.vcf \
I="${input_folder}"/s01_${individual_id}_ddr_positive_kgen_chr9_raw.vcf \
I="${input_folder}"/s01_${individual_id}_ddr_positive_kgen_chr10_raw.vcf \
I="${input_folder}"/s01_${individual_id}_ddr_positive_kgen_chr11_raw.vcf \
I="${input_folder}"/s01_${individual_id}_ddr_positive_kgen_chr12_raw.vcf \
I="${input_folder}"/s01_${individual_id}_ddr_positive_kgen_chr13_raw.vcf \
I="${input_folder}"/s01_${individual_id}_ddr_positive_kgen_chr14_raw.vcf \
I="${input_folder}"/s01_${individual_id}_ddr_positive_kgen_chr15_raw.vcf \
I="${input_folder}"/s01_${individual_id}_ddr_positive_kgen_chr16_raw.vcf \
I="${input_folder}"/s01_${individual_id}_ddr_positive_kgen_chr17_raw.vcf \
I="${input_folder}"/s01_${individual_id}_ddr_positive_kgen_chr18_raw.vcf \
I="${input_folder}"/s01_${individual_id}_ddr_positive_kgen_chr19_raw.vcf \
I="${input_folder}"/s01_${individual_id}_ddr_positive_kgen_chr20_raw.vcf \
I="${input_folder}"/s01_${individual_id}_ddr_positive_kgen_chr21_raw.vcf \
I="${input_folder}"/s01_${individual_id}_ddr_positive_kgen_chr22_raw.vcf \
I="${input_folder}"/s01_${individual_id}_ddr_positive_kgen_chrX_raw.vcf \
O="${input_folder}"/s01_${individual_id}_ddr_positive_kgen_merged_raw.vcf.gz

# Completion message
echo ""
echo "Completed merging DDR positive individual genotype VCF files from 1000 Genome Project"
date
echo ""

# Finishing script
echo "Completed s01_select_${individual_id}_ddr_positive_kgen.sh"
date
echo ""
