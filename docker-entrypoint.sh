#!/bin/sh
set -e

VITE_GRAPHQL_URI="${VITE_GRAPHQL_URI:-http://34.228.62.193:8083/graphql}"
VITE_SERVER_URI="${VITE_SERVER_URI:-http://34.228.62.193:8083}"

find /usr/share/nginx/html/assets -name '*.js' -exec sed -i \
"s|__VITE_GRAPHQL_URI_PLACEHOLDER__|${VITE_GRAPHQL_URI}|g" {} +

find /usr/share/nginx/html/assets -name '*.js' -exec sed -i \
"s|__VITE_SERVER_URI_PLACEHOLDER__|${VITE_SERVER_URI}|g" {} +

echo "Configured"
exec nginx -g 'daemon off;'