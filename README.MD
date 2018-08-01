MSt Genomic Medicine 2016-2018  
University of Cambridge

Research Project:  
Exploring germline variation in DNA damage response genes in publicly available genomic datasets

Study aims:  
DDR deficiencies cause a range of human disorders, with deleterious genetic variants having been most extensively studied in tumours. Although potentially contributing to accelerated accumulation of DNA damage, with the associated impact on longer-term health, the burden of inherited deleterious DDR gene variants in control/healthy populations remains understudied.
The aim of this study was to evaluate the burden of total and deleterious DDR gene variants in publicly available population sequence datasets. A set of OR genes was similarly assessed to put the impact of DDR variants into perspective, allowing deleterious variant frequency to be compared between DDR and neutrally evolving OR genes. In addition, an assessment of total variant burden and mutational signatures was performed, which in theory, could differ between DDR-affected and unaffected individuals.

Study objectives:  
1)	Establish an AWS cloud computing instance with tools/resources required for VCF file processing including assessment, annotation, filtering/prioritisation and analysis of selected variant datasets
2)	Establish up to date lists of key DDR and active OR genes
3)	Characterise germline variants in selected DDR and OR genes across individuals in the ExAC (non-TCGA), ICR1000 and 1000GP population sequence datasets
4)	Similarly characterise rare deleterious LoF, missense and non-coding variants in DDR genes and identify individuals with deleterious LoF/missense variants
5)	Compare the number of rare deleterious LoF/missense variants in DDR and OR genes following normalisation against total coding sequence length
6)	Compare total variant burden and germline mutational signatures in selected DDR-affected individuals (with rare high-confidence LoF variants) and ethnicity-matched control individuals (with no LoF variants or missense variants considered deleterious)

Script archive folder structure and contents:  
1) Setup - AWS instance tool installation; Ensembl VEP/plugins/custom annotation installation; genomic dataset download
2) Pre-processing - DDR/OR gene selection; splitting multiallelic sites; QC checks (variant counts and bcftool vcf-stats) 
3) Annotation - Ensembl VEP annotation
4) R import - Import of VEP annotated datasets into R
5) Filtration - Hard filtration of datasets (QUAL, GQ, genotype call rate and zero AC filtering); additional variant filtering (AF, LoF, missense and non-coding)
6) R export - Export of VCF files following hard filtering to support QC checks (bcftools vcf-stats)
7) Data analysis - Characterisation of variants in datasets; calculation of longest transcript CCDS length over selected DDR and OR genes; identification of individuals in 1000 Genomes Project and ICR1000 with deleterious DDR gene variants; extraction of selected individual genotypes; analysis of germline mutational signatures in selected individuals