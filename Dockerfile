FROM eboraas/debian:jessie

MAINTAINER miurahr@linux.com

RUN apt-get update && apt-get install -qq -y git curl
RUN useradd -m app

USER app
ENV HOME /home/app
ENV USER app

WORKDIR /home/app
RUN curl https://install.meteor.com/ | sh
RUN git clone http://git.libreboard.com/libreboard/libreboard.git /home/app/libreboard

USER root
RUN ln -s /home/app/.meteor/packages/meteor-tool/1.1.3/mt-os.linux.x86_64/dev_bundle/bin/npm /usr/bin/npm && \
    ln -s /home/app/.meteor/packages/meteor-tool/1.1.3/mt-os.linux.x86_64/dev_bundle/bin/node /usr/bin/node && \
    ln -s /home/app/.meteor/meteor /usr/bin/meteor

USER app
WORKDIR /home/app/libreboard
RUN git checkout newui
RUN meteor build ../build --directory
RUN cd /home/app/build/bundle/programs/server && npm install

ADD libreboard-run.js /home/app/
RUN mkdir /home/app/logs

WORKDIR /home/app/
RUN npm install forever-monitor

EXPOSE 5555
VOLUME ["/home/app/logs"]
ENTRYPOINT ["/usr/bin/node", "/home/app/libreboard-run.js"]
