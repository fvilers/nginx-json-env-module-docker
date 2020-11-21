FROM gcc:4.9 as builder
WORKDIR /usr/src
RUN wget https://nginx.org/download/nginx-1.19.4.tar.gz
RUN tar -xzvf nginx-1.19.4.tar.gz
RUN git clone https://github.com/fvilers/nginx-json-env-module.git
RUN cd nginx-1.19.4/ \
  && ./configure --with-compat --add-dynamic-module=../nginx-json-env-module/src \
  && make modules

FROM nginx:1.19.4
COPY nginx.conf /etc/nginx
COPY --from=builder /usr/src/nginx-1.19.4/objs/ngx_http_json_env_module.so /etc/nginx/modules
EXPOSE 80
