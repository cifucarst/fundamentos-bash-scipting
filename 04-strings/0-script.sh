#!/bin/bash

s1="Hola"
s2="Python"

# Concatenación
echo "$s1, $s2!"

# Repetición
echo "$s1$s1$s1"

# Indexación
echo "${s1:0:1}${s1:1:1}${s1:2:1}${s1:3:1}"

# Longitud
echo "${#s2}"

# Slicing (porción)
echo "${s2:2:4}"
echo "${s2:2}"
echo "${s2:0:2}"
echo "${s2:0:2}"

# Búsqueda
if [[ $s1 == *"a"* ]]; then
    echo "true"
else
    echo "false"
fi

if [[ $s1 == *"i"* ]]; then
    echo "true"
else
    echo "false"
fi

# Reemplazo
echo "${s1/o/a}"

# División
IFS='t' read -ra split_array <<< "$s2"
echo "${split_array[*]}"

# Mayúsculas, minúsculas y letras en mayúsculas
echo "${s1^^}"
echo "${s1,,}"
echo "brais moure" | awk '{for(i=1;i<=NF;i++) $i=toupper(substr($i,1,1)) tolower(substr($i,2));}1'
echo "brais moure" | awk '{for(i=1;i<=NF;i++) $i=toupper(substr($i,1,1)) substr($i,2);}1'

# Eliminación de espacios al principio y al final
echo " brais moure " | xargs

# Búsqueda al principio y al final
if [[ $s1 == "Ho"* ]]; then
    echo "true"
else
    echo "false"
fi

if [[ $s1 == "Py"* ]]; then
    echo "true"
else
    echo "false"
fi

if [[ $s1 == *"la" ]]; then
    echo "true"
else
    echo "false"
fi

if [[ $s1 == *"thon" ]]; then
    echo "true"
else
    echo "false"
fi

s3="Brais Moure @mouredev"

# Búsqueda de posición
echo "${s3/moure*}"
echo "${s3/Moure*}"
echo "${s3/M*}"
echo "${s3,,}" | awk '{print index($0, "m")}'

# Búsqueda de ocurrencias
echo "${s3,,}" | awk '{print gsub(/m/,"")}'

# Formateo
echo "Saludo: $s1, lenguje: $s2!"

# Interpolación
echo "Saludo: ${s1}, lenguje: ${s2}!"

# Tranformación en lista de caracteres
echo $(echo "$s3" | sed 's/./& /g')

# Transformación de lista en cadena
l1=("$s1" ", " "$s2" "!")
echo "${l1[@]}"

# Transformaciones numéricas
s4="123456"
s4=$((10#$s4))
echo "$s4"

s5="123456.123"
echo "$s5" | awk '{printf "%f\n", $0}'

# Comprobaciones varias
s4="123456"
if [[ "$s1" =~ ^[[:alnum:]]+$ ]]; then
    echo "true"
else
    echo "false"
fi

if [[ "$s1" =~ ^[[:alpha:]]+$ ]]; then
    echo "true"
else
    echo "false"
fi

if [[ "$s4" =~ ^[[:alpha:]]+$ ]]; then
    echo "true"
else
    echo "false"
fi

if [[ "$s4" =~ ^[[:digit:]]+$ ]]; then
    echo "true"
else
    echo "false"
fi