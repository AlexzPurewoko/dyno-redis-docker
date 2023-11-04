FROM ubuntu:18.04

ENV TERM linux
ENV DEBIAN_FRONTEND noninteractive

# COPY dynomite /bin/dynomite
COPY builded/bin/dynomite-hash-tool /usr/local/bin/dynomite-hash-tool
COPY builded/sbin/dynomite /usr/local/sbin/dynomite
COPY builded/sbin/dynomite-test /usr/local/sbin/dynomite-test
COPY startup.sh /bin/startup.sh

RUN apt-get update && \
    apt-get install -y  \
    build-essential \
    autoconf \
    libssl-dev \
    libtool \
    software-properties-common \
    redis-server \
    tcl8.5 \
    && chmod --recursive +x /usr/local/bin/* \
    && chmod --recursive +x /usr/local/sbin/* \
    && chmod +x /bin/startup.sh \
    && sysctl vm.overcommit_memory=1

EXPOSE 8101
EXPOSE 8102
EXPOSE 22122
EXPOSE 22222

ENTRYPOINT ["/bin/startup.sh"]
