GCP_PROJECT=xebikart-deployment-infra
DEPLOYMENT=terraform-base-infra

update deploy::
	gcloud --project ${GCP_PROJECT} deployment-manager \
	  deployments update ${DEPLOYMENT} --template ${DEPLOYMENT}.j2

create::
	gcloud --project ${GCP_PROJECT} deployment-manager \
	  deployments create ${DEPLOYMENT} --template ${DEPLOYMENT}.j2

delete::
	gcloud --project ${GCP_PROJECT} deployment-manager \
	  deployments delete ${DEPLOYMENT}
