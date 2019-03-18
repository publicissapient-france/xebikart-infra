# How To - Work on existing infrastructure and contribute to it

## 1. Login on your CLI to GCP

## 2. Get cluster credentials

```
gcloud container clusters get-credentials horgix-xebikart-gke-1 --region europe-west1 
```

# How To - Spawn the entire infrastructure from scratch

## 1. Manually create a deployment project for GDM

## 2. Use Google Deployment Manager to bootstrap Terraform requirements

## 3. Initialize Terraform

## 4. Play with Terraform

- Project: xebikart-deployment-infra

```
gcloud auth login
gcloud config set project xebikart-deployment-infra
```

Then use the Makefile to deploy the stack:

```
make <create / update>
```

# To do when bootstrapping from scratch

- Add project IAM admin on parent Organization/Folder
- Add Editor on the deployment project
- Enable Deployment Manager API
