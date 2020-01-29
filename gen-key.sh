if [ -f /etc/ssl/certs/doregendate ]; then
  doregendate=$(cat /etc/ssl/certs/doregendate)
  nowdate=$(date +"%Y/%m/%d")
  if [[ $nowdate > $doregendate ]]; then
    rm /etc/ssl/private/nginx-selfsigned.key
    rm /etc/ssl/certs/nginx-selfsigned.crt
    rm /etc/ssl/certs/dhparam.pem
    rm /etc/ssl/certs/doregendate
  fi
fi

if [ ! -f /etc/ssl/certs/doregendate ];  then
    openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt -batch
    openssl dhparam -out /etc/ssl/certs/dhparam.pem 2048
    date -d '+180day' +"%Y/%m/%d" > /etc/ssl/certs/doregendate
fi