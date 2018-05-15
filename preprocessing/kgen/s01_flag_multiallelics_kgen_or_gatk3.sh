#!/bin/bash
# s01_flag_multiallelics_kgen_or_gatk3.sh

# Started: Alexey Larionov 15Mar2018
# Last updated: David Gilfoyle 20Apr2018

# Use:
# ./s01_flag_multiallelics_kgen_or_gatk3.sh &> s01_flag_multiallelics_kgen_or_gatk3.log

# Flagging of Multiallelic Variants in Olfactory Receptor Genes from 1000 Genome Project 

# VariantAnnotator is in beta-version in gatk-4.0.2.1.
# It does not have proper help and documentation on the web site.
# So, it's better to use the older stable version of GATK.

# Stop at runtime errors
set -e

# Start message
echo "Started s01_flag_multiallelics_kgen_or_gatk3.sh"
date
echo ""

# Tools, resources, files
base_folder="/home/ec2-user"

gatk3="${base_folder}/tools/gatk_3_8/GenomeAnalysisTK-3.8-1-0-gf15c1c3ef/GenomeAnalysisTK.jar"
ref_genome="${base_folder}/resources/gatk_b37_bundle/human_g1k_v37.fasta" # gatk SelectVariants requires uncompressed reference file

ddr_or_kgen_raw_vcf="${base_folder}/results/preprocessed/kgen/s01_or_kgen_merged_raw.vcf.gz"

# ma for "multi-allelic"
ddr_or_kgen_ma_vcf="${base_folder}/results/preprocessed/kgen/s01_or_kgen_ma.vcf"
ddr_or_kgen_ma_log="${base_folder}/results/preprocessed/kgen/s01_or_kgen_ma.log"

# "fma" for "flag multi-alelic"
ddr_or_kgen_fma_vcf="${base_folder}/results/preprocessed/kgen/s01_or_kgen_fma.vcf"
ddr_or_kgen_fma_log="${base_folder}/results/preprocessed/kgen/s01_or_kgen_fma.log"

# Make mask for multiallelic variants
echo "Making mask for multiallelic variants ..."
java -jar "${gatk3}" \
  -T SelectVariants \
  -R "${ref_genome}" \
  -V "${ddr_or_kgen_raw_vcf}" \
  -o "${ddr_or_kgen_ma_vcf}" \
  -restrictAllelesTo MULTIALLELIC \
  &>  "${ddr_or_kgen_ma_log}"

# Add flag to multiallelic variants 
# NB: VariantAnnotator is yet in Beta in gatk-4.0.2.1 
echo "Adding flag for multiallelic variants ..."
java -jar "${gatk3}" \
  -T VariantAnnotator \
  -R "${ref_genome}" \
  -V "${ddr_or_kgen_raw_vcf}" \
  --comp:MultiAllelic "${ddr_or_kgen_ma_vcf}" \
  -o "${ddr_or_kgen_fma_vcf}" \
  &>  "${ddr_or_kgen_fma_log}"

# Completion mesage
echo ""
echo "Completed s01_flag_multiallelics_kgen_or_gatk3.sh"
date
