#!/bin/bash

#
# barra_progresso.sh (Shell Script)
#
# Objetivo: Implementar um barra simples em loop.
#
# Site https://github.com/EdMartinezNunes
#
# Versão 1.0
#
# Programador: Eduardo Martinez 14/02/2025
#
# Email: eduardomartineznunes@gmail.com
#
# Licença: GPL-3.0 <https://www.gnu.org/licenses/gpl-3.0.txt

# Comandos utilizados na aula:
#link: https://www.youtube.com/watch?v=HcR5yR5czw8&list=PLLCFxfe9wkl-xaW5cRB0jsOlaxV0NY51w&index=30

# echo -n . -> imprime na mesma linha
# while true
# do
#   echo -n "."
#   sleep 1
# done
#obs: o trap so funciona com o programa em segundo plano.
#trap "echo done" SIGINT -> capta o sinal do sistema e executa o comando.

#Monitorando o find
#find $HOME -name "*.TXT"

#Implementando o Programa

#!/bin/bash

# barra de progresso
while true; do echo -n .; sleep 1; done &
echo "PID do while true $!"

#Monitora os sinais do sistema 
# $! -> armazena o PID do ultimo processo em segundo plano.

trap "kill $!" SIGINT #SIGTERM SIGKILL

#Programa em execução para teste

echo "Running command Aguarde !!!"

#sleep 10 ## primeiro comando testado
#find $HOME -name *.Txt ## segundo comando testado
./loopteste.sh > log.txt ## Executando um script
echo done
echo $! 
kill $! 









