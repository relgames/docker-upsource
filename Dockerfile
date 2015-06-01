FROM dockerfile/java:oracle-java8

ENV UPSOURCE_VERSION 1.0.12566
WORKDIR /opt
RUN mkdir -p /home/upsource \
	&& groupadd -g 999 upsource \
	&& useradd -u 999 -g upsource -d /home/upsource upsource \
	&& chown -R upsource:upsource /home/upsource \
	&& wget -nv http://download.jetbrains.com/upsource/upsource-$UPSOURCE_VERSION.zip \
	&& unzip upsource-$UPSOURCE_VERSION.zip \
	&& rm -rf upsource-$UPSOURCE_VERSION.zip \
	&& chown -R upsource:upsource Upsource
USER upsource
EXPOSE 8080
WORKDIR /opt/Upsource
CMD ["bin/upsource.sh", "run"]
