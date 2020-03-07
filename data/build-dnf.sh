#!/bin/sh

# ------------------------------------------------------------------------------
# Gluster/nfs-ganesha Package Installation
# ------------------------------------------------------------------------------


# Drop repo files for Gluster & nfs-ganesha
curl -o /etc/yum.repos.d/glusterfs-rhel8.repo https://download.gluster.org/pub/gluster/glusterfs/LATEST/RHEL/glusterfs-rhel8.repo

cat << HERE > /etc/yum.repos.d/nfs-ganesha.repo
[nfs-ganesha]
name=nfs-ganesha
baseurl=https://download.nfs-ganesha.org/${GANESHA_MAJOR}/${GANESHA_MINOR}/RHEL/el-8/\$basearch/
enabled=1
gpgcheck=1
gpgkey=https://download.nfs-ganesha.org/${GANESHA_MAJOR}/rsa.pub

[nfs-ganesha-noarch]
name=nfs-ganesha-noarch
baseurl=https://download.nfs-ganesha.org/${GANESHA_MAJOR}/${GANESHA_MINOR}/RHEL/el-8/noarch/
enabled=1
gpgcheck=1
gpgkey=https://download.nfs-ganesha.org/${GANESHA_MAJOR}/rsa.pub

HERE


# Install packages
dnf --setopt=tsflags=nodocs -y install dnf-plugins-core
dnf config-manager --set-enabled PowerTools

dnf -y install \
  glusterfs-cli \
  glusterfs-server \
  nfs-ganesha-gluster \
  bind-utils


# Cleanup
dnf clean all
rm -rf /var/cache/dnf/

