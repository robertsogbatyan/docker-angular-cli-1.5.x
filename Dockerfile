FROM ubuntu
LABEL maintainer="Robert Sogbatyan <robert.sogbatyan@gmail.com>"

RUN apt-get update && apt-get install -y \
curl \
nano \
gnupg

RUN curl -s https://deb.nodesource.com/gpgkey/nodesource.gpg.key | apt-key add -

RUN curl -sL https://deb.nodesource.com/setup_8.x | bash -
RUN apt-get update && apt-get install -y \
nodejs \
build-essential

RUN npm i -g typescript@2.6.x
RUN npm i -g @angular/cli@1.5.x
RUN npm i -g npm-check-updates@latest
RUN npm i -g json-server@latest

VOLUME /home

WORKDIR /home

RUN apt-get clean && apt-get autoclean && apt-get autoremove \
&& rm -rf /var/lib/apt/lists/*

EXPOSE 4200