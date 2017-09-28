FROM centos:7
MAINTAINER Stephan Zimmer <zimmerst@gmail.com>
# adding yum plugin for overlayfs
RUN yum -y install yum-plugin-ovl && yum clean all
RUN yum -y install texlive*
RUN yum clean all
RUN rm -rf /var/cache/yum
ENTRYPOINT ["/bin/bash","--login","-c"]
