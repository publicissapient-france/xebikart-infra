GCP_PROJECT=xebikart-deployment-infra
DEPLOYMENT=terraform-base-infra

update deploy::
	gcloud --project ${GCP_PROJECT} deployment-manager \
	  deployments update ${DEPLOYMENT} --template ${DEPLOYMENT}.jinja

create::
	gcloud --project ${GCP_PROJECT} deployment-manager \
	  deployments create ${DEPLOYMENT} --template ${DEPLOYMENT}.jinja

delete::
	gcloud --project ${GCP_PROJECT} deployment-manager \
	  deployments delete ${DEPLOYMENT}
