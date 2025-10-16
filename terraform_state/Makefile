.PHONY: init plan apply destroy
BIRD_ENV=dev-01
init:
	terraform init

plan: init
	terraform plan 

apply: init
	terraform apply

destroy: init
	terraform destroy