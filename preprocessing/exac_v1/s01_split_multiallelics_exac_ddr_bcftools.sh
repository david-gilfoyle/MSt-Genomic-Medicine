#!/bin/bash
# s01_split_multiallelics_exac_ddr_bcftools.sh

# Started: Alexey Larionov 18Mar2018
# Last updated: David Gilfoyle 01Apr2018

# Use:
# ./s01_split_multiallelics_exac_ddr_bcftools.sh &> s01_split_multiallelics_exac_ddr_bcftools.log

# Splitting Multiallelic Variants in DNA Repair Genes from ExAC release 1 (full dataset) 

#References

#http://www.htslib.org/doc/bcftools.html
#https://genome.sph.umich.edu/wiki/Variant_Normalization

# Examples

#bcftools norm -f human_g1k_v37.fasta -m -both 
#https://github.com/samtools/bcftools/issues/84

#bcftools norm -m-any -f GRCh37.fa - > gtless.vcf 
#https://www.biostars.org/p/189752

#bcftools norm -Ou -m -any input.vcf.gz |  bcftools norm -Ou -f human_g1k_v37.fasta 
# http://apol1.blogspot.co.uk/2014/11/best-practice-for-converting-vcf-files.html

# bcftools norm does not accept heterozygous counts in the raw Exac file
# because het counts do not complain to VCF specs in multiallelic sites.
# For instance, for a site with two ALTs the raw Exac file gives 3 Het counts,
# which is conceptually reasonable, fut formally does not fit into current VCF specs. 

# Stop at runtime errors
set -e

# Start message
echo "Started s01_split_multiallelics_exac_ddr_bcftools.sh"
date
echo ""

# Tools, resources, files
base_folder="/home/ec2-user"
ref_genome="${base_folder}/resources/gatk_b37_bundle/human_g1k_v37.fasta"

fma_vcf="${base_folder}/results/preprocessed/exac_v1/s01_ddr_exac_fma.vcf"

clean_vcf="${base_folder}/results/preprocessed/exac_v1/s01_ddr_exac_clean.vcf"
split_vcf="${base_folder}/results/preprocessed/exac_v1/s01_ddr_exac_split.vcf"

# Remove fields that don't comply with VCF specs in multiallelic variants
echo "Removing non-compliant fields ..."

bcftools annotate \
  -x INFO/AC_Het,INFO/Het_AFR,INFO/Het_AMR,INFO/Het_EAS,INFO/Het_FIN,INFO/Het_NFE,INFO/Het_OTH,INFO/Het_SAS \
  "${fma_vcf}" -o "${clean_vcf}"

# Split multiallelic sites
echo "Splitting multiallelic sites ..."

bcftools norm -m-both "${clean_vcf}" -o "${split_vcf}"

# Completion mesage
echo ""
echo "Completed s01_split_multiallelics_exac_ddr_bcftools.sh"
date
