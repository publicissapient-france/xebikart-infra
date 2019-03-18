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

# GDM

[xebikart-deployment-infra](https://console.cloud.google.com/home/dashboard?project=xebikart-deployment-infra&organizationId=&folder=&supportedpurview=project)

# Kubernetes

Since we will maybe use multiple Kubernetes clusters at some point, you might
find useful the [official Kubernetes documentation on configuring access to
multiple clusters for
kubectl](https://kubernetes.io/docs/tasks/access-application-cluster/configure-access-multiple-clusters/)
