FROM grigio/meteor:1.0.3.1
# based on debian jessie

MAINTAINER miurahr


ADD libreboard-run.sh /opt/
ADD meteor-build.sh /opt/
RUN chmod +x /opt/*.sh
RUN apt-get update && apt-get install -qq -y git
RUN useradd -m app

USER app
ENV HOME /home/app
ENV USER app

WORKDIR /home/app
RUN git clone http://git.libreboard.com/libreboard/libreboard.git /home/app/libreboard

WORKDIR /home/app/libreboard
RUN rm -rf .meteor

RUN /opt/meteor-build.sh

CMD /opt/libreboard-run.sh
