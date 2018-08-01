#!/bin/bash
# s01_batch_analysis_2_ddr_positive_kgen_gatk4.sh

# Started: David Gilfoyle 23May2018
# Last updated: David Gilfoyle 27May2018

# Use:
# ./s01_batch_analysis_2_ddr_positive_kgen.sh &> s01_batch_analysis_2_ddr_positive_kgen.log

# Batch Analysis Relating to Selection of DDR Positive 'Test' Individuals from 1000 Genome Project (Genotype VCF Files)

# Starting script
echo "Starting s01_batch_analysis_2_ddr_positive_kgen.sh"
date
echo ""

#
# 1000 Genomes Project Individual Genotype Selection Scripts To Be Run

#
# Individual NA19131
echo "Starting s01_select_NA19131_ddr_positive_kgen.sh"
date
echo ""

./s01_select_NA19131_ddr_positive_kgen.sh &> s01_select_NA19131_ddr_positive_kgen.log

echo "Completed s01_select_NA19131_ddr_positive_kgen.sh"
date
echo ""

#
# Individual HG01198
echo "Starting s01_select_HG01198_ddr_positive_kgen.sh"
date
echo ""

./s01_select_HG01198_ddr_positive_kgen.sh &> s01_select_HG01198_ddr_positive_kgen.log

echo "Completed s01_select_HG01198_ddr_positive_kgen.sh"
date
echo ""

#
# Individual HG02977
echo "Starting s01_select_HG02977_ddr_positive_kgen.sh"
date
echo ""

./s01_select_HG02977_ddr_positive_kgen.sh &> s01_select_HG02977_ddr_positive_kgen.log

echo "Completed s01_select_HG02977_ddr_positive_kgen.sh"
date
echo ""

#
# Individual HG03120
echo "Starting s01_select_HG03120_ddr_positive_kgen.sh"
date
echo ""

./s01_select_HG03120_ddr_positive_kgen.sh &> s01_select_HG03120_ddr_positive_kgen.log

echo "Completed s01_select_HG03120_ddr_positive_kgen.sh"
date
echo ""


# Finishing script
echo "Completed s01_batch_analysis_2_ddr_positive_kgen.sh"
date
echo ""
