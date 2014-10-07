############################################################
# Dockerfile to run Memcached Containers
# Based on Ubuntu Image
############################################################

# Set the base image to use to Ubuntu
FROM ubuntu

# Set the file maintainer (your name - the file's author)
MAINTAINER Jason Hamm

RUN apt-get -y update
RUN apt-get -y install build-essential zlib1g-dev libssl-dev libreadline6-dev libyaml-dev

ADD http://cache.ruby-lang.org/pub/ruby/ruby-2.1.2.tar.gz /tmp/

RUN cd /tmp && \
	tar -xzf ruby-2.1.2.tar.gz && \
	cd ruby-2.1.2 && \
	./configure && \
	make && \
	make install && \
	cd .. && \
	rm -rf ruby-2.1.2 && \
	rm -f ruby-2.1.2.tar.gz

RUN gem install rails --no-document