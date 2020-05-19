# terraform

Small terraform to create one machine in AWS with port 80 with web-tier and autoscaling

Backend of terraform is in S3 some bucket 

* Note: Never commit any credentials or terraform.tfstate

# Steps:

` $ export AWS_ACCESS_KEY_ID="" `

` $ export AWS_SECRET_ACCESS_KEY="" `

` $ export AWS_DEFAULT_REGION=us-east-1 `

` terraform init `

` terraform plan -out instance `

` terraform apply instance -auto-approve `
