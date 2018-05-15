#!/bin/bash
# s01_select_genes_exac_nontcga_ddr_gatk4.sh

# Started: Alexey Larionov 15Mar2018
# Last updated: David Gilfoyle 01Apr2018

# Use:
# ./s01_select_genes_exac_nontcga_ddr_gatk4.sh &> s01_select_genes_exac_nontcga_ddr_gatk4.log

# Selection of DNA Repair Genes from ExAC release 1 (nonTCGA subset) 

# Information about GATK-4 SelectVariants:
# https://software.broadinstitute.org/gatk/documentation/tooldocs/current/org_broadinstitute_hellbender_tools_walkers_variantutils_SelectVariants.php
# https://software.broadinstitute.org/gatk/documentation/article?id=11009
# https://gatkforums.broadinstitute.org/gatk/discussion/1742/using-selectvariants-to-output-pass-records

# ExAC VCF file needs to be indexed using GATK IndexFeatureFile
# ./gatk IndexFeatureFile -F /home/ec2-user/resources/exac_v1/ExAC_nonTCGA.r1.sites.vep.vcf.gz

# Stop at runtime errors
set -e

# Start message
echo "Started s01_select_genes_exac_nontcga_ddr_gatk4.sh"
date
echo ""

# Tools, resources, files
base_folder="/home/ec2-user"

gatk4="${base_folder}/tools/gatk_4_0/gatk-4.0.2.1/"
ref_genome="${base_folder}/resources/gatk_b37_bundle/human_g1k_v37.fasta" # GATK SelectVariants requires uncompressed reference file

exac_vcf="${base_folder}/resources/exac_v1/ExAC_nonTCGA.r1.sites.vep.vcf.gz"
genes_bed="${base_folder}/resources/gene_coord/dna_repair_gene_coordinates_grch37_13.bed"

ddr_or_exac_raw_vcf="${base_folder}/results/preprocessed/exac_v1/s01_ddr_exac_nontcga_raw.vcf"
ddr_or_exac_raw_log="${base_folder}/results/preprocessed/exac_v1/s01_ddr_exac_nontcga_raw.log"

# Select DNA Repair gene variants from non-TCGA ExAC
echo "Selecting DDR gene variants from non-TCGA ExAC ..."

"${gatk4}"gatk SelectVariants \
  -R "${ref_genome}" \
  -V "${exac_vcf}" \
  -L "${genes_bed}" -ip 1000 \
  --exclude-filtered TRUE \
  -O "${ddr_or_exac_raw_vcf}" \
  &> "${ddr_or_exac_raw_log}"

# Completion mesage
echo ""
echo "Completed s01_select_genes_exac_nontcga_ddr_gatk4.sh"
date
