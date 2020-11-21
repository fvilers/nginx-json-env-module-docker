@echo off
docker run -d --rm --name nginx-json-env -e FOO=bar -p 8080:80 fvilers/nginx-json-env:1.19.4
