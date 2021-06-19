#!/usr/bin/env bash
set -euxo pipefail

: ${SLUG?"SLUG env variable is required"}
: ${BUILD_NUMBER?"BUILD_NUMBER env variable is required"}
: ${PROJECT?"PROJECT env variable is required"}

stack_name="${PROJECT}-${SLUG}"

stack_id=$(aws cloudformation describe-stacks --stack-name $stack_name --query "Stacks[0].StackId" --output text) || stack_id=""

echo "Running the tests and publishing..."

mkdir ./packages || true

echo "Publishing ${PROJECT}"
aws cloudformation package \
    --template-file="./cloudformation.yaml" \
    --output-template-file="./packaged.yaml" \
    --s3-prefix="${PROJECT}/${BUILD_NUMBER}" \
    --s3-bucket="a4bird-memories-lambda-repo"

aws s3 cp "./packaged.yaml" "s3://a4bird-memories-lambda-repo/${PROJECT}/${BUILD_NUMBER}/"
