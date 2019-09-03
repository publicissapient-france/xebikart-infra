export DEPLOY_PROJECT=xebikart-deployment-infra
export TERRAFORM_CMD = docker run -it --rm \
			-v `pwd`:/root/terraform \
			-v gcloud-xebia-xebikart-config:/root/.config \
			-e GITHUB_TOKEN=${GITHUB_TOKEN} \
			-w /root/terraform \
			hashicorp/terraform:0.12.7

# This Makefile wrapp all terraform commands via docker
# To run this commands you must be logged in with the `gcloud` CLI so Terraform
# can store its state into Google Cloud Storage. See README for more infos.
init:
	@$(TERRAFORM_CMD) init \
	  -backend-config="bucket=$(DEPLOY_PROJECT)-terraform-state-bucket"

plan apply destroy show help refresh graph import state::
	@$(TERRAFORM_CMD) $@ $(filter-out $@,$(MAKECMDGOALS))
