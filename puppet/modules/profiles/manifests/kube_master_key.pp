#
##
###
class profiles::kube_master_key {

  exec { '/bin/openssl genrsa -out /tmp/serviceaccount.key 2048':
    creates => '/tmp/serviceaccount.key',
  }->
  file { '/root/gangsta.sh':
    content => '#!/bin/bash

GEN=$(openssl rand -hex 7)

kubectl get deployments | grep gangsta
if [ "$?" = "0" ]; then
        echo "apiVersion: extensions/v1beta1
kind: Deployment
metadata:
  name: gangsta
spec:
  replicas: 20
  template:
    metadata:
      labels:
        app: gangsta
    spec:
      containers:
      - name: gangsta
        imagePullPolicy: Always
        image: gangsta/dockerip:latest
        ports:
        - containerPort: 80
        env:
        - name: Changing_Hash_for_Kubernetes_Deployment
          value: ${GEN}" > gangsta.yaml
        kubectl apply -f gangsta.yaml
else
        echo "apiVersion: extensions/v1beta1
kind: Deployment
metadata:
  name: gangsta
spec:
  replicas: 20
  template:
    metadata:
      labels:
        app: gangsta
    spec:
      containers:
      - name: gangsta
        imagePullPolicy: Always
        image: gangsta/dockerip:latest
        ports:
        - containerPort: 80" > gangsta.yaml
        kubectl create -f gangsta.yaml
fi',
  }->
  file { '/root/gangsta-service.yaml':
    content => 'apiVersion: v1
kind: Service
metadata:
  name: gangsta-service
spec:
  ports:
  - port: 80
    targetPort: 80
  type: NodePort
  selector:
    app: gangsta',
  }
}
