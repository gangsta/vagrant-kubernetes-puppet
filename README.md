# Vagrant-Kubernetes-Puppet

[![Jexia](https://forum.golangbridge.org/uploads/default/optimized/2X/c/c4746b35435181e88a330357f4feb5566d3fbbe2_1_690x324.png)](http://jexia.com)

## Overview

* The Vagrant-Kubernetes-Puppet module provides the installation procedure for Kubernetes,Etcd,Flanneld,Docker with Puppet at CentOS7_vagrantbox including the Kubernetes API server.
* If you have EPEL already activated, the module epel is not necessary.


## Setup

### Usage


To get started, perform a git clone on. Make sure you have [Vagrant installed](https://docs.vagrantup.com/v2/installation/), and also [VirtualBox](https://www.virtualbox.org/).

```
git clone https://github.com/gangsta/vagrant-kubernetes-puppet.git
cd vagrant-kubernetes-puppet/
vagrant up --provider virtualbox
```

Once vagrant is done provisioning the VMs run `vagrant status` to confirm all instances are running:

You can run the kubernetes deployment and  service on your cluster by issuing:

```
  vagrant ssh kube-master
  kubectl run hello-world --replicas=5 --labels="run=load-balancer-example" --image=docker.io/redis:latest
  kubectl get deployments hello-world
  kubectl describe deployments hello-world
  kubectl expose deployment hello-world --type=LoadBalancer --name=my-service
  kubectl get services my-service
  kubectl describe services my-service

  for pros
  kubectl get pods --output=wide

  Clean Up
  kubectl delete services my-service
  kubectl delete deployment hello-world
```

When you're done, you can shut down the cluster using
```
vagrant destroy -f
```
### If you want to change any of the configuration/scripts run
```
vagrant provision
```
