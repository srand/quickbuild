#!/bin/bash

set -e

[ -z "$QUICKBUILD_URL" ] && QUICKBUILD_URL=http://$QUICKBUILD_HOST:8810

wget --user "$QUICKBUILD_USER" --password "$QUICKBUILD_PASSWD" "$QUICKBUILD_URL/download/buildagent.tar.gz"
tar xzvf buildagent.tar.gz

echo "serverUrl=$QUICKBUILD_URL" >> buildagent/conf/node.properties

sh buildagent/bin/agent.sh $@
