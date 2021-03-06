#!/bin/bash
# s01_select_genes_icr1000_or_gatk4.sh

# Started: Alexey Larionov 15Mar2018
# Last updated: David Gilfoyle 11Apr2018

# Use:
# ./s01_select_genes_icr1000_or_gatk4.sh &> s01_select_genes_icr1000_or_gatk4.log

# Selection of Olfactory Receptor Genes from ICR1000 

# Information about GATK-4 SelectVariants:
# https://software.broadinstitute.org/gatk/documentation/tooldocs/current/org_broadinstitute_hellbender_tools_walkers_variantutils_SelectVariants.php
# https://software.broadinstitute.org/gatk/documentation/article?id=11009
# https://gatkforums.broadinstitute.org/gatk/discussion/1742/using-selectvariants-to-output-pass-records

# ICR1000 VCF file needs to be indexed using GATK IndexFeatureFile (approx. 1.5 hours)
# ./gatk IndexFeatureFile -F /home/ec2-user/resources/icr1000/1958BC_hg19.vcf

# Stop at runtime errors
set -e

# Start message
echo "Started s01_select_genes_icr1000_or_gatk4.sh"
date
echo ""

# Tools, resources, files
base_folder="/home/ec2-user"

gatk4="${base_folder}/tools/gatk_4_0/gatk-4.0.2.1/"
ref_genome="${base_folder}/resources/gatk_b37_bundle/human_g1k_v37.fasta" # GATK SelectVariants requires uncompressed reference file

icr_vcf="${base_folder}/resources/icr1000/1958BC_hg19.vcf"
genes_bed="${base_folder}/resources/gene_coord/or_gene_coordinates_grch37_13.bed"

ddr_or_icr_raw_vcf="${base_folder}/results/preprocessed/icr1000/s01_or_icr1000_raw.vcf"
ddr_or_icr_raw_log="${base_folder}/results/preprocessed/icr1000/s01_or_icr1000_raw.log"

# Select Olfactory Receptor gene variants from ICR1000
echo "Selecting OR gene variants from ICR1000 ..."

"${gatk4}"gatk SelectVariants \
  -R "${ref_genome}" \
  -V "${icr_vcf}" \
  -L "${genes_bed}" -ip 1000 \
  --exclude-filtered TRUE \
  -O "${ddr_or_icr_raw_vcf}" \
  &> "${ddr_or_icr_raw_log}"

# Completion mesage
echo ""
echo "Completed s01_select_genes_icr_or_gatk4.sh"
date
