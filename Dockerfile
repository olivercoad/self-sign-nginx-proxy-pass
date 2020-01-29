FROM nginx:1.17.8
RUN apt-get update
RUN apt-get install -y openssl

COPY snippets /etc/nginx/snippets
COPY nginx.conf /etc/nginx/nginx.conf.template
COPY gen-key.sh gen-key.sh
COPY start.sh start.sh
RUN chmod +x gen-key.sh start.sh
EXPOSE 443
ENTRYPOINT [ "./start.sh" ]