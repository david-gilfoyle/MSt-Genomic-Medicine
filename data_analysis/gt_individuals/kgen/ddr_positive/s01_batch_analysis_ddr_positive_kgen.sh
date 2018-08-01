#!/bin/bash
# s01_batch_analysis_ddr_positive_kgen_gatk4.sh

# Started: David Gilfoyle 23May2018
# Last updated: David Gilfoyle 23May2018

# Use:
# ./s01_batch_analysis_ddr_positive_kgen.sh &> s01_batch_analysis_ddr_positive_kgen.log

# Batch Analysis Relating to Selection of DDR Positive 'Test' Individuals from 1000 Genome Project (Genotype VCF Files)

# Starting script
echo "Starting s01_batch_analysis_ddr_positive_kgen.sh"
date
echo ""

#
# 1000 Genomes Project Individual Genotype Selection Scripts To Be Run

#
# Individual NA19043
echo "Starting s01_select_NA19043_ddr_positive_kgen.sh"
date
echo ""

./s01_select_NA19043_ddr_positive_kgen.sh &> s01_select_NA19043_ddr_positive_kgen.log

echo "Completed s01_select_NA19043_ddr_positive_kgen.sh"
date
echo ""

#
# Individual HG02122
echo "Starting s01_select_HG02122_ddr_positive_kgen.sh"
date
echo ""

./s01_select_HG02122_ddr_positive_kgen.sh &> s01_select_HG02122_ddr_positive_kgen.log

echo "Completed s01_select_HG02122_ddr_positive_kgen.sh"
date
echo ""

#
# Individual HG00310
echo "Starting s01_select_HG00310_ddr_positive_kgen.sh"
date
echo ""

./s01_select_HG00310_ddr_positive_kgen.sh &> s01_select_HG00310_ddr_positive_kgen.log

echo "Completed s01_select_HG00310_ddr_positive_kgen.sh"
date
echo ""

#
# Individual HG00365
echo "Starting s01_select_HG00365_ddr_positive_kgen.sh"
date
echo ""

./s01_select_HG00365_ddr_positive_kgen.sh &> s01_select_HG00365_ddr_positive_kgen.log

echo "Completed s01_select_HG00365_ddr_positive_kgen.sh"
date
echo ""

#
# Individual HG02623
echo "Starting s01_select_HG02623_ddr_positive_kgen.sh"
date
echo ""

./s01_select_HG02623_ddr_positive_kgen.sh &> s01_select_HG02623_ddr_positive_kgen.log

echo "Completed s01_select_HG02623_ddr_positive_kgen.sh"
date
echo ""

#
# Individual NA19834
echo "Starting s01_select_NA29834_ddr_positive_kgen.sh"
date
echo ""

./s01_select_NA19834_ddr_positive_kgen.sh &> s01_select_NA19834_ddr_positive_kgen.log

echo "Completed s01_select_NA19834_ddr_positive_kgen.sh"
date
echo ""

#
# Individual HG02121
echo "Starting s01_select_HG02121_ddr_positive_kgen.sh"
date
echo ""

./s01_select_HG02121_ddr_positive_kgen.sh &> s01_select_HG02121_ddr_positive_kgen.log

echo "Completed s01_select_HG02121_ddr_positive_kgen.sh"
date
echo ""


# Finishing script
echo "Completed s01_batch_analysis_ddr_positive_kgen.sh"
date
echo ""
