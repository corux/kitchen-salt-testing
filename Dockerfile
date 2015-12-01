FROM centos:7
MAINTAINER "corux" <corux@corux.de>
ENV container docker

RUN yum -y swap -- remove fakesystemd -- install systemd systemd-libs

RUN curl --silent -O https://repo.saltstack.com/yum/rhel7/SALTSTACK-GPG-KEY.pub; \
    rpm --import SALTSTACK-GPG-KEY.pub; \
    rm -f SALTSTACK-GPG-KEY.pub; \
    curl --silent -L http://repo.saltstack.com/yum/rhel7/saltstack-rhel7.repo > /etc/yum.repos.d/saltstack.repo; \
    yum -y install salt-minion; \
    systemctl enable salt-minion.service;

RUN curl --silent -L https://www.getchef.com/chef/install.sh | sh

RUN yum -y update; yum clean all; \
    (cd /lib/systemd/system/sysinit.target.wants/; for i in *; do [ $i == systemd-tmpfiles-setup.service ] || rm -f $i; done); \
    rm -f /lib/systemd/system/multi-user.target.wants/*;\
    rm -f /etc/systemd/system/*.wants/*;\
    rm -f /lib/systemd/system/local-fs.target.wants/*; \
    rm -f /lib/systemd/system/sockets.target.wants/*udev*; \
    rm -f /lib/systemd/system/sockets.target.wants/*initctl*; \
    rm -f /lib/systemd/system/basic.target.wants/*;\
    rm -f /lib/systemd/system/anaconda.target.wants/*;

VOLUME [ "/sys/fs/cgroup" ]
CMD ["/usr/sbin/init"]
