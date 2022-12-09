#!/bin/bash

clear

#PRINT DE COMANDOS
echo "-----------------------------------------"
echo "O que você deseja fazer?"
echo "-----------------------------------------"
echo "1 [Visualizar estoque]"
echo ""
echo "2 [Adicionar um item ao estoque]"
echo ""
echo "3 [Remover item um do estoque]"
echo ""
echo "4 [Alterar valor de um item do estoque]"
echo "-----------------------------------------"
echo -n "Digite o valor da tarefa que deseja realizar: "
read A1

#DIRETÓRIO DO ESTOQUE
ES=/home/$USER/estoque

#SE O DIRETORIO DO ESTOQUE NÃO EXISTIR, COMANDO PARA CRIAR
if [ ! -d $ES ];then
        mkdir $ES
fi

#USANDO OS COMANDOS INSERIDOS A CIMA
case $A1 in
#VISUALIZAR ESTOQUE
        1)

                #MOSTRA OS ITENS DO ESTOQUE
                CAT=`ls $ES`

                V=" "

                #VERIFICAÇÃO SE O ESTOQUE ESTÁ VAZIO
                if [ $CAT == $V ];then
                        clear
                        echo "-----------------------------------------"
                        echo "O estoque está vazio."
                        echo "-----------------------------------------"
                else
                        clear
                        echo "-----------------------------------------"
                        echo $CAT
                        echo "-----------------------------------------"
                fi
                echo " ";;

#ADICIONAR ITEM AO ESTOQUE
        2)
                clear

                #NOME DO PRODUTO
                echo "-----------------------------------------"
                echo -n 'Digite o nome do produto: '
                read P1
                mkdir $ES/$P1

                #VALOR DO PRODUTO
                echo "-----------------------------------------"
                echo -n "Digite o valor do produto: R$"
                read P2
                touch $ES/$P1/valor.val
                echo $P2 >> $ES/$P1/valor.val

                #QUANTIDADE DO PRODUTO
                echo "-----------------------------------------"
                echo -n "Digite a quantidade do produto: "
                read P3
                touch /$ES/$P1/quantidade.qtd
                echo $P3 >> /$ES/$P1/quantidade.qtd;;

#RETIRAR ITEM DO ESTOQUE
        3)
                clear

                #MOSTRA ITENS DO ESTOQUE
                ls $ES

                #INSERIR NOME DO PRODUTO
                echo "-----------------------------------------"
                echo -n "Digite o nome do item que deseja retirar: "
                read P4

                #SE O ITEM EXISTIR OU NÃO
                if [ -d $ES/$P4 ];then
                        rm -rf $ES/$P4
                        echo "-----------------------------------------"
                        echo "Item $P4 removido do estoque."
                else
                        echo "-----------------------------------------"
                        echo "Sinto muito, item inexistente"
                fi;;

 4)
                clear

                #MOSTRA O ESTOQUE
                A3=`ls $ES`

                #SE O ESTOQUE ESTIVER OU NÃO VAZIO
                if [ $A3 == "" ];then
                        clear
                        echo "-----------------------------------------"
                        echo "Estoque vazio"
                else
                        clear
                        ls $ES
                fi

                #DIGITAR O NOME DO PRODUTO
                echo "-----------------------------------------"
                echo -n "Digite o nome do item que deseja alterar: "
                read P5

                #SE O PRODUTO EXISTIR OU NÃO
                if [ -d $ES/$P5/ ];then
                        clear

                        #NOVO VALOR DO PRODUTO
                        echo "-----------------------------------------"
                        echo -n "Digite o novo valor de $P5: "
                        read P6
                        echo $P6 > $ES/$P5/valor.val
                        cat $ES/$P5/valor.val

                        #NOVA QUANTIDADE DO PRODUTO
                        echo "-----------------------------------------"
                        echo -n "Digite a nova quantidade de $P5: "
                        read P7
                        echo $P7 > $ES/$P5/quantidade.qtd
                        cat $ES/$P5/quantidade.qtd
                else
                        echo "-----------------------------------------"
                        echo "Item inexistente."
                fi;;

        #OUTROS VALORES
        *)
                clear
                echo "-----------------------------------------"
                echo 'Valor incorreto.'
                echo "-----------------------------------------";;
esac
