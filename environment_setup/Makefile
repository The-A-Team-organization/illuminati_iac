.PHONY: init plan apply destroy
ILLUMINATI_ENV=dev
init:
	terraform init
	terraform workspace select -or-create ${ILLUMINATI_ENV}

plan: init
	terraform plan -var-file=workspace_vars/${ILLUMINATI_ENV}.tfvars

apply: init
	terraform apply -var-file=workspace_vars/${ILLUMINATI_ENV}.tfvars

destroy: init
	terraform destroy -var-file=workspace_vars/${ILLUMINATI_ENV}.tfvars
