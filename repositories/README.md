# Infra - Repositories

This repository manages GitHub repositories "as code" with
[Terraform](https://www.terraform.io/).

It mainly handles labels in order to have something that is easier to change
across all repositories.

## Requirements

- Terraform
- `GITHUB_TOKEN` in your environment

It also uses the GCP and Github providers so make sure to `terraform init` !

## What does it handle?

- Labels and their common colors through a couple of modules:
    - Closing reasons (duplicate, wontfix, already-fixed, etc)
    - PR Lifeccyle step (in-discussion, wip, etc)
- Raw labels for this `xebikart-infra` repo:
    - Components (RabbitMQ, K8s, ...)
    - Kind (Enhancement, Question, Bug, ...)
    - Scope (Doc, Monitoring, ...)

This is it for now. Later on, it will probably manage a bunch of other stuff.

