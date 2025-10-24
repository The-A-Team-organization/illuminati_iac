# Stop script on first error
$ErrorActionPreference = "Stop"

$AWS_REGION="eu-central-1"
$AWS_ACCOUNT_ID="506087227011"


$ECR_URL = "$AWS_ACCOUNT_ID.dkr.ecr.$AWS_REGION.amazonaws.com"

aws ecr get-login-password --region $AWS_REGION | docker login --username AWS --password-stdin $ECR_URL

docker compose pull

