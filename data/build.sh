#!/bin/sh

# ------------------------------------------------------------------------------
# Gluster Build Script
# ------------------------------------------------------------------------------


# Drop repo files for Gluster
curl -o /etc/yum.repos.d/glusterfs-rhel8.repo https://download.gluster.org/pub/gluster/glusterfs/LATEST/RHEL/glusterfs-rhel8.repo


# Install packages
dnf --setopt=tsflags=nodocs -y install dnf-plugins-core
dnf config-manager --set-enabled PowerTools

dnf -y install \
  glusterfs-cli \
  glusterfs-server \
  bind-utils


# Enable Services
ln -s /lib/systemd/system/glusterd.service /etc/systemd/system/multi-user.target.wants/glusterd.service


# Cleanup
dnf clean all
rm -rf /var/cache/dnf/

