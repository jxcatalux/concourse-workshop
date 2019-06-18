FROM ubuntu:latest

RUN apt-get update && \
    apt-get install --yes python jq wget unzip

RUN wget https://yt-dl.org/downloads/latest/youtube-dl -O /usr/local/bin/youtube-dl && \
      chmod a+rx /usr/local/bin/youtube-dl

ADD assets/ /opt/resource/