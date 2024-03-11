#!/bin/bash

project_name="project-group-hera-02"
cluster_name="group-project-3"
region="us-central1"

gcloud container clusters get-credentials $cluster_name --region $region --project $project_name
kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/v2.7.0/aio/deploy/recommended.yaml
kubectl proxy


