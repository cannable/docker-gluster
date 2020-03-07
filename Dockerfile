FROM centos:latest


ENV GANESHA_MAJOR=2.8 \
    GANESHA_MINOR=2.8.0


COPY ["./data", "/data"]
RUN ["/bin/bash", "/data/build.sh"]


VOLUME ["/etc/ganesha", \
        "/etc/glusterfs", \
        "/var/lib/glusterd", \
        "/var/lib/nfs", \
        "/var/log/ganesha", \
        "/var/log/glusterfs"]


EXPOSE "111/tcp" \
  "245/tcp" \
  "443/tcp" \
  "2222/tcp" \
  "2049/tcp" \
  "8080/tcp" \
  "6010:6012/tcp" \
  "24007/tcp" \
  "38465/tcp" \
  "38466/tcp" \
  "38468/tcp" \
  "38469/tcp" \
  "49152:49162/tcp"


STOPSIGNAL SIGRTMIN+3
CMD ["/sbin/init"]
