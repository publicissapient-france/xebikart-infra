export DEPLOY_PROJECT=xebikart-deployment-infra
export TERRAFORM_CMD = docker run -it --rm \
			-v `pwd`:/root/terraform \
			-v gcloud-xebia-xebikart-config:/root/.config \
			-e GITHUB_TOKEN=${GITHUB_TOKEN} \
			-w /root/terraform \
			hashicorp/terraform:0.11.13

# This Makefile wrapp all terraform commands via docker#
# To run this commands you must be logged in with the `gcloud` CLI. See README
# for more infos.
# Afer running init, choose the good workspace run plan and then apply 

init:
	# first to sync local repo with bucket state
	@$(TERRAFORM_CMD) init \
	  -backend-config="project=$(DEPLOY_PROJECT)" \
	  -backend-config="bucket=$(DEPLOY_PROJECT)-terraform-state-bucket"

plan apply destroy import show help refresh graph:
	@$(TERRAFORM_CMD) $@ $(filter-out $@,$(MAKECMDGOALS))\
	  -var "current-project=$(DEPLOY_PROJECT)"

state::
	@$(TERRAFORM_CMD) $@ $(filter-out $@,$(MAKECMDGOALS))
