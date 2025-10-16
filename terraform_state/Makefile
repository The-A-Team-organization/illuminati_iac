.PHONY: init plan apply destroy
init:
	terraform init -var-file=workspace_vars/state.tfvars

plan: init
	terraform plan -var-file=workspace_vars/state.tfvars

apply: init
	terraform apply -var-file=workspace_vars/state.tfvars

destroy: init
	terraform destroy -var-file=workspace_vars/state.tfvars