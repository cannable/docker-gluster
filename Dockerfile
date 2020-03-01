FROM centos:latest

COPY ["./data", "/data"]
#COPY ["./overrides", "/data/overrides"]
RUN ["/bin/bash", "/data/build.sh"]

#VOLUME ["/usr/local/tomcat/conf", \
#        "/usr/local/tomcat/logs", \
#        "/usr/local/tomcat/temp", \
#        "/usr/local/tomcat/webapps", \
#        "/usr/local/tomcat/work"]


#ENTRYPOINT ["/usr/bin/dumb-init", "--"]
#CMD ["/bin/bash", "/data/init.sh"]


STOPSIGNAL SIGRTMIN+3
CMD ["/sbin/init"]
