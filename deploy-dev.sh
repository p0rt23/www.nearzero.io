#!/bin/sh

rm -rf /opt/volumes/www2.nearzero.io/html/
cp -Rf ./html/ /opt/volumes/www2.nearzero.io/
cp -Rf ./Caddyfile /opt/volumes/www2.nearzero.io/

