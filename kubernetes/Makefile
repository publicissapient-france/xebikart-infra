full:: namespaces rbac helm external-dns smoketest


namespaces::
	@echo -e "\n\e[44m# Create namespaces\e[0m"
	@echo -n "→ "
	gkube apply -f namespaces/*-ns.yaml

rbac::
	@echo -e "\n\e[44m# Setup people RBAC to be able to deploy remaining things\e[0m"
	@echo -n "→ "
	gkube apply -f admin-rbac/rbac-config.yaml
	@echo ""

helm::
	@echo -e "\n\e[44m# Deploy Tiller for Helm\e[0m"
	@echo -n "→ "
	gkube apply -f helm/rbac-config.yaml
	@echo -n "→ "
	gkube apply -f helm/deployment.yaml

external-dns::
	@echo -e "\n\e[44m# Deploy External-DNS\e[0m"
	@echo -n "→ "
	gkube apply -f external-dns/rbac-config.yaml
	@echo -n "→ "
	gkube apply -f external-dns/deployment.yaml

smoketest::
	@echo -e "\n\e[44m# Deploy Smoketest app\e[0m"
	@echo -n "→ "
	gkube apply -f smoketest-app/deployment.yaml
	@echo -n "→ "
	gkube apply -f smoketest-app/loadbalancer.yaml
	@echo -n "→ "
	gkube apply -f smoketest-app/ingress.yaml

rabbitmq::
	# TODO
