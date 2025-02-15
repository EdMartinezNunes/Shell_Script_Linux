#!/bin/bash

# template padrão para criação de cabeçalhos padronizados nos programas


Gera_Cabeçalho(){
	
	LANGUAGE="$1"
	PRIMEIRA_LINHA="$2"
	echo "$PRIMEIRA_LINHA"  > "$TMP"
	echo "$HEADER" | sed "s/LANGUAGE/$LANGUAGE/"  >> "$TMP"
        if [ -f "$NOMEDOPROGRAMA" ]
        then
            cat "$NOMEDOPROGRAMA" >> "$TMP"
            cp "$TMP" "$NOMEDOPROGRAMA"
        else
            cp "$TMP" "$NOMEDOPROGRAMA"
        fi
        rm "$TMP"


}


[ -z "$1" ] && echo "Ofereça uma opção qualquer, use -h para obter ajuda" && exit 1

NOMEDOPROGRAMA="$2"
TMP="/tmp/_000tmp.txt"
DATA=`date +%d/%m/%Y` #ou DATA=$(date +%d/%m/%Y)
OBJETIVO="$4"
[ -f "$NOMEDOPROGRAMA" ] && touch "$TMP"

[ -n "$3" ] && [ "$3" == "-m" ] && OBJETIVO="$4" 

NOME_HELP="\033[00;01mNOME\033[m\n\t$(basename $0)\n"

DESCRICAO_HELP="\033[00;01mDESCRIÇÃO\033[m\n\tGera o cabeçalho para um arquivo de programa de uma determinada linguagem de programação com objetivo, nome do programa etc.\n"

PARA_HELP="\033[00;01mPARAMETROS\033[m\n
\t-h -help Exibe essa tela de ajuda e sai.
\t-v --version Exibe a versão do Programa e sai.
\t-sh Cabeçalho para um programa em shell script.
\t-py Cabeçalho para um programa em python.\n"



EXEM_HELP="\033[00;01mEXEMPLO DE USO\033[m\n
\t~$ ./cabeçalho_linha_comando -sh nome.sh # Cabeçalho para Arquivo.sh
\t~$ ./cabeçalho-gui (Interface Gráfica)
\t~$ ./cabeçalho_linha_comando -sh -m Objetivo: -> 'mensagem' # Adiciona o Objetivo ao cabeçalho.\n"

HELP="$NOME_HELP\n$DESCRICAO_HELP\n$PARAHELP\n$EXEM_HELP"
VERSION="Versão 1.0"
HEADER="
#
# ${NOMEDOPROGRAMA:="TEMPLATE"} (LANGUAGE)
#
# Objetivo: ${OBJETIVO:="Nosso primeiro projeto."}
#
# Site https://eduardo.github.io
#
# Versão 1.0
#
# Programador: Eduardo Martinez $DATA
#
# Email: eduardomartineznunes@gmail.com
#
# Licença: GPL-3.0 <https://www.gnu.org/licenses/gpl-3.0.txt
"
case $1 in 
	-h | --help) ## Exibe ajuda do programa
       		echo -e "$HELP"
		exit 0
	;;
	-v | --version) ## Exibe a versão do programa
		echo "$VERSION"
		exit 0
	;;
	-sh) ## Gera cabeçalho em Shell Script
		LANGUAGE="Shell Script"
		PRIMEIRA_LINHA="#!/bin/bash" 
		Gera_Cabeçalho "$LANGUAGE" "$PRIMEIRA_LINHA"
		exit 0
	
	;;
	-py) ## Gera cabeçalho em python
		LANGUAGE="Python"
		PRIMEIRA_LINHA="#!/usr/bin/env python"
		Gera_Cabeçalho "$LANGUAGE" "$PRIMEIRA_LINHA"
		exit 0
	;;
	*)## Erro de opção desconhecida
		echo "Erro: opção $1 desconhecida!"
		exit 2
esac


