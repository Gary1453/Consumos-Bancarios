#!/bin/bash
#chcp 1252
#reg add "HKLM\System\CurrentControlSet\Control\Session Manager\Environment" /v "NLS_LANG" /t REG_SZ /d "AMERICAN_AMERICA.WE8MSWIN1252" /f
export LANG=AMERICAN_AMERICA.UTF8

ruta="/home/natan/Documentos/Prometeo/Consumos Bancarios/Scripts/Tablas/Cargar Tarjeta/Extraccion"
sqlplus natan/nisekoi @"$ruta.sql" >"$ruta.log"
sqlldr  natan/nisekoi control="'$ruta.ctl'" log ="'$ruta.log'"

ruta="/home/natan/Documentos/Prometeo/Consumos Bancarios/Scripts/Tablas/Cargar Tarjeta/Transformacion"
sqlplus natan/nisekoi @"$ruta.sql" >"$ruta.log"

ruta="/home/natan/Documentos/Prometeo/Consumos Bancarios/Scripts/Tablas/Cargar Tarjeta/Carga"
sqlplus natan/nisekoi @"$ruta.sql" >"$ruta.log"

exit