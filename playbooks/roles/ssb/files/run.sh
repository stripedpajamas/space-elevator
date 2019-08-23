#!/bin/bash
PATH=$PATH:/home/spaceman/.nvm/versions/node/v10.16.3/bin
while true; do
	ssb-server start --host localhost
	sleep 10
done
