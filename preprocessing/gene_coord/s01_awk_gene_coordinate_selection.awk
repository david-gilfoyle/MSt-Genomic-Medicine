#!/bin/bash

# s01_awk_gene_coordinate_selection.awk

# Started: David Gilfoyle 01Apr2018
# Updated: David Gilfoyle 01Apr2018

# Selection of Chromosome, Gene Start and Gene End Coordinates from a Comma Delimited .txt File

BEGIN {FS = ","}
{print $2,$4,$5}
