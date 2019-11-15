FROM maven:3.6.2-jdk-11

RUN apt-get update && apt-get install -y \
  apt-transport-https \
  ca-certificates \
  curl \
  gnupg2 \
  software-properties-common

RUN curl -fsSL https://download.docker.com/linux/$(. /etc/os-release; echo "$ID")/gpg | apt-key add - && \
  apt-key fingerprint 0EBFCD88 && \
  add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/$(. /etc/os-release; echo "$ID") $(lsb_release -cs) stable"

RUN apt-get update && apt-get install -y \
  docker-ce \
  git \
  ruby-full \
  build-essential \ 
  patch \
  ruby-dev \
  zlib1g-dev \
  liblzma-dev

RUN gem install --no-rdoc --no-ri pdd xcop