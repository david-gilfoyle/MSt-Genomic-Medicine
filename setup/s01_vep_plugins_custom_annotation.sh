#!/bin/bash

# s01_vep_plugins_custom_annotation.sh

# Started: David Gilfoyle 30Jun2018
# Updated: David Gilfoyle 30Jun2018

# Instalation of VEP annotation tools (Plugins and Custom Annotation)
# To be performed following VEP installation (s01_install_vep_on_aws.sh)


# ______________________________________________________________________
# Installation of FATHMM-MKL (VEP plugin)
# Plugin requires installation - see https://github.com/HAShihab/fathmm-MKL
# Installation requires Python (tested with Python 2.7)

mkdir /home/ec2-user/resources/vep_plugins/fathmm_mkl
cd /home/ec2-user/resources/vep_plugins/fathmm_mkl
wget -nv http://fathmm.biocompute.org.uk/database/fathmm-MKL_Current.tab.gz # ~90 Gb
tabix fathmm-MKL_Current.tab.gz

# MD5 checksum from website: b8f4dd120586a34c82d5cc87cfe2a4ca
# MD5 checksum following download 
	
	
# ______________________________________________________________________
# Installation of FATHMM (VEP plugin)
# Plugin requires installation - see https://github.com/Ensembl/VEP_plugins/blob/release/91/FATHMM.pm for details
# Installation requires MySQL and Python & Python MySQLdb (tested with Python 2.6/2.7)

# https://github.com/Ensembl/VEP_plugins/blob/release/91/FATHMM.pm
# https://github.com/HAShihab/fathmm
# http://fathmm.biocompute.org.uk/inherited.html

# Prepare folder for FATHMM python script
base_folder="/home/ec2-user"
mkdir "${base_folder}/tools/fathmm"
cd "${base_folder}/tools/fathmm"

# Download python script fathmm.py (this is not PERL plugin module!)
wget https://raw.githubusercontent.com/HAShihab/fathmm/master/cgi-bin/fathmm.py

# Make config file in the folder containing fathmm.py (note -e option)
# This config file will be needed for the script to run 
# Note the password (mysql_pass) it wil be used late during the database configuration  
echo -e "[DATABASE]\nHOST = 127.0.0.1\nPORT = 3306\nUSER = root\nPASSWD = mysql_pass\nDB = fathmm\n" > config.ini

# Download source file for FATHMM SQL database
# wget ftp://supfam2.cs.bris.ac.uk/FATHMM/database/fathmm.v2.1.SQL
wget http://fathmm.biocompute.org.uk/database/fathmm.v2.3.SQL.gz # ~9 Gb
gunzip fathmm.v2.3.SQL.gz # expands to ~22 Gb, takes several minutes, no need in md5 check if unzip is successful

# Install mysql client and server
sudo yum install mysql # mysql client
sudo yum install mysql-server # mysql server

# Start mysql server
sudo service mysqld start 

# The server should be started each time after launching a new instance
# Instead of doing it manually, it may be added to .profile (or.bashrc):
# https://serverfault.com/questions/261802/what-are-the-functional-differences-between-profile-bash-profile-and-bashrc
echo "sudo service mysqld start" >> /home/ec2-user/.profile

# Default mySQL settings for a local database:
# host: 127.0.0.1 (or localhost)
# port: 3306
# user: root
# pass: no password set for root by default

# Create empty mysql database called fathmm
# When asked for password, leave it empty: no password has yet been set for root
mysql -h 127.0.0.1 -P 3306 -u root -p -e "CREATE DATABASE fathmm"

# Import content from the source file to the database
# This writes ~22 Gb to the mySQL database area (the source file will not be needed after this)
# Consider using screen: may take about 30-40 min (on m5.large): use screen; 
# Make sure you are still in folder containing fathmm.v2.3.SQL file (or include the full path)
mysql -h 127.0.0.1 -P 3306 -u root -p -D fathmm < fathmm.v2.3.SQL 

# Remove the source file
rm fathmm.v2.3.SQL

# Test access to FATHMM database
mysql -h 127.0.0.1 -P 3306 -u root -p -e "SHOW DATABASES"
mysql -h 127.0.0.1 -P 3306 -u root -p -e "USE fathmm; SHOW TABLES"

# Set password for root (mysql_pass)
# https://uk.godaddy.com/help/reset-your-root-mysql-password-linux-17548
mysql -h 127.0.0.1 -P 3306 -u root -p -e "USE mysql; update user set password=PASSWORD('mysql_pass') where User='root';flush privileges;"

# Install python mysql library
which python
python --version
# dont upgrade pip !
sudo pip install mysqlclient

# Test python library (there should be no errors)
python -c "import MySQLdb"

# Copy the plugin PERL module FATHMM.pm to the vep plugins folder
cd "${base_folder}/.vep/Plugins"
wget https://raw.githubusercontent.com/Ensembl/VEP_plugins/release/91/FATHMM.pm
	

# ______________________________________________________________________
# Installation of CADD (VEP plugin)
# Plugin requires installation - see https://github.com/Ensembl/VEP_plugins/blob/release/91/CADD.pm for details
# Need to cite http://www.ncbi.nlm.nih.gov/pubmed/24487276
# CADD score databases available from http://cadd.gs.washington.edu/download
# Download All possible SNVs of GRCh37/hg19 file and tabix index and 1000 phase 3 genome variants (SNVs and indels)

mkdir -p /home/ec2-user/resources/vep_plugins/cadd/
cd /home/ec2-user/resources/vep_plugins/cadd/
wget -nv http://krishna.gs.washington.edu/download/CADD/v1.3/whole_genome_SNVs.tsv.gz #85.22 Gb
wget -nv http://krishna.gs.washington.edu/download/CADD/v1.3/whole_genome_SNVs.tsv.gz.tbi
wget -nv http://krishna.gs.washington.edu/download/CADD/v1.3/1000G_phase3.tsv.gz #885 Mb
wget -nv http://krishna.gs.washington.edu/download/CADD/v1.3/1000G_phase3.tsv.gz.tbi


# ______________________________________________________________________
# Installation of ExAC pLI Scores (VEP plugin)
# Plugin requires installation - see https://github.com/Ensembl/VEP_plugins/blob/release/91/ExACpLI.pm for details

mkdir -p /home/ec2-user/resources/vep_plugins/exac_pli/
cd /home/ec2-user/resources/vep_plugins/exac_pli/
wget -nv https://github.com/Ensembl/VEP_plugins/blob/release/91/ExACpLI_values.txt # This downloads an .html file which does not work - need to copy/paste GitHub data into blank .txt file


# ______________________________________________________________________
# Installation of LOFTEE (VEP plugin)
# Plugin requires installation - see https://github.com/konradjk/loftee/blob/master/LoF.pm for details

# https://github.com/konradjk/loftee/blob/master/README.md
# also see LoF.pm

# Main LOFTEE source data available from https://github.com/konradjk/loftee
# Requires:
# Perl >= version 5.10.1
# Installation of MoreUtils and perl-DBD-SQLite : needed?
# Installation of Samtools (and ncurses development tool)
# Download of human_ancestor.fa file/indexes
# Download of PhyloCSF database
# Download loftee scripts

# Check perl version
perl --version # version 5.16.3

# Allow connection to a SQLite database using Perl DBI: Why?
sudo yum -y install perl-DBD-SQLite

# Install MoreUtils needed by LOFTEE: Why?
cpanm --sudo List::MoreUtils

# Install ncurses development tool required by samtools
sudo yum -y install ncurses-devel

# Install samtools
base_folder="/home/ec2-user"
mkdir -p "${base_folder}/tools/samtools"
cd "${base_folder}/tools/samtools"

wget https://github.com/samtools/samtools/releases/download/1.7/samtools-1.7.tar.bz2
tar -xjvf samtools-1.7.tar.bz2
rm samtools-1.7.tar.bz2

cd samtools-1.7
./configure
make
sudo make install

cd
samtools --help

# Download human_ancestor.fa file (includes index files in a format suitable for Samtools 1.x)
mkdir -p "${base_folder}/resources/loftee"
cd "${base_folder}/resources/loftee"
wget https://s3.amazonaws.com/bcbio_nextgen/human_ancestor.fa.gz
wget https://s3.amazonaws.com/bcbio_nextgen/human_ancestor.fa.gz.fai
wget https://s3.amazonaws.com/bcbio_nextgen/human_ancestor.fa.gz.gzi

# Download and unzip SQL Conservation Database (phylocsf.sql.gz) 
wget https://www.broadinstitute.org/~konradk/loftee/phylocsf.sql.gz
gunzip phylocsf.sql.gz

# Download loftee scripts (for the last stable version 0.3 beta)
# https://github.com/konradjk/loftee/issues/23
mkdir "${base_folder}/tools/loftee"
cd "${base_folder}/tools/loftee"
wget https://github.com/konradjk/loftee/archive/v0.3-beta.zip
unzip v0.3-beta.zip # makes folder loftee-0.3-beta
rm v0.3-beta.zip

# Compare the downloaded plugin with the one installed with VEP
# diff "${base_folder}/tools/loftee/loftee-0.3-beta/LoF.pm" "${base_folder}/.vep/Plugins/LoF.pm"

# Change version of loftee plugin in the default plugins folder
mv "${base_folder}/.vep/Plugins/LoF.pm" "${base_folder}/.vep/Plugins/LoF.pm.new"
cp "${base_folder}/tools/loftee/loftee-0.3-beta/LoF.pm" "${base_folder}/.vep/Plugins/LoF.pm"


# ______________________________________________________________________	
# Installation of GERP bigWig file for GRCh37 Assembly (VEP custom annotation)
# Details concerning custom annotations available from https://www.ensembl.org/info/docs/tools/vep/script/vep_custom.html
# Details of bigWig file download available from https://www.ensembl.org/info/docs/tools/vep/script/vep_example.html

mkdir -p /home/ec2-user/resources/vep_plugins/gerp/
cd /home/ec2-user/resources/vep_plugins/gerp/
wget -nv ftp://hgdownload.soe.ucsc.edu/gbdb/hg19/bbi/All_hg19_RS.bw #7.58Gb


# ______________________________________________________________________
# Installation of phylop100way bigWig file for GRCh37 Assembly (VEP custom annotation)
# Details concerning custom annotations available from https://www.ensembl.org/info/docs/tools/vep/script/vep_custom.html
# Details of bigWig file download available from https://www.ensembl.org/info/docs/tools/vep/script/vep_example.html

mkdir -p /home/ec2-user/resources/vep_plugins/phylop100way/hg19.100way.phylop100way/
cd /home/ec2-user/resources/vep_plugins/phylop100way/
wget -nv http://hgdownload.cse.ucsc.edu/goldenpath/hg19/phyloP100way/hg19.100way.phyloP100way.bw #9.56Gb
wget -nv http://hgdownload.cse.ucsc.edu/goldenpath/hg19/phyloP100way/hg19.100way.phyloP100way.mod
wget -nv http://hgdownload.cse.ucsc.edu/goldenpath/hg19/phyloP100way/md5sum.txt

cd /home/ec2-user/resources/vep_plugins/phylop100way/hg19.100way.phylop100way/
wget -nv http://hgdownload.cse.ucsc.edu/goldenpath/hg19/phyloP100way/hg19.100way.phyloP100way/ # download multiple files
