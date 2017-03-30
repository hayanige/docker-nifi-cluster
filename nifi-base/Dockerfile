FROM centos:7.3.1611
MAINTAINER hayanige

USER root

ENV TERM xterm

# install dev tools
RUN yum clean all; \
    rpm --rebuilddb; \
    yum install -y curl which tar sudo openssh-server openssh-clients rsync less iproute net-tools bind-utils
RUN yum update -y libselinux

# java
RUN curl -LO 'http://download.oracle.com/otn-pub/java/jdk/8u121-b13/e9e7ea248e2c4826b92b3f075a80e441/jdk-8u121-linux-x64.rpm' -H 'Cookie: oraclelicense=accept-securebackup-cookie'
RUN rpm -i jdk-8u121-linux-x64.rpm
RUN rm jdk-8u121-linux-x64.rpm
ENV JAVA_HOME /usr/java/default
ENV PATH $PATH:$JAVA_HOME/bin
RUN rm /usr/bin/java && ln -s $JAVA_HOME/bin/java /usr/bin/java

# nifi
RUN curl -s http://www.eu.apache.org/dist/nifi/1.1.2/nifi-1.1.2-bin.tar.gz | tar -xz -C /usr/local/
RUN cd /usr/local && ln -s ./nifi-1.1.2 nifi
ADD nifi.properties /usr/local/nifi/conf/nifi.properties

ADD bootstrap.sh /bootstrap.sh
RUN chmod +x /bootstrap.sh
ENTRYPOINT ["/bootstrap.sh"]
