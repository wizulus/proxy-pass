#!/bin/bash
set -e

build_nginx_config() {
  echo "server {"
  echo "  listen 80;"
  echo "  error_log /var/log/nginx/error.log debug;"

  ## Take command line parameters 2 at a time as originalPath and replacement_url
  while [[ $# -gt 1 ]]
  do
    originalPath="$1"
    replacement_url="$2"
    shift 2

    echo "  location $originalPath {"
    echo "    proxy_pass $replacement_url;"
    echo "    proxy_set_header Upgrade \$http_upgrade;"
    echo "    proxy_set_header Connection 'upgrade';"
    echo "    proxy_set_header Host \$host;"
    echo "    proxy_set_header X-Real-IP \$remote_addr;"
    echo "    proxy_set_header X-Forwarded-For \$proxy_add_x_forwarded_for;"
    echo "    proxy_cache_bypass \$http_upgrade;" 
    echo "  }"
  done


  echo "}"
}

build_nginx_config $* > /etc/nginx/conf.d/default.conf

nginx -g 'daemon off;'