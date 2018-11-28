FROM centos:7
MAINTAINER Stephan Zimmer <zimmerst@gmail.com>
# adding yum plugin for overlayfs
RUN yum -y install yum-plugin-ovl && yum clean all
RUN yum -y install perl-Digest-MD5 wget
RUN yum clean all
RUN rm -rf /var/cache/yum

RUN curl -o /tmp/install-tl-unx.tar.gz http://ftp.acc.umu.se/mirror/CTAN/systems/texlive/tlnet/install-tl-unx.tar.gz && \
    cd /tmp/ && tar xzf install-tl-unx.tar.gz

COPY texlive.profile /tmp/texlive.profile

RUN cd /tmp/install-tl-* && ./install-tl -profile /tmp/texlive.profile -no-verify-downloads -persistent-downloads

ENV PATH=/usr/local/texlive/2018/bin/x86_64-linux:${PATH}
ENV MANPATH=/usr/local/texlive/2018/texmf-dist/doc/man:${MANPATH}
ENV INFOPATH=/usr/local/texlive/2018/texmf-dist/doc/info:${INFOPATH}

ENTRYPOINT ["/bin/bash","--login","-c"]
