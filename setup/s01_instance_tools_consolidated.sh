#!/bin/bash

# s01_instance_tools_consolidated.sh

# Started: David Gilfoyle 14Mar2018
# Updated: David Gilfoyle 30Jul2018

# Consolidation of Tool Installation Supporting Genomic Variant Analysis

# ______________________________________________________________________
# Instalation of development tools (including GCC version 4.2)
sudo yum groupinstall "Development Tools"

# ______________________________________________________________________
# Instalation of Libxml (supporting deconstructSigs R package)
sudo yum install -y libxml2-devel

# ______________________________________________________________________
# Instalation of R
sudo yum install R

# ______________________________________________________________________
# Instalation of R-Studio
mkdir /home/ec2-user/tools/r_studio
cd /home/ec2-user/tools/r_studio
wget https://download2.rstudio.org/rstudio-server-rhel-1.1.423-x86_64.rpm
sudo yum install rstudio-server-rhel-1.1.423-x86_64.rpm

	# Checking status
	# sudo rstudio-server status

	# Set password to ec2-user: 
	# sudo passwd ec2-user

	# Connecting to R-Studio (use ec2-user and its password)
	# http://34.243.89.114:8787
	
	# Install R packages vcfR, knitr, ggplot2, dplyr

# ______________________________________________________________________	
# Instalation of Human UCSC Reference Genome (supporting deconstructSigs R package)
source("https://bioconductor.org/biocLite.R")
biocLite("BSgenome.Hsapiens.UCSC.hg19") # do not update old packages when asked

	# Install R package deconstructSigs	
	
# ______________________________________________________________________
# Instalation of Java
java -version
sudo yum remove java-1.7.0-openjdk
sudo yum install java-1.8.0

# ______________________________________________________________________
# Instalation of Python
sudo yum install python

# ______________________________________________________________________
# Instalation of xauth (install XQuartx on MacBook)
sudo yum install xauth

	# Connecting to Instance with X-Forwarding (update IP Address)
	# ssh -X -i /Users/davidgilfoyle/.ssh/dg2018_david_k02.pem -o "StrictHostKeyChecking=no" -o "UserKnownHostsFile=/dev/null" -o "LogLevel=error" ec2-user@34.243.89.114

# ______________________________________________________________________
# Instalation of BAMseek (requires xauth / XQuartz / ssh -X)
mkdir /home/ec2-user/tools/bamseek
cd /home/ec2-user/tools/bamseek
wget https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/bamseek/BAMseek2011July24.jar

	# Running BAMseek
	# java -jar /home/ec2-user/tools/bamseek/BAMseek2011July24.jar

# ______________________________________________________________________
# Instalation of GATK version 4.0.2.1
mkdir /home/ec2-user/tools/gatk
cd /home/ec2-user/tools/gatk
wget https://github.com/broadinstitute/gatk/releases/download/4.0.2.1/gatk-4.0.2.1.zip
unzip gatk-4.0.2.1.zip
rm gatk-4.0.2.1.zip

	# GATK Tools
	#/home/ec2-user/tools/gatk/gatk-4.0.2.1/gatk -h
	#/home/ec2-user/tools/gatk/gatk-4.0.2.1/gatk --list

# ______________________________________________________________________
# Instalation of GATK Tools version 3.8-1-0
mkdir /home/ec2-user/tools/gatk_3_8
cd /home/ec2-user/tools/gatk_3_8

# Download from https://software.broadinstitute.org/gatk/download/archive
# Select GATK 2-3 and then GATZ 3.8-1-0-gf15c1c3ef and download to computer - copy to instance
# File to transfer: GenomeAnalysisTK-3.8-1-0-gf15c1c3ef.tar

# Extract source code
tar -xf GenomeAnalysisTK-3.8-1-0-gf15c1c3ef.tar.bz2
rm GenomeAnalysisTK-3.8-1-0-gf15c1c3ef.tar.bz2

	# Test installation of GATK Tools
	# cd
	# java -jar /home/ec2-user/tools/gatk_3_8/GenomeAnalysisTK-3.8-1-0-gf15c1c3ef/GenomeAnalysisTK.jar -h

# ______________________________________________________________________
# Instalation of bcftools
# Prepare folder for downloading and building of htslib
mkdir /home/ec2-user/tools/bcftools
cd /home/ec2-user/tools/bcftools

# Get and extract bcftool source code
wget https://github.com/samtools/bcftools/releases/download/1.7/bcftools-1.7.tar.bz2
tar -xf bcftools-1.7.tar.bz2 # extract
rm bcftools-1.7.tar.bz2 # clean-up

# Build bcftools (compile and link)
cd bcftools-1.7 # go to the folder with downloaded code
make # sudo is not needed because we do not install anything to system areas at this step 

# Install bcftools (copy executable files to their final locations)
sudo make install # sudo is needed to install to system-wide areas

# ______________________________________________________________________
# Installation of Picard (to support use of MergeVcfs for concatination of 1000 Genome Project Genotype files)

# Installation information available at
# https://broadinstitute.github.io/picard/

# Picard requires Java Version 1.8 or above
# Check Java version installed
java -version

# Set up required directories for Picard
cd tools
mkdir picard
cd picard

# Download Picard version 2.18.2 from
# https://github.com/broadinstitute/picard/releases/tag/2.18.2

wget -nv https://github.com/broadinstitute/picard/releases/download/2.18.2/picard.jar

# Testing Picard
cd
java -jar /home/ec2-user/tools/picard/picard.jar -h
