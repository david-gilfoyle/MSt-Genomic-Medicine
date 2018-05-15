#!/bin/bash

# s01_gene_coordinate_selection.sh

# Started: David Gilfoyle 01Apr2018
# Updated: David Gilfoyle 01Apr2018

# Use:
# ./s01_gene_coordinate_selection.sh

# Creation of DNA Repair and Olfactory Receptor Gene Coordinate .bed Files Using awk and cut

base_folder="/home/ec2-user/resources/gene_coord"

awk -f s01_awk_gene_coordinate_selection.awk ${base_folder}/dna_repair_gene_coordinates_grch37_13.txt > ${base_folder}/temp1.txt
grep -v 'Chromo' ${base_folder}/temp1.txt > ${base_folder}/dna_repair_gene_coordinates_grch37_13.bed
rm ${base_folder}/temp1.txt
awk -f s01_awk_gene_coordinate_selection.awk ${base_folder}/or_gene_coordinates_grch37_13.txt > ${base_folder}/temp1.txt
grep -v 'Chromo' ${base_folder}/temp1.txt > ${base_folder}/or_gene_coordinates_grch37_13.bed
rm ${base_folder}/temp1.txt
