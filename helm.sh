#!/bin/bash

project_name="project-group-hera-6"
cluster_name="group-project-3"
region="us-central1"

apt-get install google-cloud-sdk-gke-gcloud-auth-plugin -y
gcloud container clusters get-credentials $cluster_name --region $region --project $project_name