#!/bin/bash
#chcp 1252
#reg add "HKLM\System\CurrentControlSet\Control\Session Manager\Environment" /v "NLS_LANG" /t REG_SZ /d "AMERICAN_AMERICA.WE8MSWIN1252" /f
export LANG=AMERICAN_AMERICA.UTF8

echo "Cargar Tabla Condicion"
ruta="/home/natan/Documentos/Prometeo/Consumos Bancarios/Scripts/Tablas/Cargar Condicion/ETL"
"$ruta.sh"

echo "Cargar Tabla Tarjetas"
ruta="/home/natan/Documentos/Prometeo/Consumos Bancarios/Scripts/Tablas/Cargar Tarjeta/ETL"
"$ruta.sh"

echo "Cargar Tabla Consumos"
ruta="/home/natan/Documentos/Prometeo/Consumos Bancarios/Scripts/Tablas/Cargar Consumos/ETL"
"$ruta.sh"

echo "Cargar Tabla Cliente"
ruta="/home/natan/Documentos/Prometeo/Consumos Bancarios/Scripts/Tablas/Cargar Cliente/ETL"
"$ruta.sh"
