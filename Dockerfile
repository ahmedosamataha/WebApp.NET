# Pulling the base image
FROM ubuntu:latest

# Naming the image author
LABEL maintainer="ahmedosama"

# Adding the code to the docker image
#ADD . /myWebApp
@WORKDIR /myWebApp

# updating the platform
RUN apt-get upgrade
RUN apt-get update
RUN apt-get -y install sudo

# installing dependencies
RUN sudo apt-get install -y aspnetcore-runtime-6.0

# Compiling the program source code
RUN dotnet build
