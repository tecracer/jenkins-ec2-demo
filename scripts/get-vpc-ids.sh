#!/bin/bash
# Generate VPC as Paramater

export vpcid=`aws ec2 describe-vpcs --query "Vpcs[0].VpcId" --output text`
export parameter=stacks/jenkins-security/parameters.yaml

echo -n '"VPC": "'  >$parameter
echo -n $vpcid  >>$parameter
echo -n '"'  >>$parameter

  