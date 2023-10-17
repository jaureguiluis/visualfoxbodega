SELECT 0
USE inv_entrada_producto
SET FILTER TO AT('COLOR# 1',observ)>0  AND color = '          '
replace ALL color WITH 'Color 1'

SET FILTER TO AT('COLOR# 2',observ)>0  AND color = '          '
replace ALL color WITH 'Color 2'

SET FILTER TO AT('COLOR# 3',observ)>0  AND color = '          '
replace ALL color WITH 'Color 3'

SET FILTER TO AT('COLOR# 4',observ)>0  AND color = '          '
replace ALL color WITH 'Color 4'

SET FILTER TO AT('COLOR# 5',observ)>0  AND color = '          '
replace ALL color WITH 'Color 5'

SET FILTER TO AT('COLOR3 1',observ)>0  AND color = '          '
replace ALL color WITH 'Color 1'

SET FILTER TO AT('COLOR3 2',observ)>0  AND color = '          '
replace ALL color WITH 'Color 2'

SET FILTER TO AT('COLOR3 3',observ)>0  AND color = '          '
replace ALL color WITH 'Color 3'

SET FILTER TO AT('COLOR3 4',observ)>0  AND color = '          '
replace ALL color WITH 'Color 4'

SET FILTER TO AT('COLOR3 5',observ)>0  AND color = '          '
replace ALL color WITH 'Color 5'

SET FILTER TO AT('COLOR31',observ)>0  AND color = '          '
replace ALL color WITH 'Color 1'

SET FILTER TO AT('COLOR32',observ)>0  AND color = '          '
replace ALL color WITH 'Color 2'

SET FILTER TO AT('COLOR33',observ)>0  AND color = '          '
replace ALL color WITH 'Color 3'

SET FILTER TO AT('COLOR34',observ)>0  AND color = '          '
replace ALL color WITH 'Color 4'

SET FILTER TO AT('COLOR35',observ)>0  AND color = '          '
replace ALL color WITH 'Color 5'

SET FILTER TO AT('COLOR1',observ)>0  AND color = '          '
replace ALL color WITH 'Color 1'

SET FILTER TO AT('COLOR2',observ)>0  AND color = '          '
replace ALL color WITH 'Color 2'

*SET FILTER TO AT('COLOR33',observ)>0  AND color = '          '
*replace ALL color WITH 'Color 3'

SET FILTER TO AT('COLOR4',observ)>0  AND color = '          '
replace ALL color WITH 'Color 4'

SET FILTER TO AT('COLOR5',observ)>0  AND color = '          '
replace ALL color WITH 'Color 5'

SET FILTER TO AT('COLOR#1',observ)>0  AND color = '          '
replace ALL color WITH 'Color 1'

SET FILTER TO AT('COLOR#2',observ)>0  AND color = '          '
replace ALL color WITH 'Color 2'

SET FILTER TO AT('COLOR#3',observ)>0  AND color = '          '
replace ALL color WITH 'Color 3'

SET FILTER TO AT('COLOR#4',observ)>0  AND color = '          '
replace ALL color WITH 'Color 4'

SET FILTER TO AT('COLOR#5',observ)>0  AND color = '          '
replace ALL color WITH 'Color 5'

SET FILTER TO AT('C-1',observ)>0   AND color = '          '
replace ALL color WITH 'Color 1'

SET FILTER TO AT('C-2',observ)>0  AND color = '          '
replace ALL color WITH 'Color 2'

SET FILTER TO AT('C-3',observ)>0  AND color = '          '
replace ALL color WITH 'Color 3'

SET FILTER TO AT('C-4',observ)>0  AND color = '          '
replace ALL color WITH 'Color 4'

SET FILTER TO AT('C-5',observ)>0  AND color = '          '
replace ALL color WITH 'Color 5'


SET FILTER TO AT('COLOR 1',observ)>0  AND color = '          '
replace ALL color WITH 'Color 1'

SET FILTER TO AT('COLOR 2',observ)>0  AND color = '          '
replace ALL color WITH 'Color 2'

SET FILTER TO AT('COLOR 3',observ)>0  AND color = '          '
replace ALL color WITH 'Color 3'

SET FILTER TO AT('COLOR 4',observ)>0  AND color = '          '
replace ALL color WITH 'Color 4'

SET FILTER TO AT('COLOR 5',observ)>0  AND color = '          '
replace ALL color WITH 'Color 5'


SET FILTER TO AT('COLOR R',observ)>0  AND color = '          '
replace ALL color WITH 'Rojo'

*SET FILTER TO AT('COLOR R',observ)>0
*replace ALL color WITH 'Rojo'



SET FILTER TO AT('XXL',observ)>0 AND tamano = '          '
replace ALL tamano WITH 'XXL'

SET FILTER TO AT('XL',observ)>0 AND tamano = '          '
replace ALL tamano WITH 'XL'

SET FILTER TO AT('LG',observ)>0 AND tamano = '          '
replace ALL tamano WITH 'LG'

SET FILTER TO AT('MD',observ)>0 AND tamano = '          '
replace ALL tamano WITH 'MD'

SET FILTER TO AT('SM',observ)>0 AND tamano = '          '
replace ALL tamano WITH 'SM'

SET FILTER TO AT('PRAZA',producto)>0 AND etiqueta = '          '
replace ALL etiqueta WITH 'Raza'

SET FILTER TO AT('PALV',producto)>0 AND etiqueta = '          '
replace ALL etiqueta WITH 'Vegas'

SET FILTER TO AT('PYRJO',producto)>0 AND etiqueta = '          '
replace ALL etiqueta WITH 'Yeyos'

SET FILTER TO 
replace ALL producto with strtran(producto,'2¦','2da')
replace ALL tamano with strtran(tamano,'2¦','2da')

SELECT inv_entrada_producto
USE

SELECT 0
USE inv_salida_producto
replace ALL producto with strtran(producto,'2¦','2da')
replace ALL tamano with strtran(tamano,'2¦','2da')
replace ALL producto with strtran(producto,'3¦','3ra')
replace ALL tamano with strtran(tamano,'3¦','3ra')
USE

