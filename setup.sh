#!/bin/bash
# update
sudo apt-get update
# install aws cli
sudo apt install unzip
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install
# login to aws
(echo exampleID && echo  && echo us-east-1 && echo json) | aws configure
mkdir medium
cd medium
# load files from s3
aws s3 cp s3://examplebucket/medium/ ./ --recursive
# install needed packages
sudo apt install pip -y
pip install --upgrade pip
sudo apt install git -y
pip install openai
rm -r -f tweepy
git clone https://github.com/tweepy/tweepy.git
cd tweepy
pip install .
cd ..
# run code
python3 run.py
# load files to s3
rm -r -f tweepy
aws s3 cp ./ s3://examplebucket/medium/ --recursive
# terminate instance
var=$(aws ec2 describe-instances --query "Reservations[*].Instances[?State.Name=='running'].InstanceId" --output text)
aws ec2 terminate-instances --instance-ids ${var}