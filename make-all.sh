#!/usr/bin/env bash
make IMAGE_VERSION=min image
make IMAGE_VERSION=ubuntu image
make IMAGE_VERSION=gcloud image

gcloud docker -- push gcr.io/topside-main/kube-lego:min
gcloud docker -- push gcr.io/topside-main/kube-lego:ubuntu
gcloud docker -- push gcr.io/topside-main/kube-lego:gcloud
