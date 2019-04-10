# XebiKart Infra - Kubernetes

This directory contains infrastructure services that are deployed to the
existing GKE cluster. There should be no xebikart app there, only
cross-projects middleware and cluster-wide system services.

Below, you will find explanations about the purpose of each
component/directory.

# Helm

This directory contains manifests to setup `Tiller` for Helm in a descriptive
way, other than running `helm init`. It is composed of:

- <helm/deployment.yaml>
- <helm/rbac-config.yaml>

One of the reason we do this is that the number replica is 1 by default, the
service account for tiller is missing, and patching the deployment of `helm
init` with `kubectl patch` would be ugly as hell.

We already noted that we would need to do this when decided to use Helm for
deployment in the
[ADR/005](../doc/adr/005-use-kubectl-and-helm-for-k8s-deployment.md)

You'll find details about these below.

## Tiller Deployment

The <helm/deployment.yaml> file is essentially a a manifest version of a `helm
init`.

Is has been created from running `helm init` and transcribing the Deployment it
creates into a manifest with `kubectl get deployment.apps/tiller-deploy
--namespace=kube-system --output=yaml`, then tuning it (i.e. to make it use the
Service Account created in the RBAC configuration manifest).

## Tiller RBAC configuration

The <helm/rbac-config.yaml> is constructed according to the [official Helm
documentation about RBAC configuration](https://github.com/helm/helm/blob/master/docs/rbac.md).
