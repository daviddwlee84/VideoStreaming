#!/bin/bash

URL="udp://127.0.0.1:10000"

python3 gopro_broadcast.py $URL &> gopro.log &
gopro_pid=$!
echo $gopro_pid

# sleep 2 # simply wait the gopro to broadcast (seems not necessary)

mpv --force-seekable=yes $URL > mpv.log &
mpv_pid=$!
echo $mpv_pid

# clean up (shutdown) the gopro and mpv thread
trap '{ kill -9 $gopro_pid $mpv_pid ; exit 1; }' INT
# loop to wait until the interrupt (maybe there is a better way)
while true; do
    sleep 10000
done
