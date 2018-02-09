FROM centos:centos6

MAINTAINER Tony Grinderz <grinderz@protonmail.com>

LABEL Description="SoftetherVPN Build Image" Version="1.0" Vendor="VARCH" org.label-schema.vcs-url="https://github.com/Grinderz/softethervpn-build-docker.git"

RUN yum -y \
    install \
    ncurses-devel \
    openssl-devel \
    readline-devel \
    gcc \
    rpmdevtools && \
    rpmdev-setuptree

VOLUME /root/rpmbuild/RPMS

ADD contrib/centos/SOURCES /root/rpmbuild/SOURCES
ADD contrib/centos/SPECS/softethervpn.spec .

RUN spectool -g -R softethervpn.spec

ADD entrypoint.sh .

ENTRYPOINT ["bash"]
CMD ["entrypoint.sh"]