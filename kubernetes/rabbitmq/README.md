# Introduction

This README describes how to run the message broker that will be used on the 
Xebicon 2019 Keynote on your machine for development purpose

# Technical description of message broker

As mentioned [in the ADR/002](https://github.com/xebia-france/xebikart-infra/blob/master/doc/adr/002-use-rabbitmq-with-mqtt-plugin-to-make-devices-communicate-with-each-other.md), we've decided to use MQTT as communication protocol between karts and 
consumers. At this point, we've chosen RabbitMQ as message broker. Since Kubernetes is the _place-to-be_ when deploying
applications in 2019, we've decided to use Helm to manage Kubernetes deployments.  

## What do I need to be able to run this beauty on my machine?

To run this on your machine you need, **at least**, these tools:

- Local Kubernetes server (Minikube or Docker)
- Helm

For this guide, we're going to use Minikube but you can use Docker if you like.

1. For MacOS X users, It's **GREATLY** recommended to install brew package manager
https://brew.sh. If you're a Linux user, you can skip this step

2. Install and launch `Minikube`
https://kubernetes.io/docs/tasks/tools/install-minikube/

3. Install Helm
<https://helm.sh/docs/using_helm/#installing-helm>
Don't forget to run `helm init` to install Helm's requirements (Tiller) on your Minikube k8s cluster 

4. [Optional] Install a publisher/subscriber client for MQTT protocol to debug. There are many MQTT clients 
out there but we recommend **Mosquitto**. You can install it using this instructions: <https://mosquitto.org/download/>
Mosquitto package contains `mosquitto_pub` and `mosquito_sub` commands to publish and receive messages. Please
read their man pages for more information.

5. Generate CA, server and client's certificates
There are a lot of procedures online to do so. For testing, we can use _self-signed_ certificates. To do so, we can use [tls-gen](https://github.com/michaelklishin/tls-gen)

### Windows

Who cares?

## At least, running message broker on your machine

To avoid storing certificates on the repo, we can inject values to Helm Chart using a proper YAML file. This file must follow this structure:

Property | Description | Format
---|---|---
global.certificates.cacertfile|CA certificate| PER file
global.certificates.certfile|RabbitMQ server certificate| PER file
global.certificates.keyfile|Server certificate key| PER file

Here is an example of file:

```
global:
  certificates:
    cacertfile: |-
      -----BEGIN CERTIFICATE-----
      <content>
      -----END CERTIFICATE-----
    certfile: |-
      -----BEGIN CERTIFICATE-----
      <content>
      -----END CERTIFICATE-----
    keyfile: |-
      -----BEGIN RSA PRIVATE KEY-----
      <content>
      -----END RSA PRIVATE KEY-----
```

We can store this file anywhere but it must have YAML extension


From repository root directory:

`helm install message-broker -n <release name> -f <custom-certificate-file>`

This command will ask Tiller on your k8s cluster to deploy our application. After that, `tiller` will
ask to the cluster for the current state in order to call Kubernetes API server to achieve the desired state.
The release name is used to reference all created resources by our application. If not passed, helm will generate a _fun name_ 
for you every single time. Please read `helm install` documentation for further options

`helm install -h`

You can run `helm ls` to show all your active deployments

```
➜  ~ helm ls
NAME           	REVISION	UPDATED                 	STATUS  	CHART               	APP VERSION	NAMESPACE
xebikart-broker	3       	Thu Apr 11 16:27:31 2019	DEPLOYED	message-broker-1.0.0	1.0        	default  
```

After that, you can use `kubectl` to get information about 

```
➜  ~ kubectl get services
NAME                                    TYPE        CLUSTER-IP       EXTERNAL-IP   PORT(S)                                                                       AGE
kubernetes                              ClusterIP   10.96.0.1        <none>        443/TCP                                                                       64d
xebikart-broker-rabbitmq-ha             NodePort    10.104.142.226   <none>        15672:32364/TCP,5672:32058/TCP,4369:30852/TCP,1883:31859/TCP,8883:31106/TCP   17h
xebikart-broker-rabbitmq-ha-discovery   ClusterIP   None             <none>        15672/TCP,5672/TCP,4369/TCP,1883/TCP,8883/TCP                                 17h
```

By default, the RabbitMQ MQTT listener list in SSL on the port 8883 but Minikube remaps this port in a random port for 
every deployment. To know which port and host you've to use, you can use this command:

Get service IP: 

`minikube ip`

Get selected port (SSL):

`kubectl get service <service_name> -o='jsonpath="{.spec.ports[?(@.name == "mqtt-ssl")].nodePort}"'`

When we know this two variables, you can test. To do so, you can use `mosquitto`:

`mosquitto_sub -h <host> -p <port> -t <topic> --cert <client_certificate> --key <client_key> --cafile <ca_certificate> --insecure` 

`mosquitto_pub -h <host> -p <port> --cert <client_certificate> --key <client_key> --cafile <ca_certificate> -t <topic> -m "Hello world"`
