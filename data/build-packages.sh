#!/bin/sh

# ------------------------------------------------------------------------------
# Gluster/nfs-ganesha Package Installation
# ------------------------------------------------------------------------------


# Install packages

yum --setopt=tsflags=nodocs -y install \
  centos-release-gluster7 \
  centos-release-nfs-ganesha30

yum -y install \
  glusterfs-cli \
  glusterfs-server \
  nfs-ganesha \
  bind-utils


# Cleanup
yum clean all
rm -rf /var/cache/dnf/

