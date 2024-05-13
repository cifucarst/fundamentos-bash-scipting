#!/bin/bash

# Listas (simulado con arrays)
my_list=("Brais" "Bl4ck" "Wolfy" "Visionos")
echo "${my_list[@]}"
my_list+=("Castor")  # Inserción
my_list+=("Castor")
echo "${my_list[@]}"
my_list=("${my_list[@]/Brais}")  # Eliminación
echo "${my_list[@]}"
echo "${my_list[1]}"  # Acceso
my_list[1]="Cuervillo"  # Actualización
echo "${my_list[@]}"
IFS=$'\n' sorted=($(sort <<<"${my_list[*]}"))  # Ordenación
unset IFS
echo "${sorted[@]}"
echo "array"


# array asociativos
declare -A my_dict
my_dict[name]="Brais"
my_dict[surname]="Moure"
my_dict[alias]="@mouredev"
my_dict[age]="36"
my_dict[email]="mouredev@gmail.com"  # Inserción
unset my_dict[surname]  # Eliminación
echo "${my_dict[name]}"  # Acceso
my_dict[age]="37"  # Actualización
for key in "${!my_dict[@]}"; do
    echo "$key: ${my_dict[$key]}"
done | sort -t : -k 1
echo "associative_array"

# Función para la agenda
my_agenda() {
    declare -A agenda

    insert_contact() {
        read -p "Introduce el teléfono del contacto: " phone
        if [[ $phone =~ ^[0-9]+$ && ${#phone} -gt 0 && ${#phone} -le 11 ]]; then
            agenda[$name]=$phone
        else
            echo "Debes introducir un número de teléfono con un máximo de 11 dígitos."
        fi
    }

    while true; do
        echo ""
        echo "1. Buscar contacto"
        echo "2. Insertar contacto"
        echo "3. Actualizar contacto"
        echo "4. Eliminar contacto"
        echo "5. Salir"

        read -p "Selecciona una opción: " option

        case $option in
            1)
                read -p "Introduce el nombre del contacto a buscar: " name
                if [[ -v agenda[$name] ]]; then
                    echo "El número de teléfono de $name es ${agenda[$name]}."
                else
                    echo "El contacto $name no existe."
                fi
                ;;
            2)
                read -p "Introduce el nombre del contacto: " name
                insert_contact
                ;;
            3)
                read -p "Introduce el nombre del contacto a actualizar: " name
                if [[ -v agenda[$name] ]]; then
                    insert_contact
                else
                    echo "El contacto $name no existe."
                fi
                ;;
            4)
                read -p "Introduce el nombre del contacto a eliminar: " name
                if [[ -v agenda[$name] ]]; then
                    unset "agenda[$name]"
                else
                    echo "El contacto $name no existe."
                fi
                ;;
            5)
                echo "Saliendo de la agenda."
                break
                ;;
            *)
                echo "Opción no válida. Elige una opción del 1 al 5."
                ;;
        esac
    done
}

my_agenda
