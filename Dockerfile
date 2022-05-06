# Pulling the base image
FROM ubuntu:20.04

# Naming the image author
LABEL maintainer="ahmedosama"

# Adding the code to the docker image
ADD . /myWebApp
WORKDIR /myWebApp

RUN ls
# updating the platform
RUN apt-get upgrade
#RUN apt-get update
RUN  apt-get update && apt-get install -y wget
#RUN apt-get -y install sudo

# installing dependencies
RUN wget https://packages.microsoft.com/config/ubuntu/21.04/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
RUN dpkg -i packages-microsoft-prod.deb
RUN apt-get update; \
    apt-get install -y apt-transport-https && \
    apt-get update && \
    apt-get install -y dotnet-sdk-6.0
# Compiling the program source code
RUN dotnet --version
RUN dotnet build
