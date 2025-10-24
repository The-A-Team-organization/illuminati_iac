#!/usr/bin/env bash
set -e  # Stop on first error

AWS_REGION="eu-central-1"
AWS_ACCOUNT_ID="506087227011"


aws ecr get-login-password --region "$AWS_REGION" | docker login --username AWS --password-stdin "${AWS_ACCOUNT_ID}.dkr.ecr.${AWS_REGION}.amazonaws.com"

docker compose pull