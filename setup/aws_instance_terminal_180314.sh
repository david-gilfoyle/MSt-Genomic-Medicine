# !/bin/bash

# aws_instance_terminal_180308
# Connecting AWS EC2 Instance to Terminal

# Created: David Gilfoyle 8 Mar 2018
# Last Updated: David Gilfoyle 14 Mar 2018

# Need to update IP address

# Connection without X-Forwarding
ssh -i /Users/davidgilfoyle/.ssh/dg2018_david_k02.pem -o "StrictHostKeyChecking=no" -o "UserKnownHostsFile=/dev/null" -o "LogLevel=error" ec2-user@54.246.243.171

# Connection with X-Forwarding
ssh -X -i /Users/davidgilfoyle/.ssh/dg2018_david_k02.pem -o "StrictHostKeyChecking=no" -o "UserKnownHostsFile=/dev/null" -o "LogLevel=error" ec2-user@54.246.243.171

