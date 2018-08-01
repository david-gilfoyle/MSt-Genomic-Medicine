#!/bin/bash

# s01_post_hard_filtering_qc_or.sh
# VCF File Quality Control Following Hard Filtering

# Created: David Gilfoyle 13 Jun 2018
# Last Updated: David Gilfoyle 13 Jun 2018

# Use:
# ./s01_post_hard_filtering_qc_or.sh &> s01_post_hard_filtering_qc_or.log

# Data extracted from r - only first 8 columns used - see r script

# Following extraction header line removed and replaced by minimal VCF header
# grep -v "CHROM" input_file > output_file
# cat header_file input_file > output_file

# header_file contained
##fileformat=VCFv4.2
#CHROM	POS	ID	REF	ALT	QUAL	FILTER	INFO

# File compressed and indexed
# bgzip -c input_file > output_file
# tabix -f input_file

# Stop at runtime errors
set -e

# Start message
echo "Starting Post Hard Filtering Quality Control (Olfactory Receptor Genes)"
date
echo ""

# Tools, resources, files
base_folder="/home/ec2-user"
filtered_file_exac="${base_folder}/results/r_export/exac_nontcga_or_qual_filt_header.vcf.gz"
filtered_file_icr1000="${base_folder}/results/r_export/icr1000_or_gq_filt_header.vcf.gz"
filtered_file_kgen="${base_folder}/results/r_export/kgen_or_ac_filt_header.vcf.gz"

vcf_stats_folder="${base_folder}/results/r_export/vcf_stats/"

bcftools="${base_folder}/tools/bcftools/bcftools-1.7/bcftools"
plot_vcfstats="${base_folder}/tools/bcftools/bcftools-1.7/misc/plot-vcfstats"
ref_genome="${base_folder}/resources/gatk_b37_bundle/human_g1k_v37.fasta"

# Assessment of QUAL Filtered ExAC (non-TCGA) VCF File
#_______________________________________________________________________

echo "QUAL Filtered ExAC (non-TCGA) VCF File:" "${filtered_file_exac}"

# Running vcf-stats

mkdir -p "${vcf_stats_folder}exac_v1/or/"
"${bcftools}" stats -F "${ref_genome}" "${filtered_file_exac}" > "${vcf_stats_folder}exac_v1/or/exac_nontcga_or_qual_filtered_vcfstats.txt" 
"${plot_vcfstats}" "${vcf_stats_folder}exac_v1/or/exac_nontcga_or_qual_filtered_vcfstats.txt" -p "${vcf_stats_folder}exac_v1/or/"
echo ""

# Assessment of GQ Filtered ICR1000 VCF File
#_______________________________________________________________________

echo "GQ Filtered ICR1000 VCF File:" "${filtered_file_icr1000}"

# Running vcf-stats

mkdir -p "${vcf_stats_folder}icr1000/or/"
"${bcftools}" stats -F "${ref_genome}" "${filtered_file_icr1000}" > "${vcf_stats_folder}icr1000/or/icr1000_or_qual_filtered_vcfstats.txt" 
"${plot_vcfstats}" "${vcf_stats_folder}icr1000/or/icr1000_or_qual_filtered_vcfstats.txt" -p "${vcf_stats_folder}icr1000/or/"
echo ""

# Assessment of AC Filtered 1000 Genomes Project VCF File
#_______________________________________________________________________

echo "AC Filtered 1000 Genomes Project VCF File:" "${filtered_file_kgen}"

# Running vcf-stats

mkdir -p "${vcf_stats_folder}kgen/or/"
"${bcftools}" stats -F "${ref_genome}" "${filtered_file_kgen}" > "${vcf_stats_folder}kgen/or/kgen_or_qual_filtered_vcfstats.txt" 
"${plot_vcfstats}" "${vcf_stats_folder}kgen/or/kgen_or_qual_filtered_vcfstats.txt" -p "${vcf_stats_folder}kgen/or/"
echo ""

# End message
echo "Finishing Post Hard Filtering Quality Control (Olfactory Receptor Genes)"
date
echo ""
