./gen-key.sh
target=${1:-http://dockerhost}
sed "s,target,$target,g" /etc/nginx/nginx.conf.template > /etc/nginx/nginx.conf
nginx -g "daemon off;"