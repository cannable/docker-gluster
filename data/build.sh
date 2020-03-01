#!/bin/sh

# ------------------------------------------------------------------------------
# Gluster Build Script
# ------------------------------------------------------------------------------

GANESHA_MAJOR=2.8
GANESHA_MINOR=2.8.0


# Drop repo files for Gluster and nfs-ganesha
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
dnf --setopt=tsflags=nodocs -y check-update
dnf -y install dnf-plugins-core
dnf config-manager --set-enabled PowerTools
#dnf -y install glusterfs-server nfs-ganesha-gluster
dnf shell << PACKAGES
  install glusterfs-server
  install nfs-ganesha-gluster
  install bind-utils
  run
PACKAGES


# Enable Services
ln -s /lib/systemd/system/glusterd.service /lib/systemd/system/multi-user.target.wants/glusterd.service


# Cleanup
dnf clean all
rm -rf /var/cache/dnf/

