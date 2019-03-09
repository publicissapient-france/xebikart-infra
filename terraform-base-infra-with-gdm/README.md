# How To

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
