#!/bin/sh

rm -rf /opt/volumes/www.nearzero.io/html/
cp -Rf ./html/ /opt/volumes/www.nearzero.io/
cp -Rf ./Caddyfile /opt/volumes/www.nearzero.io/

