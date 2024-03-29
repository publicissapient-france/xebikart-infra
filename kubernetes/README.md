# XebiKart Infra - Kubernetes

This directory contains infrastructure services that are deployed to the
existing GKE cluster. There should be no XebiKart app there, only
cross-projects middleware and cluster-wide system services.

Below, you will find explanations about the purpose of each
component/directory.

# Helm

This directory contains manifests to setup `Tiller` for Helm in a descriptive
way, other than running `helm init`. It is comprised of:

- <helm/deployment.yaml>
- <helm/rbac-config.yaml>

Some of the reasons we do this are that:

- the  replica number of the Chart is 1 by default
- the service account for Tiller is missing
- patching the deployment of `helm init` with `kubectl patch` would be ugly as
  hell.

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
documentation about RBAC
configuration](https://github.com/helm/helm/blob/master/docs/rbac.md).

# SmokeTest App

This is a `hello-world` container used to check that service can correctly be
exposed. It is deployed as part of the infrastructure stack since it is used to
check that everything is ok.

It is exposed in 2 different ways:

- With a `Service` of type `LoadBalancer` : <http://service.smoke.xebik.art>
- With an `Ingress` backed by a `Service` of type `NodePort` :
  <http://ingress.smoke.xebik.art> (also on <http://smoke.xebik.art>)

Both have DNS records pointing to them that are created according to the
annotations used by ExternalDNS (See ADR/007).

# External DNS

The K8s external Services are mainly defined with the `type: LoadBalancer`
property. This makes GKE create a [Google Cloud Load Balancer (GCLB)](TODO) for it and
add relevant pods (according to selectors, as usual with Services) as backends
of this GCLB.

However, acessing public Services directly with the IP of the Load Balancer is
neither nice nor practical. **We have to create DNS records pointing to these
GCLB in order to access public services in a named fashion**.

This is done with [External-DNS](TODO link) TODO Description. See
[ADR/TODO](TODO) for reasons behind this choice.

https://github.com/kubernetes-incubator/external-dns/blob/master/docs/tutorials/gke.md
