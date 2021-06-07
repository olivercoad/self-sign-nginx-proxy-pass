#!/bin/bash
./gen-key.sh
target=${1:-http://dockerhost}
maxbodysize=${MAXBODYSIZE:-20m}
sed -e "s,target,$target,g" -e "s,maxbodysize,$maxbodysize,g" /etc/nginx/nginx.conf.template > /etc/nginx/nginx.conf
nginx -g "daemon off;"