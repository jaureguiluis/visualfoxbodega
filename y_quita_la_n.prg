USE cxc_cliente
replace ALL paterno with strtran(paterno,'�','�')
replace ALL corto with strtran(corto,'�','�')
replace ALL materno with strtran(materno,'�','�')
replace ALL nombre with strtran(nombre,'�','�')
replace ALL calle with strtran(calle,'�','�')
replace ALL colonia with strtran(colonia,'�','�')
USE inv_producto
replace ALL nombre with strtran(nombre,'�','�')

brow