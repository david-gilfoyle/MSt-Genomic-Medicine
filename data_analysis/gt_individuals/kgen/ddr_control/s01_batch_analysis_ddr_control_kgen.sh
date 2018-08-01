#!/bin/bash
# s01_batch_analysis_ddr_control_kgen_gatk4.sh

# Started: David Gilfoyle 23May2018
# Last updated: David Gilfoyle 25May2018

# Use:
# ./s01_batch_analysis_ddr_control_kgen.sh &> s01_batch_analysis_ddr_control_kgen.log

# Batch Analysis Relating to Selection of DDR Control Individuals from 1000 Genome Project (Genotype VCF Files)

# Starting script
echo "Starting s01_batch_analysis_ddr_control_kgen.sh"
date
echo ""

#
# 1000 Genomes Project Individual Genotype Selection Scripts To Be Run

#
# Individual HG00179
echo "Starting s01_select_HG00179_ddr_control_kgen.sh"
date
echo ""

./s01_select_HG00179_ddr_control_kgen.sh &> s01_select_HG00179_ddr_control_kgen.log

echo "Completed s01_select_HG00179_ddr_control_kgen.sh"
date
echo ""

#
# Individual HG00351
echo "Starting s01_select_HG00351_ddr_control_kgen.sh"
date
echo ""

./s01_select_HG00351_ddr_control_kgen.sh &> s01_select_HG00351_ddr_control_kgen.log

echo "Completed s01_select_HG00351_ddr_control_kgen.sh"
date
echo ""

#
# Individual HG02050
echo "Starting s01_select_HG02050_ddr_control_kgen.sh"
date
echo ""

./s01_select_HG02050_ddr_control_kgen.sh &> s01_select_HG02050_ddr_control_kgen.log

echo "Completed s01_select_HG02050_ddr_control_kgen.sh"
date
echo ""

#
# Individual HG02067
echo "Starting s01_select_HG02067_ddr_control_kgen.sh"
date
echo ""

./s01_select_HG02067_ddr_control_kgen.sh &> s01_select_HG02067_ddr_control_kgen.log

echo "Completed s01_select_HG02067_ddr_control_kgen.sh"
date
echo ""

#
# Individual HG02462
echo "Starting s01_select_HG02462_ddr_control_kgen.sh"
date
echo ""

./s01_select_HG02462_ddr_control_kgen.sh &> s01_select_HG02462_ddr_control_kgen.log

echo "Completed s01_select_HG02462_ddr_control_kgen.sh"
date
echo ""

#
# Individual NA19908
echo "Starting s01_select_NA19908_ddr_control_kgen.sh"
date
echo ""

./s01_select_NA19908_ddr_control_kgen.sh &> s01_select_NA19908_ddr_control_kgen.log

echo "Completed s01_select_NA19908_ddr_control_kgen.sh"
date
echo ""


# Finishing script
echo "Completed s01_batch_analysis_ddr_control_kgen.sh"
date
echo ""
