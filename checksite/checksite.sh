#!/bin/bash

# necessario para o notify-send
export DISPLAY=:0

# url de verificacao
# exemplo:
site="http://www.internacional.ufpr.br/"

# arquivos gerados
file="index.html"
tmp_file="index.html.temp"

# cria um arquivo em branco caso nao exista
touch $file

# verifica o site
curl -s $site > $tmp_file

# compara com a ultima requisicao
if ! cmp -s $file $tmp_file ;then
        notify-send "Nova atualização" "Há uma nova atualização em $site."
        mv $tmp_file $file
else
        rm $tmp_file
fi