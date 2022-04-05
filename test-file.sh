#!/bin/bash
echo "====this is a sample test===="
sleep 0.5
echo "====Enter your first name===="
read -r first_name
sleep 0.5
echo "=====Enter your last name===="
read -r last_name
sleep 0.5
echo "====Enter your year of birth===="
read -r yyyy
sleep 0.5
echo "====Enter your region===="
read -r region
check_bucket=$( aws s3api head-bucket --bucket "{$first_name-$last_name-$yyyy}" 2>&1 || true )
if [[ -z $check_bucket ]]; then
    echo "the bucket exists"
else
    echo "your bucket will be created with the name of $first_name-$last_name-$yyyy"
    echo "processing........"
    sleep 5
    aws s3api create-bucket --bucket "$first_name-$last_name-$yyyy" --create-bucket-configuration LocationConstraint="$region"
    aws s3 ls 

fi