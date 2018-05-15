#!/bin/bash

# s01_preprocessing_qc_icr1000_ddr.sh
# ICR1000 (DNA Repair Genes) Preprocessed File Quality Control

# Created: David Gilfoyle 22 Apr 2018
# Last Updated: David Gilfoyle 22 Apr 2018

# Use:
# ./s01_preprocessing_qc_icr1000_ddr.sh &> s01_preprocessing_qc_icr1000_ddr.log

# Stop at runtime errors
set -e

# Start message
echo "Starting Preprocessed ICR1000 File Quality Control (DNA Repair Genes)"
date
echo ""

# Tools, resources, files
base_folder="/home/ec2-user"
full_file="${base_folder}/resources/icr1000/1958BC_hg19.vcf.gz"
raw_file="${base_folder}/results/preprocessed/icr1000/s01_ddr_icr1000_raw.vcf"
ma_file="${base_folder}/results/preprocessed/icr1000/s01_ddr_icr1000_ma.vcf"
fma_file="${base_folder}/results/preprocessed/icr1000/s01_ddr_icr1000_fma.vcf"
split_file="${base_folder}/results/preprocessed/icr1000/s01_ddr_icr1000_split.vcf"

vcf_stats_folder="${base_folder}/results/preprocessed/vcf_stats/icr1000_ddr/"
vcf_stats1="${base_folder}/results/preprocessed/vcf_stats/icr1000_ddr/icr1000_downloaded_vcfstats.txt"
vcf_stats2="${base_folder}/results/preprocessed/vcf_stats/icr1000_ddr/icr1000_ddr_split_vcfstats.txt"

bcftools="${base_folder}/tools/bcftools/bcftools-1.7/bcftools"
plot_vcfstats="${base_folder}/tools/bcftools/bcftools-1.7/misc/plot-vcfstats"
ref_genome="${base_folder}/resources/gatk_b37_bundle/human_g1k_v37.fasta"

# Assessment of Source VCF File
#_______________________________________________________________________

echo "Source VCF File:" "${full_file}"

# Counting variants in VCF file

vars_no=$(zgrep -vc "^#" "${full_file}")
echo "Num of variants:" $(printf "%'d" "${vars_no}")
  
# Counting samples in VCF file

header_line=$(zgrep -m 1 "^#CHROM" "${full_file}")
columns_no=$(wc -w <<< "${header_line}")
samples_no=$(( ${columns_no} - 9 ))
echo "Num of samples:" $(printf "%'d" "${samples_no}")
echo ""

# Running vcf-stats

# Notes: vcfstats is a part of bcftools, which should already be installed in your toolset. 
# Running vcfstats includes two steps: 1) collect the stats and 2) plot the stats.  
# plot_vcfstats is a script that should be present in the "bin" folder of bcftools 
# (may be available system-wide, if bcftools were installed w/o prefix) 

# mkdir -p "${vcf_stats_folder}downloaded/"
# "${bcftools}" stats -F "${ref_genome}" "${full_file}" > "${vcf_stats1}" 
# "${plot_vcfstats}" "${vcf_stats1}" -p "${vcf_stats_folder}downloaded/"
# echo ""

# Assessment of Gene Selected VCF File
#_______________________________________________________________________

echo "DDR / OR Gene Selected VCF File:" "${raw_file}"

# Counting variants in VCF file

vars_no=$(grep -vc "^#" "${raw_file}")
echo "Num of variants:" $(printf "%'d" "${vars_no}")
  
# Counting samples in VCF file

header_line=$(grep -m 1 "^#CHROM" "${raw_file}")
columns_no=$(wc -w <<< "${header_line}")
samples_no=$(( ${columns_no} - 9 ))
echo "Num of samples:" $(printf "%'d" "${samples_no}")
echo ""


# Assessment of Multialleleic Masked VCF File
#_______________________________________________________________________

echo "Multialleleic Masked VCF File:" "${ma_file}"

# Counting variants in VCF file

vars_no=$(grep -vc "^#" "${ma_file}")
echo "Num of variants:" $(printf "%'d" "${vars_no}")
  
# Counting samples in VCF file

header_line=$(grep -m 1 "^#CHROM" "${ma_file}")
columns_no=$(wc -w <<< "${header_line}")
samples_no=$(( ${columns_no} - 9 ))
echo "Num of samples:" $(printf "%'d" "${samples_no}")
echo ""


# Assessment of Multialleleic Flagged VCF File
#_______________________________________________________________________

echo "Multialleleic Flagged VCF File:" "${fma_file}"

# Counting variants in VCF file

vars_no=$(grep -vc "^#" "${fma_file}")
echo "Num of variants:" $(printf "%'d" "${vars_no}")
  
# Counting samples in VCF file

header_line=$(grep -m 1 "^#CHROM" "${fma_file}")
columns_no=$(wc -w <<< "${header_line}")
samples_no=$(( ${columns_no} - 9 ))
echo "Num of samples:" $(printf "%'d" "${samples_no}")
echo ""


# Assessment of Multialleleic Split VCF File
#_______________________________________________________________________

echo "Multialleleic Split VCF File:" "${split_file}"

# Counting variants in VCF file

vars_no=$(grep -vc "^#" "${split_file}")
echo "Num of variants:" $(printf "%'d" "${vars_no}")
  
# Counting samples in VCF file

header_line=$(grep -m 1 "^#CHROM" "${split_file}")
columns_no=$(wc -w <<< "${header_line}")
samples_no=$(( ${columns_no} - 9 ))
echo "Num of samples:" $(printf "%'d" "${samples_no}")
echo ""

# Running vcf-stats

# Notes: vcfstats is a part of bcftools, which should already be installed in your toolset. 
# Running vcfstats includes two steps: 1) collect the stats and 2) plot the stats.  
# plot_vcfstats is a script that should be present in the "bin" folder of bcftools 
# (may be available system-wide, if bcftools were installed w/o prefix) 

# mkdir -p "${vcf_stats_folder}split/"
# "${bcftools}" stats -F "${ref_genome}" "${split_file}" > "${vcf_stats2}" 
# "${plot_vcfstats}" "${vcf_stats2}" -p "${vcf_stats_folder}split/"
# echo ""

# End message
echo "Finishing Preprocessed ICR1000 File Quality Control (DNA Repair Genes)"
date
echo ""
