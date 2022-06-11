#!/bin/sh

SCREENNAME=minecraft-$1
if screen -ls | grep -o "${SCREENNAME}"
then
    echo "Sending announcement..."
    screen -S $SCREENNAME -X stuff 'say 30秒後にサーバーを停止します\n'
    sleep 20
    screen -S $SCREENNAME -X stuff 'say 10秒後にサーバーを停止します\n'
    sleep 10
    screen -S $SCREENNAME -X stuff 'say サーバーを停止します\n'

    echo "Saving all..."
    screen -S $SCREENNAME -X stuff 'save-all\n'
    sleep 5s

    echo "Server stopping..."
    screen -S $SCREENNAME -X stuff 'stop\015'
    while screen -ls | grep -o "${SCREENNAME}"
    do
      sleep 2
    done
else
    echo 'server is not runnning'
fi