#!/bin/bash

project_name="project-group-hera-02"
cluster_name="group-project-3"
region="us-central1"

gcloud container clusters get-credentials $cluster_name --region $region --project $project_name
kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/v2.7.0/aio/deploy/recommended.yaml
kubectl patch svc kubernetes-dashboard --type='json' -p '[{"op":"replace","path":"/spec/type","value":"NodePort"}]' -n kubernetes-dashboard
kubectl create sa admin -n kubernetes-dashboard
kubectl create clusterrolebinding cluster-admin-rolebinding --clusterrole=cluster-admin --serviceaccount=kubernetes-dashboard:dashboard-admin -n kubernetes-dashboard
kubectl create token dashboard-admin -n kubernetes-dashboard > token
cat token
kubectl proxy

