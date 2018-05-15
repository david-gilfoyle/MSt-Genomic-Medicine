#!/bin/bash

# s01_preprocessing_qc_kgen_or.sh
# 1000 Genome Project (Olfactory Receptor Genes) Preprocessed File Quality Control

# Created: David Gilfoyle 22 Apr 2018
# Last Updated: David Gilfoyle 22 Apr 2018

# Use:
# ./s01_preprocessing_qc_kgen_or.sh &> s01_preprocessing_qc_kgen_or.log

# Stop at runtime errors
set -e

# Start message
echo "Starting Preprocessed 1000 Genome Project File Quality Control (Olfactory Receptor Genes)"
date
echo ""

# Tools, resources, files
base_folder="/home/ec2-user"
raw_file="${base_folder}/results/preprocessed/kgen/s01_or_kgen_merged_raw.vcf.gz"
ma_file="${base_folder}/results/preprocessed/kgen/s01_or_kgen_ma.vcf"
fma_file="${base_folder}/results/preprocessed/kgen/s01_or_kgen_fma.vcf"
split_file="${base_folder}/results/preprocessed/kgen/s01_or_kgen_split.vcf"
fixed_file="${base_folder}/results/preprocessed/kgen/s01_or_kgen_split_fixed.vcf"

vcf_stats_folder="${base_folder}/results/preprocessed/vcf_stats/kgen_or/"
vcf_stats2="${base_folder}/results/preprocessed/vcf_stats/kgen_or/kgen_or_split_fixed_vcfstats.txt"

bcftools="${base_folder}/tools/bcftools/bcftools-1.7/bcftools"
plot_vcfstats="${base_folder}/tools/bcftools/bcftools-1.7/misc/plot-vcfstats"
ref_genome="${base_folder}/resources/gatk_b37_bundle/human_g1k_v37.fasta"

# Assessment of Source VCF File
#_______________________________________________________________________
# For QC data relating to the 1000 Genome Project VCF file - refer to the corresponding DDR folder


# Assessment of Gene Selected VCF File
#_______________________________________________________________________

echo "DDR / OR Gene Selected VCF File:" "${raw_file}"

# Counting variants in VCF file

vars_no=$(zgrep -vc "^#" "${raw_file}")
echo "Num of variants:" $(printf "%'d" "${vars_no}")
  
# Counting samples in VCF file

header_line=$(zgrep -m 1 "^#CHROM" "${raw_file}")
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


# Assessment of Multialleleic Split Fixed VCF File
#_______________________________________________________________________

echo "Multialleleic Split Fixed VCF File:" "${fixed_file}"

# Counting variants in VCF file

vars_no=$(grep -vc "^#" "${fixed_file}")
echo "Num of variants:" $(printf "%'d" "${vars_no}")
  
# Counting samples in VCF file

header_line=$(grep -m 1 "^#CHROM" "${fixed_file}")
columns_no=$(wc -w <<< "${header_line}")
samples_no=$(( ${columns_no} - 9 ))
echo "Num of samples:" $(printf "%'d" "${samples_no}")
echo ""

# Running vcf-stats

# Notes: vcfstats is a part of bcftools, which should already be installed in your toolset. 
# Running vcfstats includes two steps: 1) collect the stats and 2) plot the stats.  
# plot_vcfstats is a script that should be present in the "bin" folder of bcftools 
# (may be available system-wide, if bcftools were installed w/o prefix) 

mkdir -p "${vcf_stats_folder}split/"
"${bcftools}" stats -F "${ref_genome}" "${fixed_file}" > "${vcf_stats2}" 
"${plot_vcfstats}" "${vcf_stats2}" -p "${vcf_stats_folder}split/"
echo ""

# End message
echo "Finishing Preprocessed 1000 Genome Project File Quality Control (Olfactory Receptor Genes)"
date
echo ""
