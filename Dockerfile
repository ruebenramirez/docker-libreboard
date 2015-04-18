FROM grigio/meteor:1.0.3.1
# based on debian jessie

MAINTAINER miurahr

RUN apt-get update && apt-get install -qq -y git && \
    git clone --depth 1 http://git.libreboard.com/libreboard/libreboard.git /app

ENV HOME /app
WORKDIR /app
RUN /meteor-build.sh

# Run the generated files
CMD /meteor-run.sh
