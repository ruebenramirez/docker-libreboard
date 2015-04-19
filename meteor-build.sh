#!/bin/sh
#
# https://github.com/grigio/docker-meteor: meteor was installed /.meteor
#
BUNDLED=/.meteor/packages/meteor-tool/*/meteor-tool-os.linux.x86_64/dev_bundle/bin
cd /home/app/libreboard
/usr/local/bin/meteor build --directory .
cd bundle/programs/server
${BUNDLED}/npm install
