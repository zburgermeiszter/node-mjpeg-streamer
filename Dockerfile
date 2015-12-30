FROM ubuntu:14.04

WORKDIR /tmp

ADD package.json ./
ADD mjpeg-streamer.js ./

RUN apt-get update -y && \
    apt-get dist-upgrade -y

RUN apt-get -y install python-software-properties software-properties-common curl && \
    add-apt-repository -y ppa:ubuntu-toolchain-r/test && \
    apt-get update -y && \
    curl -sL https://deb.nodesource.com/setup_4.x | sudo -E bash - && \
    apt-get install -y nodejs build-essential gcc-4.9 g++-4.9 && \
	update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-4.9 60 --slave /usr/bin/g++ g++ /usr/bin/g++-4.9

RUN npm install

EXPOSE 8080

CMD node ./mjpeg-streamer.js