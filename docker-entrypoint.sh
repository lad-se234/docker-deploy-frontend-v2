#!/bin/sh
set -e

VITE_GRAPHQL_URI="${VITE_GRAPHQL_URI:-http://54.159.15.35/graphql}"
VITE_SERVER_URI="${VITE_SERVER_URI:-http://54.159.15.35:8082}"

find /usr/share/nginx/html/assets -name '*.js' -exec sed -i \
"s|__VITE_GRAPHQL_URI_PLACEHOLDER__|${VITE_GRAPHQL_URI}|g" {} +

find /usr/share/nginx/html/assets -name '*.js' -exec sed -i \
"s|__VITE_SERVER_URI_PLACEHOLDER__|${VITE_SERVER_URI}|g" {} +

echo "Configured"