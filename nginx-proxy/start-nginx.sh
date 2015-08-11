#!/bin/bash -ex

#pass on the listening ip of the app server to nginx
perl -pli -e "/proxy_pass/ and s/\/[\d\.]*:/\/$1:/" etc/nginx/sites-available/default

#run nginx in foreground
nginx -g "daemon off;"
