
# Use an official Ruby runtime as a parent image
FROM ruby:2.6.3
RUN apt-get update && apt-get install -y nodejs

#download docker compose
RUN apt-get install -y curl && apt-get install -y docker.io
RUN apt-get install -y curl && apt-get install -y wget
RUN curl -L "https://github.com/docker/compose/releases/download/1.24.1/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose && chmod +x /usr/local/bin/docker-compose && ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose

# Set the working directory to /myapp
RUN mkdir /myapp
WORKDIR /myapp

RUN apt-get install git

# Copy the current directory contents into the container at /myapp
RUN cd /myapp && git clone https://github.com/Lord-Sekke/API-on-Rails.git

