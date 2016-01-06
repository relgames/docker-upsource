FROM docker-stage.ipsoft.com/centos-java:8

ENV UPSOURCE_VERSION 2.5.4995

WORKDIR /opt

RUN mkdir -p /home/upsource 
RUN groupadd -g 999 upsource 
RUN useradd -u 999 -g upsource -d /home/upsource upsource 
RUN chown -R upsource:upsource /home/upsource 

RUN wget -nv http://download.jetbrains.com/upsource/upsource-$UPSOURCE_VERSION.zip 
RUN yum install -y unzip
RUN unzip upsource-$UPSOURCE_VERSION.zip 
RUN rm -rf upsource-$UPSOURCE_VERSION.zip 

#ADD http://download.jetbrains.com/upsource/upsource-$UPSOURCE_VERSION.zip /opt/Upsource/

RUN chown -R upsource:upsource Upsource

USER upsource
EXPOSE 8080
WORKDIR /opt/Upsource
CMD ["bin/upsource.sh", "run"]
