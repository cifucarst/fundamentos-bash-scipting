#!/bin/bash

# URL del sitio web oficial de Bash: https://www.gnu.org/software/bash/
# https://www.gnu.org/software/bash/manual/bash.html


# COMENTARIOS

# Esto es un comentario de una linea.

: '
  Este es un comentario 
  de varias lineas
'

<<Document
Otra manera de tener comentarios multilínea es con lo que se denominan
HereDocuments, que básicamente son una manera de decirle a bash que lo que está
entre el comienzo del documento, que se declara con "<<" y un nombre, y el cierre,
que se declara con el nombre del documento solo en una línea, se procesa como una
sola unidad
Document


# VARIABLES

variable=0                          # variable
readonly constant="Mi constante"    # constante
# otra forma de formar constantes
declare -r CONSTANTE=100            #constante

function my_function {
  local variable_local=0            # variable local
}

# TIPOS DE DATOS

variable="String"                   # String
variable=1                          # Int
variable=("rojo" "verde" "azul")    # Array
variable=true                       # Boolean

declare -A dictionary
dictionary[valor]='valor1'          # diccionario

# Hola mundo
echo "Hola, Bash!"                  # echo sirve para imprimir en la terminal

# Para llamar a una variable se usa el simbolo $[nombre de la variable]
saludar="Hola Bash"
echo $saludar                      