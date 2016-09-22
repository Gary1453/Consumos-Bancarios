#!/bin/bash
#chcp 1252
#reg add "HKLM\System\CurrentControlSet\Control\Session Manager\Environment" /v "NLS_LANG" /t REG_SZ /d "AMERICAN_AMERICA.WE8MSWIN1252" /f
export LANG=AMERICAN_AMERICA.UTF8
export LANGUAGE=AMERICAN_AMERICA

ruta="/home/natan/Documentos/Prometeo/Consumos Bancarios/Scripts/Tablas/Cargar Consumos/Extraccion"
sqlplus natan/nisekoi @"$ruta.sql" >"$ruta.log"
sqlldr  natan/nisekoi control="'$ruta.ctl'" log ="'$ruta.log'"

ruta="/home/natan/Documentos/Prometeo/Consumos Bancarios/Scripts/Tablas/Cargar Consumos/Transformacion"
sqlplus natan/nisekoi @"$ruta.sql" >"$ruta.log"

ruta="/home/natan/Documentos/Prometeo/Consumos Bancarios/Scripts/Tablas/Cargar Consumos/Carga"
sqlplus natan/nisekoi @"$ruta.sql" >"$ruta.log"

exit