full:: namespaces rbac helm external-dns smoketest rabbitmq

RABBITMQ_HELM_RELEASE_NAME=xebikart-rabbitmq-ha

namespaces::
	@echo -e "\n\e[44m# Create namespaces\e[0m"
	@echo -n "→ "
	kubectl apply -f namespaces

rbac::
	@echo -e "\n\e[44m# Setup people RBAC to be able to deploy remaining things\e[0m"
	@echo -n "→ "
	kubectl apply -f admin-rbac/rbac-config.yaml
	@echo ""

helm::
	@echo -e "\n\e[44m# Deploy Tiller for Helm\e[0m"
	@echo -n "→ "
	kubectl apply -f helm/rbac-config.yaml
	@echo -n "→ "
	kubectl apply -f helm/deployment.yaml

external-dns::
	@echo -e "\n\e[44m# Deploy External-DNS\e[0m"
	@echo -n "→ "
	kubectl apply -n common-infra-production -f external-dns/rbac-config.yaml
	@echo -n "→ "
	kubectl apply -n common-infra-production -f external-dns/deployment.yaml

smoketest::
	@echo -e "\n\e[44m# Deploy Smoketest app\e[0m"
	@echo -n "→ "
	kubectl apply -n apps-production -f smoketest-app/deployment.yaml
	@echo -n "→ "
	kubectl apply -n apps-production -f smoketest-app/loadbalancer.yaml
	@echo -n "→ "
	kubectl apply -n apps-production -f smoketest-app/ingress.yaml

rabbitmq::
	@echo -e "\n\e[44m# Deploy RabbitMQ\e[0m"
	@echo -n "→ "
	helm install rabbitmq --namespace common-infra-production -n ${RABBITMQ_HELM_RELEASE_NAME} -f rabbitmq/values.yaml
	#helm upgrade ${RABBITMQ_HELM_RELEASE_NAME} rabbitmq --namespace common-infra-production -f rabbitmq/values.yaml
