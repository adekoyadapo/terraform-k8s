# Copyright (c) Tetrate, Inc 2021 All Rights Reserved.
aks:
	terraform init
	terraform validate
	terraform apply -auto-approve -target=module.azure_k8s
app_bookinfo:
	terraform init
	terraform validate
	terraform apply -auto-approve -target=module.app_bookinfo
destroy:
	terraform validate
	terraform destroy -auto-approve -target=module.azure_k8s
	terraform destroy -auto-approve -target=module.azure_base
	terraform destroy -auto-approve