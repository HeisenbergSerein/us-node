#!/bin/sh
PORT=${PORT:-10000}
cat > /tmp/config.json <<EOF
{"log":{"loglevel":"warning"},"inbounds":[{"listen":"0.0.0.0","port":$PORT,"protocol":"vless","settings":{"clients":[{"id":"$CLIENT_ID"}],"decryption":"none"},"streamSettings":{"network":"ws","wsSettings":{"path":"/ws"}}}],"outbounds":[{"protocol":"freedom"}]}
EOF
exec /usr/bin/xray run -config /tmp/config.json
