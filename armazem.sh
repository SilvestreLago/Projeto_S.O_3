#!/bin/bash

echo -n "Digite: 1[Visualizar itens] 2[Cadastrar novos itens]:  "
read A1

ES=/home/$USER/estoque.txt


if [ ! -e $ES ];then
        touch $ES
fi

case $A1 in
        1)
                CAT=`cat $ES`
                V=" "
                if [ $CAT == $V ];then
                        clear
                        echo "O estoque está vazio."
                else
                        clear
                        echo $CAT
                fi
                echo " ";;
        2)
                echo -n 'Digite o nome do produto, valor e quantidade: '
                read P1
                echo "$P1 " >> $ES;;
        *)
                echo 'Valor não encontrado.';;
esac
