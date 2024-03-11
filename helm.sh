#!/bin/bash

project_name="project-group-hera-02"
cluster_name="group-project-3"
region="us-central1"

gcloud container clusters get-credentials $cluster_name --region $region --project $project_name
kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/v2.7.0/aio/deploy/recommended.yaml
kubectl patch svc kubernetes-dashboard --type='json' -p '[{"op":"replace","path":"/spec/type","value":"NodePort"}]' -n kubernetes-dashboard
k apply -f sa.yaml 
k apply -f secret.yaml
apt-get install jq -y
kubectl proxy


kubectl create clusterrolebinding cluster-admin-binding --clusterrole=cluster-admin --serviceaccount=kubernetes-dashboard:admin

kubectl get secret $(kubectl get sa kubernetes-dashboard -o jsonpath='{.secrets[0].name}') -o go-template='{{.data.token | base64decode}}'