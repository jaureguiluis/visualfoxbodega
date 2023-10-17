set excl on
open database ccbasedatos excl
validate database

SET TABLEVALIDATE TO 0
use ccagente
append blank 



use ccagente
pack
index on numero tag numero of ccagente
use cccliente
pack
index on cliente tag cliente of cccliente
index on nombre tag nombre of cccliente

open database ccbasedatos
validate database
close table all

open database ipbasedatos excl
validate database


use ipentrada
pack
*index on articulo+STR(folio) tag articulo of ipentrada
index on folio tag folio of ipentrada
use ipsalida
pack
*index on articulo+STR(folio) tag articulo of ipsalida
index on folio tag folio of ipsalida
use ipclave
pack
index on numero tag numero of ipclave
use ipgrupo
pack
index on numero tag numero of ipgrupo
use ipmaestro
pack
index on articulo tag articulo of ipmaestro
index on nombre tag nombre of ipmaestro
index on grupo tag grupo of ipmaestro

open database ipbasedatos excl
validate database
close table all

set excl off
