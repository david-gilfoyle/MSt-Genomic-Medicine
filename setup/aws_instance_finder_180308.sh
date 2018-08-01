#!/bin/bash

# aws_instance_finder_180308
# Connecting to AWS EC2 Instance to Finder

# Created: David Gilfoyle 7 Mar 2018
# Last Updated: David Gilfoyle 8 Mar 2018

# Need to update IP address

sshfs ec2-user@54.246.243.171:/home/ec2-user \
  /Users/davidgilfoyle/Documents/aws_instance \
  -o volname=aws_instance \
  -o defer_permissions \
  -o IdentityFile="/Users/davidgilfoyle/.ssh/dg2018_david_k02.pem" \
  -o StrictHostKeyChecking="no" \
  -o UserKnownHostsFile="/dev/null" \
  -o LogLevel="error"
  
# -o follow_symlinks
