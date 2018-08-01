#!/bin/bash

# s01_install_vep_on_aws.sh
# Installing VEP on AWS EC2 instance

# Started: Alexey Larionov 16Mar2018
# Last updated: David Gilfoyle 18Mar2018

# Use
#----

# ./s01_install_vep_on_aws.sh &> s01_install_vep_on_aws.log

# Notes
#------

# The script is intended to be executed on on Amazon Linux AMI 2017.09.1 (ami-3bfab942)
# m5.large instance (2 cores, 8GB RAM, 10Gbit network} with at least 20GB free disk space
# (VEP installation with cache and fastq takes up to 15GB). 

# The total run time may take up to 3 hrs (incl ~2 hrs for VEP cache processing in the last section).
# Consider using screen to have an opportunity to disconnect from the instance (or if the 
# internet connection may break).  Consider using tail -f log to monitor the progress.  

# The script can be copied to the instance and executed as shown in the Use section.
# However, for learning purposes you may execute commands interactively line by line in console
# (to follow and reasonably understend each step).   

# Stop at runtime errors
set -e

# Start message
echo "Started s01_install_vep_on_aws.sh"
date
echo ""

# Update system libraries as recommended by Amazon
#-------------------------------------------------

sudo yum -y update
uname -a # Version of Amazon Linux: 4.9.81-35.56.amzn1.x86_64

# Install tools required for compiling and installing software
#-------------------------------------------------------------

sudo yum -y groupinstall "Development Tools"

# Install additional libraries for Amazon Linux
#----------------------------------------------

sudo yum -y install htop # optional tool to monitor the instance resourses during the run
sudo yum -y install libpng-devel # library and tools for handling PNG files
sudo yum -y install mysql-devel # mysql database with developers tools
sudo yum -y install perl-App-cpanminus # a utility for installing PERL modules
sudo yum -y install bzip2-devel # a compressing utility, may be needed for htslib
sudo yum -y install xz-devel # a compressing utility, may be needed for htslib

# Install htslib
#---------------

# htslib is a package that is often needed for NGS data hangling.
# VEP installation issues warnings if it cant find htslib components
# (despite the fact that VEP folder, apparently, contains its own htslib). 

# Prepare folder for downloading and building of htslib
htslib_base_folder="/home/ec2-user/tools/htslib/htslib-1.7"
mkdir -p "${htslib_base_folder}" # make folder
cd "${htslib_base_folder}" # go to the folder

# Get and extract source code
wget https://github.com/samtools/htslib/releases/download/1.7/htslib-1.7.tar.bz2
tar -xf htslib-1.7.tar.bz2 # extract
rm htslib-1.7.tar.bz2 # clean-up

# Build (compile and link)
cd htslib-1.7 # go to the folder with downloaded code
make # sudo is not needed because we do not install anything to system areas at this step 

# Install (copy executable files to their final locations)
sudo make install # sudo is needed to install to system-wide areas

# Quick test
cd # return to the home folder (avoid testing from the folder, where the program was build)
tabix --help
bgzip --help
htsfile --help

# Omitted clean-up
# Most likely, the htslib_base_folder used for building the package 
# might be deleted after the installation. However, I keep it just in case. 

# Install additional PERL modules
#--------------------------------

# Check PERL version
perl -version # v5.16.3

# Install modules
cpanm --sudo DBI #cpanm --sudo DBI::DBD
cpanm --sudo DBD::mysql # PERL interface to mysql database
cpanm --sudo JSON
cpanm --sudo PerlIO::gzip
cpanm --sudo Set::IntervalTree
cpanm --sudo Compress::Zlib

# Quick check for PERL modules installation: OK if no error message
perl -e 'use DBI;' 
perl -e 'use DBI::DBD;' 
perl -e 'use DBD::mysql;'
perl -e 'use JSON;'
perl -e 'use PerlIO::gzip;'
perl -e 'use Set::IntervalTree;'
perl -e 'use Compress::Zlib;'

# Install kent source tree v335  
# This is a package required for Bio::DB::BigFile PERL module.
# The current version of kent source tree has a bug. 
# Thus, we install an older version, as described at
# http://www.ensembl.org/info/docs/tools/vep/script/vep_download.html
#----------------------------------------------------------------------------

# Make folder to download and build VEP and kent source tree
# (it will be used for VEP v 91 linked to GRCh37 cache in ~/.vep)
vep_base_folder="/home/ec2-user/tools/vep/v91_GRCh37"
mkdir -p "${vep_base_folder}" # make folder
cd "${vep_base_folder}" # go to the folder

# Get and decompress source code for kent source tree v355
wget https://github.com/ucscGenomeBrowser/kent/archive/v335_base.tar.gz
tar xzf v335_base.tar.gz # decompress
rm v335_base.tar.gz # clean-up

# Set up some environment variables 
# (required once, for the installation process only)
export KENT_SRC=$PWD/kent-335_base/src
export MACHTYPE=$(uname -m)
export CFLAGS="-fPIC"
export MYSQLINC=`mysql_config --include | sed -e 's/^-I//g'`
export MYSQLLIBS=`mysql_config --libs`

# Modify kent build parameters
cd $KENT_SRC/lib
echo 'CFLAGS="-fPIC"' > ../inc/localEnvironment.mk

# Build kent source 
# (sudo is not needed because we do not install it to system area)
make clean && make
cd ../jkOwnLib
make clean && make

# Install Bio::DB::BigFile
#------------------------

cd # return to the home folder (just in case)
cpanm --sudo Bio::DB::BigFile

# Quick test (OK if no error message)
perl -e 'use Bio::DB::BigFile;' 

# Install VEP
#------------

# Go to the VEP folder created earlier (see installing kent source tree)
#vep_base_folder="/home/ec2-user/tools/vep/v91_GRCh37"
#mkdir -p "${vep_base_folder}"
cd "${vep_base_folder}"

# Download VEP source code from github
git clone https://github.com/Ensembl/ensembl-vep.git
cd ensembl-vep # go to the downloaded vep folder

# Check VEP version and installation options
perl INSTALL.pl --help # v91.3

# Qiock check for the list of available plugins
# (its OK if it says "ERROR: No valid plugins given")
# omitted because list of plugins will be given during the installation
#perl INSTALL.pl -a p --PLUGINS list 

# The next step will take ~2hrs:
# screen may be started here, if it has not ben started earlier.

# Install VEP
# Takes up to 2hrs: mainly to convert the cache (converts ~1% per min)
# Its OK to have some warnings during the installation (not errors)
# "--AUTO acfp" requests to install API-components, Cache, Fastq and Plugins
perl INSTALL.pl \
--AUTO acfp \
--SPECIES homo_sapiens \
--ASSEMBLY GRCh37 \
--PLUGINS all

# Quick test
cd # test from the home folder
perl "${vep_base_folder}/ensembl-vep/vep" --help

# Completion message
echo "Sucessfully completed s01_install_vep_on_aws.sh"
date
