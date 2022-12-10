#!/bin/bash

clear

#FUNÇÃO PARA ESCREVER OS DADOS
function escrever_dados {

        #verifica se a lista existe
        if [ ! -e $ES/dados/dado_p.pdt ]; then
                touch $ES/dados/dado_p.pdt
                echo ` ls $EP ` >> $ES/dados/dado_p.pdt
        fi

        LS=$ES/dados
        EX=`cat $LS/dado_p.pdt`

        if [[ $EX == "" ]] #verifica se ela está em branco
        then
                echo ` ls $EP ` >> $LS/dado_p.pdt
                echo ` ls $LS/dado_p.pdt `
                clear
                echo "Estoque em branco."
                elif [[ $CAT != $EX ]] #verifica se a lista está atualizada
        then
                truncate -s 0 $LS/dado_p.pdt #limpa o arquivo
                echo ` ls $EP ` >> $LS/dado_p.pdt
        fi


        IFS=' ' read -ra List_produtos <<< "$EX"

        declare -A List_prec
        declare -A List_qunt

        for I in ${!List_produtos[@]}
        do
                DIR_L=${List_produtos[$I]}
                ATL=$EP/$DIR_L
                if [ -e $ATL/valor.val ]; then
                        List_prec[$I]=`cat $ATL/valor.val`
                fi
                if [ -e $ATL/quantidade.qtd ]; then
                        List_qunt[$I]=`cat $ATL/quantidade.qtd`
                fi
        done

        for C in ${!List_produtos[@]}
        do
                echo "Produto" $C"; "${List_produtos[$C]}"; ""Quantidade" ${List_qunt[$C]}"; ""Preço R$"${List_prec[$C]}
        done
}


while true
do
        #MOSTRA NA TELA OS COMANDOS
        echo "-----------------------------------------"
        echo "O que você deseja fazer?"
        echo "-----------------------------------------"
        echo "1 [Visualizar estoque]"
        echo ""
        echo "2 [Adicionar um item ao estoque]"
        echo ""
        echo "3 [Remover um item do estoque]"
        echo ""
        echo "4 [Alterar valor de um item do estoque]"
        echo ""
        echo "5 [Sair do programa]"
        echo "-----------------------------------------"
        echo -n "Digite o valor da tarefa que deseja realizar: "
        read A1

        #DIRETÓRIO DO ESTOQUE E DOS PRODUTOS
        ES=/home/$USER/estoque
        EP=/home/$USER/estoque/produtos

        #SE O DIRETORIO DO ESTOQUE OU DOS PRODUTOS E DADOS NÃO EXISTIR, COMANDO PARA CRIAR
        if [ ! -d $ES ]; then
                mkdir $ES
        fi

        if [ ! -d $ES/dados ]; then
                mkdir $ES/dados
        fi


        if [ ! -d $EP ]; then
                mkdir $EP
        fi

        #USANDO OS COMANDOS INSERIDOS A CIMA
        case $A1 in

                #VISUALIZAR ESTOQUE
                1)

                        #MOSTRA OS ITENS DO ESTOQUE
                        CAT=`ls $EP`

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
                                escrever_dados
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
                        V=" "

                        #VERIFICAÇÃO SE OS VALORES ESTÃO VAZIOS
                        if [ $P1 == $V ];then
                                clear
                                echo "Sinto muito, mas não pode adicionar um item vazio."
                        else
                                mkdir $EP/$P1
                                clear
                                #VALOR DO PRODUTO
                                echo "-----------------------------------------"
                                echo -n "Digite o valor do produto: R$"
                                read P2
                                touch $EP/$P1/valor.val
                                echo $P2 >> $EP/$P1/valor.val
                                clear

                                #QUANTIDADE DO PRODUTO
                                echo "-----------------------------------------"
                                echo -n "Digite a quantidade do produto: "
                                read P3
                                touch /$EP/$P1/quantidade.qtd
                                echo $P3 >> /$EP/$P1/quantidade.qtd
                                clear
                                echo "Item $P1 adicionado."
                        fi;;

                #RETIRAR ITEM DO ESTOQUE
                3)
                        clear

                        #MOSTRA ITENS DO ESTOQUE
                        escrever_dados

                        #INSERIR NOME DO PRODUTO
                        echo "-----------------------------------------"
                        echo -n "Digite o nome do item que deseja retirar: "
                        read P4
                        V=" "

                        #VERIFICAÇÃO SE OS VALORES ESTÃO VAZIOS
                        if [ $P4 == $V ];then
                                clear
                                echo "Sinto muito, mas não pode remover um valor vazio."
                        else
                                #SE O ITEM EXISTIR OU NÃO
                                if [ -d $EP/$P4 ];then
                                        clear
                                        rm -rf $EP/$P4
                                        echo "-----------------------------------------"
                                        echo "Item $P4 removido do estoque."

                                        else
                                        clear
                                        echo "-----------------------------------------"
                                        echo "Sinto muito, item inexistente"
                                fi
                        fi;;

                #ALTERAR VALOR DE ITEM NO ESTOQUE
                4)
                        clear

                        #SE O ESTOQUE ESTIVER OU NÃO VAZIO
                        if [ $A3 == "" ];then
                                clear
                                echo "-----------------------------------------"
                                echo "Estoque vazio"
                        else
                                clear
                                escrever_dados
                        fi

                        #DIGITAR O NOME DO PRODUTO
                        echo "-----------------------------------------"
                        echo -n "Digite o nome do item que deseja alterar: "
                        read P5
                        V=" "

                        #VERIFICAÇÃO SE OS VALORES ESTÃO VAZIOS
                        if [ $P5 == $V];then
                                clear
                                echo "Sinto muito, não pode alterar um item vazio."
                        else

                                #SE O PRODUTO EXISTIR OU NÃO
                                if [ -d $EP/$P5/ ];then
                                        clear

                                        #NOVO VALOR DO PRODUTO
                                        echo "-----------------------------------------"
                                        echo -n "Digite o novo valor de $P5: "
                                        read P6
                                        echo $P6 > $EP/$P5/valor.val

                                        #NOVA QUANTIDADE DO PRODUTO
                                        echo "-----------------------------------------"
                                        echo -n "Digite a nova quantidade de $P5: "
                                        read P7
                                        echo $P7 > $EP/$P5/quantidade.qtd
                                        clear
                                        echo "Dados de $P5 alterados."

                                else
                                        clear
                                        echo "-----------------------------------------"
                                        echo "Item inexistente."
                                fi
                        fi;;

                #SAIR DO PROGRAMA
                5)
                        break;;

                #OUTROS VALORES
                *)
                        clear
                        echo "-----------------------------------------"
                        echo 'Valor incorreto.'
                        echo "-----------------------------------------";;
        esac
done
