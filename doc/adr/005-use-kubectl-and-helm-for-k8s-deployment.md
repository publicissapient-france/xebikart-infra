# Use kubectl and Helm for Kubernetes deployment

- Status: Accepted
- Date: 2019-03-17
- Deciders:
    - achotard
    - jmartinsanchez

## Context and Problem Statement

We want to **deploy** pods, services, and other resources on **Kubernetes**,
which is a GKE cluster for now.

What tool should we use to do this?

## Decision Drivers <!-- optional -->

- TODO

## Considered Options

**TODO how to link to other sections of the markdown for GitHub?**

- Terraform
- Ansible
- Kubectl
- Helm

## Decision Outcome

Chosen option: "A mix of **kubectl** and **Helm**", because:

- TODO

## Pros and Cons of the Options <!-- optional -->

### Terraform

[Terraform](TODO) is ...
It has resources to describe Kubernetes services (TODO link)

Pros:

- Already used to spawn the base infrastructure on GCP (Projects, GKE cluster,
  etc)

Cons:

- Is yet another format overlay to describe Kubernetes resources

### Ansible

[Ansible](TODO) was a no-go from the beginning since we're trying to avoid using it for
unappropriate use cases such as this one. Talking to APIs such as the
Kubernetes one is definitely not the job for which Ansible was made for.

### Kubectl

[`kubectl`](TODO) is the official command line tool to talk to the Kubernetes
API.

### Helm

[Helm](TODO) is the TODO define

## Links <!-- optional -->

- [Link type] [Link to ADR] <!-- example: Refined by [ADR-0005](0005-example.md) -->
- … <!-- numbers of links can vary -->
https://dzone.com/articles/terraform-vs-helm-for-kubernetes
