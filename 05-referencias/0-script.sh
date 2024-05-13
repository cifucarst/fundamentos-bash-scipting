#!/bin/bash

# Tipos de dato por valor

my_int_a=10               # Asigna el valor entero 10 a la variable my_int_a
my_int_b=$my_int_a        # Copia el valor de my_int_a en my_int_b
my_int_b=20               # Sobrescribe el valor de my_int_b con 20
# my_int_a=30             # Este comentario indica que se puede cambiar el valor de my_int_a
echo $my_int_a            # Imprime el valor actual de my_int_a
echo $my_int_b            # Imprime el valor actual de my_int_b

# Tipos de dato por referencia

my_list_a=(10 20)         # Crea una lista con elementos 10 y 20 y la asigna a my_list_a
my_list_b=("${my_list_a[@]}")  # Copia los elementos de my_list_a en my_list_b
my_list_b+=("30")         # Añade el elemento 30 a my_list_b
echo "${my_list_a[@]}"    # Imprime los elementos actuales de my_list_a
echo "${my_list_b[@]}"    # Imprime los elementos actuales de my_list_b

# Funciones con datos por valor

my_int_func() {
    local my_int=$1        # Declara una variable local my_int y le asigna el valor del primer parámetro
    my_int=20              # Sobrescribe el valor de my_int con 20
    echo $my_int           # Imprime el valor de my_int
}

my_int_c=10                # Asigna el valor entero 10 a my_int_c
my_int_func $my_int_c      # Llama a la función my_int_func con my_int_c como argumento
echo $my_int_c             # Imprime el valor actual de my_int_c

# Funciones con datos por referencia

my_list_func() {
    local -n my_list=$1    # Declara una referencia local a la lista pasada como primer parámetro
    my_list+=("30")        # Añade el elemento 30 a la lista referenciada por my_list
    local -n my_list_d=my_list  # Crea otra referencia a la misma lista
    my_list_d+=("40")      # Añade el elemento 40 a la lista referenciada por my_list_d
    echo "${my_list[@]}"   # Imprime los elementos actuales de la lista referenciada por my_list
    echo "${my_list_d[@]}" # Imprime los elementos actuales de la lista referenciada por my_list_d
}

my_list_c=(10 20)          # Crea una lista con elementos 10 y 20 y la asigna a my_list_c
my_list_func my_list_c     # Llama a la función my_list_func con my_list_c como argumento
echo "${my_list_c[@]}"     # Imprime los elementos actuales de my_list_c

# Por valor

value() {
    local value_a=$1       # Declara una variable local value_a y le asigna el valor del primer parámetro
    local value_b=$2       # Declara una variable local value_b y le asigna el valor del segundo parámetro
    local temp=$value_a    # Asigna el valor de value_a a una variable temporal temp
    value_a=$value_b       # Sobrescribe el valor de value_a con el valor de value_b
    value_b=$temp          # Sobrescribe el valor de value_b con el valor de temp (anterior value_a)
    echo "$value_a $value_b"  # Imprime los valores intercambiados de value_a y value_b
}

my_int_d=10                # Asigna el valor entero 10 a my_int_d
my_int_e=20                # Asigna el valor entero 20 a my_int_e
read my_int_f my_int_g <<< $(value $my_int_d $my_int_e)  # Llama a la función value y lee los resultados en my_int_f y my_int_g
echo "$my_int_d, $my_int_e"  # Imprime los valores actuales de my_int_d y my_int_e
echo "$my_int_f, $my_int_g"  # Imprime los valores intercambiados de my_int_d y my_int_e

# Por referencia

ref() {
    local -n value_a=$1    # Declara una referencia local a la lista pasada como primer parámetro
    local -n value_b=$2    # Declara una referencia local a la lista pasada como segundo parámetro
    local temp=$value_a    # Asigna el valor de value_a a una variable temporal temp
    value_a=$value_b       # Sobrescribe el valor de value_a con el valor de value_b
    value_b=$temp          # Sobrescribe el valor de value_b con el valor de temp (anterior value_a)
    echo "${value_a[@]} ${value_b[@]}"  # Imprime los elementos de las listas referenciadas
}

my_list_e=(10 20)          # Crea una lista con elementos 10 y 20 y la asigna a my_list_e
my_list_f=(30 40)          # Crea una lista con elementos 30 y 40 y la asigna a my_list_f
read my_list_g my_list_h <<< $(ref my_list_e my_list_f)  # Llama a la función ref y lee los resultados en my_list_g y my_list_h
echo "${my_list_e[@]}, ${my_list_f[@]}"  # Imprime los elementos actuales de my_list_e y my_list_f
echo "${my_list_g[@]}, ${my_list_h[@]}"  # Imprime los elementos intercambiados de my_list_e y my_list_f