#!/bin/bash
 
LOG_FILE=/var/log/message
IP_LIST="10.226.137.236 11.226.137.237 10.226.137.253"
RETRY_COUNT=3
TIMEOUT=2

ping_check() {
  for IP in $IP_LIST;do
    FAIL_COUNT=0
    for ((i=1; i<=($RETRY_COUNT); i++));do
        if ping -c 1 -W $TIMEOUT $IP >/dev/null; then
            echo "$IP Ping is successful" > /dev/null
            break
        else
            let FAIL_COUNT++
        fi
    done

    if [ $FAIL_COUNT -eq $RETRY_COUNT ]; then
        echo "$IP Ping is failure!" >> $LOG_FILE
    fi
  done
}

while :
do
  ping_check
  sleep 2
done
