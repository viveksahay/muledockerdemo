FROM java:openjdk-8-jdk

MAINTAINER baran.mano@gmail.com

RUN cd ~ && wget https://storage.googleapis.com/muledockerdemo/mule-enterprise-standalone-4.2.2.managed.zip
RUN cd ~ && wget https://storage.googleapis.com/muledockerdemo/muleappdockerdemo.jar

RUN apt-get install unzip
RUN cd /opt && unzip ~/mule-enterprise-standalone-4.1.5.zip && rm ~/mule-enterprise-standalone-4.1.5.zip && ln -s /opt/mule-enterprise-standalone-4.1.5 /opt/mule
RUN chmod -R 777 /opt/mule-enterprise-standalone-4.1.5
RUN cp ~/sample-api-books.jar /opt/mule/apps

# Define environment variables.
ENV MULE_HOME /opt/mule

# Define mount points.
VOLUME ["/opt/mule/logs"]

# Define working directory.
WORKDIR /opt/mule

CMD ["/opt/mule/bin/mule"]
# Default http port
EXPOSE 8029