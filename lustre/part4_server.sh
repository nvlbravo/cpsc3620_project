#!/bin/bash

sudo echo "=== SETUP - PART 4 ==="

  yum install openmpi net-snmp net-snmp-utils libyaml sg3_utils -y

  #download lustre server modules and e2fsprogs
  wget https://downloads.hpdd.intel.com/public/lustre/lustre-2.7.0/el6.6/server/RPMS/x86_64/lustre-2.7.0-2.6.32_504.8.1.el6_lustre.x86_64.x86_64.rpm --no-check-certificate
  wget https://downloads.hpdd.intel.com/public/lustre/lustre-2.7.0/el6.6/server/RPMS/x86_64/lustre-iokit-2.7.0-2.6.32_504.8.1.el6_lustre.x86_64.x86_64.rpm --no-check-certificate
  wget https://downloads.hpdd.intel.com/public/lustre/lustre-2.7.0/el6.6/server/RPMS/x86_64/lustre-modules-2.7.0-2.6.32_504.8.1.el6_lustre.x86_64.x86_64.rpm --no-check-certificate
  wget https://downloads.hpdd.intel.com/public/lustre/lustre-2.7.0/el6.6/server/RPMS/x86_64/lustre-osd-ldiskfs-2.7.0-2.6.32_504.8.1.el6_lustre.x86_64.x86_64.rpm --no-check-certificate
  wget https://downloads.hpdd.intel.com/public/lustre/lustre-2.7.0/el6.6/server/RPMS/x86_64/lustre-osd-ldiskfs-mount-2.7.0-2.6.32_504.8.1.el6_lustre.x86_64.x86_64.rpm --no-check-certificate
  wget https://downloads.hpdd.intel.com/public/lustre/lustre-2.7.0/el6.6/server/RPMS/x86_64/lustre-tests-2.7.0-2.6.32_504.8.1.el6_lustre.x86_64.x86_64.rpm --no-check-certificate
  wget https://downloads.hpdd.intel.com/public/e2fsprogs/latest/el6/RPMS/x86_64/e2fsprogs-1.42.13.wc5-7.el6.x86_64.rpm --no-check-certificate
  wget https://downloads.hpdd.intel.com/public/e2fsprogs/latest/el6/RPMS/x86_64/e2fsprogs-libs-1.42.13.wc5-7.el6.x86_64.rpm --no-check-certificate
  wget https://downloads.hpdd.intel.com/public/e2fsprogs/latest/el6/RPMS/x86_64/libcom_err-1.42.13.wc5-7.el6.x86_64.rpm --no-check-certificate
  wget https://downloads.hpdd.intel.com/public/e2fsprogs/latest/el6/RPMS/x86_64/libcom_err-devel-1.42.13.wc5-7.el6.x86_64.rpm --no-check-certificate
  wget https://downloads.hpdd.intel.com/public/e2fsprogs/latest/el6/RPMS/x86_64/libss-1.42.13.wc5-7.el6.x86_64.rpm --no-check-certificate

  #install e2fsprogs
  rpm -Uvh e2fsprogs-1.42.13.wc5-7.el6.x86_64.rpm e2fsprogs-libs-1.42.13.wc5-7.el6.x86_64.rpm libcom_err-1.42.13.wc5-7.el6.x86_64.rpm libss-1.42.13.wc5-7.el6.x86_64.rpm libcom_err-devel-1.42.13.wc5-7.el6.x86_64.rpm

  #install lustre server modules
  rpm -ivh lustre-modules-*
  rpm -ivh lustre-osd-ldiskfs-*
  rpm -ivh lustre-2.7*
  rpm -ivh lustre-iokit-2.7*
  rpm -ivh lustre-tests-*

  sudo touch /etc/sysconfig/modules/lnet.modules
  sudo reboot
