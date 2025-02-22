#!/bin/bash

#
# contador.sh (Shell Script)
#
# Objetivo: Auxiliador que passa os valores para barra-gui
#
# Site https://github.com/EdMartinezNunes
#
# Versão 1.0
#
# Programador: Eduardo Martinez 19/02/2025
#
# Email: eduardomartineznunes@gmail.com
#
# Licença: GPL-3.0 <https://www.gnu.org/licenses/gpl-3.0.txt

#!/bin/bash


# teste no shell

# dialog --title "Exemplo" --gauge "Barra de Progresso" 8 40
# (echo 10;sleep 1; echo 20;sleep 1; echo 30) | !dialog
# !dialog -> executa no shell último comando executado.
# (....) -> executa no sub-shell.


for i in $(seq 0 10 100)
do 
	echo "$i"
	sleep 1
done






