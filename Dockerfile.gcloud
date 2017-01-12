FROM ubuntu:16.04

ENV DEBIAN_FRONTEND=noninteractive

RUN \
    rm /bin/sh && ln -s /bin/bash /bin/sh && \
    apt-get update && \
    apt-get -y upgrade && \
    apt-get install -y --no-install-recommends apt-utils && \
    apt-get install -y build-essential && \
    apt-get install -y software-properties-common && \
    apt-get install -y byobu curl git-all htop man unzip wget && \
    add-apt-repository -y ppa:fkrull/deadsnakes && \
    apt-get -y install python-pip && \
    rm -rf /var/lib/apt/lists/*

RUN \
    curl https://sdk.cloud.google.com/ | bash

RUN \
    export PATH=$PATH:~/google-cloud-sdk/bin && \
    gcloud -q components update && \
    gcloud -q components install cbt datalab app-engine-java app-engine-go bq cloud-datastore-emulator gcd-emulator pubsub-emulator core gsutil gcloud docker-credential-gcr alpha beta app-engine-python kubectl

ADD dist/ca-certificates.crt /etc/ssl/certs/ca-certificates.crt
COPY _build/kube-lego /kube-lego
COPY README.md /README.md
CMD ["/kube-lego"]
ARG VCS_REF
LABEL \
    org.label-schema.vcs-ref=$VCS_REF \
    org.label-schema.vcs-url="https://github.com/jetstack/kube-lego" \
    org.label-schema.license="Apache-2.0"
