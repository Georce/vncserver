#version 1.1
FROM centos:centos6.6
MAINTAINER wujian@wujian360.cn

RUN rpm -ivh http://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm
RUN rpm -ivh http://pkgs.repoforge.org/rpmforge-release/rpmforge-release-0.5.3-1.el6.rf.x86_64.rpm
RUN yum groupinstall -y xfce
RUN yum install -y tigervnc-server openssh openssh-server openssh-clients && yum clean all
ADD run.sh /run.sh
RUN chmod 755 /run.sh && /bin/echo 'root:aaaaaa' |chpasswd
EXPOSE 5900
CMD ["/run.sh"]
