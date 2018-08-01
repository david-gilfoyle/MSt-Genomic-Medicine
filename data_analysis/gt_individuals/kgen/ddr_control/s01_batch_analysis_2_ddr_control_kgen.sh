#!/bin/bash
# s01_batch_analysis_2_ddr_control_kgen_gatk4.sh

# Started: David Gilfoyle 23May2018
# Last updated: David Gilfoyle 27May2018

# Use:
# ./s01_batch_analysis_2_ddr_control_kgen.sh &> s01_batch_analysis_2_ddr_control_kgen.log

# Batch Analysis Relating to Selection of DDR Control Individuals from 1000 Genome Project (Genotype VCF Files)

# Starting script
echo "Starting s01_batch_analysis_2_ddr_control_kgen.sh"
date
echo ""

#
# 1000 Genomes Project Individual Genotype Selection Scripts To Be Run

#
# Individual NA18504
echo "Starting s01_select_NA18504_ddr_control_kgen.sh"
date
echo ""

./s01_select_NA18504_ddr_control_kgen.sh &> s01_select_NA18504_ddr_control_kgen.log

echo "Completed s01_select_NA18504_ddr_control_kgen.sh"
date
echo ""

#
# Individual HG02952
echo "Starting s01_select_HG02952_ddr_control_kgen.sh"
date
echo ""

./s01_select_HG02952_ddr_control_kgen.sh &> s01_select_HG02952_ddr_control_kgen.log

echo "Completed s01_select_HG02952_ddr_control_kgen.sh"
date
echo ""

#
# Individual HG02981
echo "Starting s01_select_HG02981_ddr_control_kgen.sh"
date
echo ""

./s01_select_HG02981_ddr_control_kgen.sh &> s01_select_HG02981_ddr_control_kgen.log

echo "Completed s01_select_HG02981_ddr_control_kgen.sh"
date
echo ""

#
# Individual HG01055
echo "Starting s01_select_HG01055_ddr_control_kgen.sh"
date
echo ""

./s01_select_HG01055_ddr_control_kgen.sh &> s01_select_HG01055_ddr_control_kgen.log

echo "Completed s01_select_HG01055_ddr_control_kgen.sh"
date
echo ""


# Finishing script
echo "Completed s01_batch_analysis_2_ddr_control_kgen.sh"
date
echo ""
