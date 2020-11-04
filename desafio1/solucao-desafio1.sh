#!/bin/bash 

# Descompacta o arquivo (--strip-components 2 -> Usado para não criar a estrutura)
tar xf desafio.tar --strip-components 2

# Filtro dos arquivos do diretório, apenas trará arquivos que inicie com numeros e o final seja .txt
result=$(grep -il '[a|b|c]' [0-9]*.txt)

# Contador
count=0 

# Inicio um for para trazer cada resultado encontrado no filtro
for var in $result 
do 

# Saida do nome do arquivo que contem uma das letras 
echo $var 

# Linhas de separação
echo '----------'

# Saida do contador
echo $count

# Substituição de minusculo para maiusculo
sed -n 2p $var | tr [a-z] [A-Z]

# Saida para fins de exibição
echo ''
echo ''

# Adiciono ao contador para a proxima verificacao
count=$((count + 1))
done

