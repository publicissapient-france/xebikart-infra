# XebiKart - Infra

This repository contains all the base infrastructure for XebiKart.

# GCP

The entire infrastructure is created under the [XebiKart
folder](https://console.cloud.google.com/projectselector2/home/dashboard?folder=770972260944&supportedpurview=project&project&organizationId)
located as follow :

`xebia.fr (Org) > Conferences > XebiCon > Xebikart`

# Terraform

```
gcloud auth application-default login
gcloud auth login
```

For more advanced authentication methods, please see the [GCP documentation
about this topic] (https://cloud.google.com/docs/authentication/production)
:wink:

## Inputs

The concepts of
[locals](https://www.terraform.io/docs/configuration/locals.html) and
[variables](https://www.terraform.io/docs/configuration/variables.html) de
Terraform are used to "configure" the infrastructure that is being created.

All of these settings can be found under
[`terraform/inputs.tf`](terraform/inputs.tf)

# GDM

[xebikart-deployment-infra](https://console.cloud.google.com/home/dashboard?project=xebikart-deployment-infra&organizationId=&folder=&supportedpurview=project)

# Kubernetes

Since we will maybe use multiple Kubernetes clusters at some point, you might
find useful the [official Kubernetes documentation on configuring access to
multiple clusters for
kubectl](https://kubernetes.io/docs/tasks/access-application-cluster/configure-access-multiple-clusters/)
