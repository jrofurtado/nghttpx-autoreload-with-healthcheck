sleep 1
NGHTTPX_PID=$(ps aux | grep -m1 'nghttpx' | awk '{print $1}')
echo "nghttpx PID is $NGHTTPX_PID"
inotifywait -e close_write,moved_to,create -m /volume |
while read -r directory events filename; do
  echo "$filename modified";
  if [ "$filename" = "server.crt" ]; then
    sleep 1 && echo "going to reload nghttpx configuration" && kill -1 $NGHTTPX_PID
  fi
done
