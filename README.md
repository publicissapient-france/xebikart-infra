# XebiKart - Infra

[![CircleCI](https://circleci.com/gh/xebia-france/xebikart-infra.svg?style=svg&circle-token=5aaf15a8d4572523e390421420066392057bc8fe)](https://circleci.com/gh/xebia-france/xebikart-infra)

This repository contains all the base infrastructure for XebiKart, including
but not limited to:

- The Kubernetes (GKE) cluster(s)
- The infrastructure components running on these K8s clusters:
    - DNS records controllers
    - TLS certificates controllers
    - Common message broker for applications
    - Monitoring
    - ...

## GCP - Layout

The entire infrastructure is created under the [XebiKart
folder](https://console.cloud.google.com/projectselector2/home/dashboard?folder=770972260944&supportedpurview=project&project&organizationId)
located as follow :

`xebia.fr (Org) > Conferences > XebiCon > Xebikart`

## Terraform

We use [Terraform](https://www.terraform.io/) to manage the entire
infrastructure as code. You can take a look at the [ADR #003](https://github.com/xebia-france/xebikart-infra/blob/master/doc/adr/003-use-terraform-for-infrastructure-deployment.md)
for more details about this choice.

### Requirements

You obviously need [Terraform to be
installed](https://learn.hashicorp.com/terraform/getting-started/install.html)
to use it.

Terraform needs to authenticate on GCP in order to manages resources through
GCP APIs. Terraform knows how to use your `gcloud` CLI credentials, so you can
simply run this to be able to run Terraform locally from your machine:

```
gcloud auth application-default login
gcloud auth login
```

For more advanced Terraform/GCP authentication methods, please see the [GCP documentation
about this topic] (https://cloud.google.com/docs/authentication/production).

You may also need your own GitHub API token in order to run the Terraform stff
found in `repositories`. Read the README in this directory to know more about
it.

#### Inputs

The concepts of
[locals](https://www.terraform.io/docs/configuration/locals.html) and
[variables](https://www.terraform.io/docs/configuration/variables.html) of
Terraform are used to "configure" the infrastructure that is being created.

All of these settings can be found under
[`terraform/inputs.tf`](terraform/inputs.tf)

# GDM

[xebikart-deployment-infra](https://console.cloud.google.com/home/dashboard?project=xebikart-deployment-infra&organizationId=&folder=&supportedpurview=project)

## Kubernetes

Since we will maybe use multiple Kubernetes clusters at some point, you might
find useful the [official Kubernetes documentation on configuring access to
multiple clusters for
kubectl](https://kubernetes.io/docs/tasks/access-application-cluster/configure-access-multiple-clusters/)

## Monitoring

The monitoring is done thanks to
[Stackdriver](https://cloud.google.com/stackdriver/). In short Stackdriver is
comprised of 2 parts: Stackdriver Logging (`logging.googleapis.com` API), and
Stackdriver Monitoring (`monitoring.googleapis.com` API). Warning, there is
actually a **Legacy** Stackdriver integration and a **beta** one dedicated to
Kubernetes. You can learn more about this on the [ Overview of Stackdriver
support for GKE ](https://cloud.google.com/monitoring/kubernetes-engine/).

For this XebiKart project, we chose to use the dedicated Stackdriver Kubernetes
Monitoring (Beta), as you can see it in the [cluster description in
Terraform](terraform/gke.tf) with `monitoring.googleapis.com/kubernetes` and
`logging.googleapis.com/kubernetes`

Everything on GKE is configured out-of-the-box to ship monitoring informations
to Stackdriver, mainly through services running in the `kube-system` namespace:

- `daemonset/prometheus-to-sd`
- `daemonset/fluentd-gcp`
- `deployment/event-exporter`
- `deployment/metrics-server`
- `deployment/stackdriver-metadata-agent-cluster-level`
- `deployment/heapster`

This image from [a post on
Medium](https://medium.com/google-cloud/gke-monitoring-84170ea44833) summarizes
it pretty well:

![Kubernetes monitoring with
Stackdriver](https://cdn-images-1.medium.com/max/800/0*2HseDYXmRUr2xFtk)

Unfortunately, there is a bunch of stuff to configure in order to be able to
enable Stackdriver for Kubernetes:

- Enabling APIs on the project - done in [project.tf](terraform/project.tf)
- Configuring GKE to use the dedicated Stackdriver Kubernetes Monitoring
  (beta) - done in [gke.tf](terraform/gke.tf) as explained above.
- Creating a Stackdriver workspace
- Associate the project to the Stackdriver workspace

The problem is, the last 2 steps cannot be done with Terraform as you can see
in the [corresponding GitHub
issue](https://github.com/kubernetes/kubernetes/issues/72187). They have
consequently been done manually while waiting for the API primitives in
Stackdriver to automate it :(

The Stackdriver workspace containing the `xebikart-dev-1` project is the one
created from the `xebikart-deployment-infra` project, in order to avoid
repeating these manual steps too much for future projects/clusters.

You can access it on the [xebikart-deployment-infra Stackdriver
workspace](https://app.google.stackdriver.com/?project=xebikart-deployment-infra)

## How to deploy everything from scratch

1. Deploy Terraform base infra with Google Cloud Deployment Manager
2. Deploy infrastructure using Terraform
3. Deploy Kubernetes services

## RabbitMQ

Note: the current RabbitMQ release on the GKE cluster is name
`rabbitmq-ha-release-4` for some iteration reasons. This might be changed
later.

Step #1 - Setup Helm chart dependency:

`helm dependency build rabbitmq`

Step #2 - Install/Deploy RabbitMQ with Helm:

`helm install rabbitmq -n <release-name> --set rabbitmq-ha.rabbitmqUsername=<admin_user>,rabbitmq-ha.rabbitmqPassword=<adminPassword>`

Step #3 - Upgrade the RabbitMQ deployment:

`helm upgrade <release_name> rabbitmq`
