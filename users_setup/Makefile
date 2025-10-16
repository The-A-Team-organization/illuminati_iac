.PHONY: init plan apply destroy
init:
	terraform init

plan: init
	terraform plan -var-file=workspace_vars/users.tfvars

apply: init
	terraform apply -var-file=workspace_vars/users.tfvars

destroy: init
	terraform destroy -var-file=workspace_vars/users.tfvars