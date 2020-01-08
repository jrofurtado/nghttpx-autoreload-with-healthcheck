set -e
COMMAND=$(echo -e nghttpx "$PARAMS" '-f"127.0.0.1,8000;no-tls;healthmon" /volume/server.key /volume/server.crt --no-ocsp')
echo "executing nghttpx. waiting to reload if volume/server.crt changes"
echo -e "$COMMAND"
./check-crt.sh 1>/dev/stdout 2>/dev/stderr &
eval "$COMMAND" 1>/dev/stdout 2>/dev/stderr
