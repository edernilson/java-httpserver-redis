FROM ubuntu:18.04
LABEL MAINTAINER="eder.nilson@gmail.com"
# RUN apt-get update && apt-get install -y python3-software-properties software-properties-common
# RUN add-apt-repository ppa:webupd8team/java
# RUN echo "oracle-java8-installer shared/accepted-oracle-license-v1-1 boolean true" | debconf-set-selections
RUN apt-get update && apt-get install -y openjdk-8-jdk maven
ADD . /usr/local/todolist
RUN cd /usr/local/todolist && mvn assembly:assembly
CMD ["java", "-cp", "/usr/local/todolist/target/todolist-1.0-jar-with-dependencies.jar", "com.edernilson.todolist.TodoServer"]