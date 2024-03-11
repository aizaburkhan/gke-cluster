#!/bin/bash

project_name="project-group-hera-11"
cluster_name="group-project-3"
region="us-central1"

gcloud container clusters get-credentials $cluster_name --region $region --project $project_name
helm repo add kubernetes-dashboard https://kubernetes.github.io/dashboard/
helm repo update
helm install kubernetes-dashboard kubernetes-dashboard/kubernetes-dashboard 

gcloud container clusters get-credentials group-project-3 --region us-central1 --project project-group-hera-01