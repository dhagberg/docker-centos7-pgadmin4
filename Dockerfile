FROM centos:centos7
MAINTAINER D. J. Hagberg <dhagberg@millibits.com>

RUN set -xe && set -o pipefail \
 && yum -y update \
 && yum -y localinstall \
  https://github.com/krallin/tini/releases/download/v0.10.0/tini_0.10.0.rpm \
  https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm \
  https://download.postgresql.org/pub/repos/yum/9.5/redhat/rhel-7-x86_64/pgdg-centos95-9.5-3.noarch.rpm \
 && yum -y install pgadmin4-web pgadmin4-docs \
 && yum clean all

COPY config_distro.py  config_local.py /usr/lib/python2.7/site-packages/pgadmin4-web/

RUN set -xe && set -o pipefail \
 && /bin/rm /usr/lib/python2.7/site-packages/pgadmin4-web/config_{distro,local}.{pyc,pyo} \
 && python -O -m compileall /usr/lib/python2.7/site-packages/pgadmin4-web/ \
 && groupadd -g 533 pgadmin \
 && useradd -c pgadmin4 -g pgadmin -m -s /bin/bash -u 533 pgadmin \
 && install -d -v -o root -g pgadmin -m 2770 /var/lib/pgadmin4 \
 && true

# Port and data dir set in config*.py
EXPOSE 5050
VOLUME /var/lib/pgadmin4

USER pgadmin

ENTRYPOINT ["/usr/bin/tini", "--"]
CMD ["/usr/bin/python2", "/usr/lib/python2.7/site-packages/pgadmin4-web/pgAdmin4.py"]
