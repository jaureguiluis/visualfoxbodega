USE cxc_cliente
replace ALL paterno with strtran(paterno,'¥','Ñ')
replace ALL corto with strtran(corto,'¥','Ñ')
replace ALL materno with strtran(materno,'¥','Ñ')
replace ALL nombre with strtran(nombre,'¥','Ñ')
replace ALL calle with strtran(calle,'¥','Ñ')
replace ALL colonia with strtran(colonia,'¥','Ñ')
USE inv_producto
replace ALL nombre with strtran(nombre,'¥','Ñ')

brow