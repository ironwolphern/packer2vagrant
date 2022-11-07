#!/bin/sh -eux

# Install repos for devops tools
yum-config-manager --add-repo https://rpm.releases.hashicorp.com/RHEL/hashicorp.repo
rpm --import https://packages.microsoft.com/keys/microsoft.asc
dnf install -y https://packages.microsoft.com/config/rhel/8/packages-microsoft-prod.rpm
tee -a /etc/yum.repos.d/google-cloud-sdk.repo << EOM
[google-cloud-cli]
name=Google Cloud CLI
baseurl=https://packages.cloud.google.com/yum/repos/cloud-sdk-el8-x86_64
enabled=1
gpgcheck=1
repo_gpgcheck=0
gpgkey=https://packages.cloud.google.com/yum/doc/rpm-package-key.gpg
EOM

# Install devops tools
dnf install -y \
    terraform \
    packer \
    awscli \
    azure-cli \
    google-cloud-cli \
    bash-completion \
    jq \

