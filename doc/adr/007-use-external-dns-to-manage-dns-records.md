# Use External-DNS to manage DNS records

- Status: Accepted
- Date: 2019-04-10
- Deciders:
    - achotard
    - ADD YOURSELF HERE. This line will be removed before merging the PR.

## Context and Problem Statement

We are deploying Kubernetes Services of type `LoadBalancer` in order to expose
services such as RabbitMQ. This creates a Google Cloud Network Load Balancer on
GCP, with the associated public IP address.

In order to contact services using a name and not a raw IP address, we need to
be able to create DNS records automatically and in a clean way, pointing on
these GCLB.

## Decision Drivers <!-- optional -->

- [driver 1, e.g., a force, facing concern, …]
- [driver 2, e.g., a force, facing concern, …]
- … <!-- numbers of drivers can vary -->

## Considered Options

- Terraform
- External-DNS

## Decision Outcome

Chosen option: **"External DNS"**, because:

- TODO

This is however not the most ideal thing because LoadBalancer and not Ingress.

### Positive Consequences <!-- optional -->

- [e.g., improvement of quality attribute satisfaction, follow-up decisions required, …]
- …

### Negative Consequences <!-- optional -->

- [e.g., compromising quality attribute, follow-up decisions required, …]
- …

## Pros and Cons of the Options <!-- optional -->

### Terraform

[example | description | pointer to more information | …] <!-- optional -->

Pros:

- TODO

Cons:

- TODO

### External DNS

[example | description | pointer to more information | …] <!-- optional -->

Pros:

- TODO

Cons:

- TODO

## Links <!-- optional -->

- [Link type] [Link to ADR] <!-- example: Refined by [ADR-0005](0005-example.md) -->
- … <!-- numbers of links can vary -->



https://github.com/kubernetes-incubator/external-dns

Configure external DNS servers (AWS Route53, Google CloudDNS and others) for Kubernetes Ingresses and Services
Google Cloud DNS is Stable


https://github.com/linki/mate
deprecated
Zalando Incubator

wealthy
