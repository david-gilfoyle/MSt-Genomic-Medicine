#!/bin/bash
# s01_vep_annotation_or_exac.sh

# Started: Alexey Larionov 18Mar2018
# Last updated: David Gilfoyle 12Apr2018

# Use:
# ./s01_vep_annotation_or_exac.sh &> s01_vep_annotation_or_exac.log

# VEP Annotation - ExAC Full Dataset (Olfactory Receptor Gene Selection) 

# Stop at runtime errors
set -e

# Start message
echo "Started s01_vep_annotation_or_exac.sh"
date
echo ""

# Tools and settings
base_folder="/home/ec2-user"

ensembl_api_folder="${base_folder}/tools/vep"
vep_script="${ensembl_api_folder}/v91_GRCh37/ensembl-vep/vep"

# VEP plugin and custom annotation databases
cadd_snv_database="${base_folder}/resources/vep_plugins/cadd/whole_genome_SNVs.tsv.gz"
cadd_indels_database="$base_folder}/resources/vep_pluging/cadd/InDels.tsv.gz"
fathmm_mkl_database="${base_folder}/resources/vep_plugins/fathmm_mkl/fathmm-MKL_Current.tab.gz"
gerp_database="${base_folder}/resources/vep_plugins/gerp/All_hg19_RS.bw"
exac_pli_database="${base_folder}/resources/vep_plugins/exac_pli/ExACpLI_values.txt"
loftee_ancestor_database="${base_folder}/resources/vep_plugins/loftee/human_ancestor.fa.gz"
loftee_conservation_file="${base_folder}/resources/vep_plugins/loftee/phylocsf.sql"
phylop_100way_database="${base_folder}/resources/vep_plugins/phylop100way/hg19.100way.phyloP100way.bw"

# File names
working_folder="${base_folder}/results/preprocessed/exac_v1"
results_folder="${base_folder}/results/annotated/exac_v1"

raw_vcf="${working_folder}/s01_or_exac_split.vcf"
vep_vcf="${results_folder}/s01_or_exac_vep_annotated.vcf"
vep_stats="${results_folder}/s01_or_exac_vep_annotated.html"
vep_script_log="${results_folder}/s01_or_exac_vep_annotated.log"

# Selected annotations
vep_fields="Location,Allele,Uploaded_variation,Consequence,IMPACT,Codons,Amino_acids,cDNA_position,CDS_position,Protein_position,VARIANT_CLASS,Existing_variation,CLIN_SIG,SOMATIC,PHENO,SYMBOL,SYMBOL_SOURCE,HGNC_ID,GENE_PHENO,MOTIF_NAME,MOTIF_POS,HIGH_INF_POS,MOTIF_SCORE_CHANGE,NEAREST,MAX_AF,MAX_AF_POPS,gnomAD_AF,gnomAD_AFR_AF,gnomAD_AMR_AF,gnomAD_ASJ_AF,gnomAD_EAS_AF,gnomAD_FIN_AF,gnomAD_NFE_AF,gnomAD_OTH_AF,gnomAD_SAS_AF,EXON,INTRON,DOMAINS,HGVSc,HGVSp,HGVS_OFFSET,Feature_type,Feature,ALLELE_NUM,SIFT,PolyPhen,FATHMM,CADD_PHRED,CADD_RAW,FATHMM_MKL_C,FATHMM_MKL_NC,GERP,phyloP100way,ExACpLI,LoF,LoF_filter,LoF_flags,LoF_info"

export PERL5LIB="${base_folder}/resources/vep_plugins/loftee/loftee-0.3-beta:$PERL5LIB"

# Run VEP script with vcf output
perl "${vep_script}" \
  -i "${raw_vcf}" \
  -o "${vep_vcf}" --vcf \
  --stats_file "${vep_stats}" \
  --cache --offline \
  --check_ref --gencode_basic --pick \
  --variant_class --sift b --polyphen b \
  --check_existing --exclude_null_alleles \
  --symbol --gene_phenotype \
  --regulatory --nearest symbol \
  --max_af --af_gnomad \
  --numbers --domains --hgvs --allele_number \
  --vcf_info_field "CSQ" \
  --force_overwrite \
  --fields "${vep_fields}" \
  --plugin FATHMM,"python /home/ec2-user/resources/vep_plugins/fathmm/fathmm.py" \
  --plugin CADD,"${cadd_snv_database}","{$cadd_indels_database}" \
  --plugin FATHMM_MKL,"${fathmm_mkl_database}" \
  --plugin LoF,loftee_path:"${base_folder}/resources/vep_plugins/loftee/loftee-0.3-beta",human_ancestor_fa:"${loftee_ancestor_database}",conservation_file:"${loftee_conservation_file}" \
  --plugin ExACpLI,"${exac_pli_database}" \
  -custom "${gerp_database}",GERP,bigwig \
  -custom "${phylop_100way_database}",phyloP100way,bigwig \
  &> "${vep_script_log}"

# Completion message
echo ""
echo "Completed s01_vep_annotation_or_exac.sh"
date
echo ""
