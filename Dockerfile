FROM ubuntu:focal

RUN apt-get update
RUN apt-get install -y ruby-full

# WARNING: CocoaPods requires your terminal to be using UTF-8 encoding.
RUN apt-get install -y locales language-pack-en
RUN locale-gen 
ENV LANG en_US.UTF-8

RUN apt-get install -y git curl build-essential
RUN gem install cocoapods

# You cannot run CocoaPods as root.
RUN adduser cocoapods
USER cocoapods
