#!/bin/bash

echo -n -e O que você deseja fazer? "\n" 1[Visualizar itens] "\n" 2[Cadastrar novos itens] "\n" 3[Remover item] "\n" Digite um valor:" "
read A1

ES=/home/$USER/estoque


if [ ! -d $ES ];then
        mkdir $ES
fi

case $A1 in
        1)
                CAT=`ls $ES`
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
                echo -n 'Digite o nome do produto: '      
                read P1
                mkdir $ES/$P1
                echo -n "Digite o valor do produto: R$"   
                read P2
                touch $ES/$P1/valor.val
                echo $P2 >> $ES/$P1/valor.val
                echo -n "Digite a quantidade do produto: "
                read P3
                touch /$ES/$P1/quantidade.qtd
                echo $P3 >> /$ES/$P1/quantidade.qtd;;     
        3)
                echo "Em andamento...";;
        *)
                echo 'Valor não encontrado.';;
esac
