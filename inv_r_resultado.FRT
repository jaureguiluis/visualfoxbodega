   �   !                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              Arial                          8     winspool  Lexmark E120  USB001                         �Lexmark E120                     � �           X  X                                                                                      ⤗� �       Lexmark E120                    Lexmark E120                     6  Lexmark E120  R 2                 ��       	                     	     	C�( s�    * , " ? 0   A >  ⤗�   �  X        X           �                                                                                                                                                                                                  
   
   
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   �r                        ⤗�                           �DRIVER=winspool
DEVICE=Lexmark E120
OUTPUT=USB001
ORIENTATION=0
PAPERSIZE=1
COPIES=1
DEFAULTSOURCE=7
PRINTQUALITY=600
DUPLEX=1
YRESOLUTION=600
TTOPTION=2
COLLATE=1
                    DATE()                         Arial                          "@I"                           Arial                          "Analisis de Producto"         "@I"                           Arial                          	"Factura"                      FACTURA                        Arial                          "9,999,999,999"                "@I"                           Arial                          "Movimiento"                   
MOVIMIENTO                     Arial                          "@I"                           Arial                          
"Cantidad"                     CANTIDAD                       Arial                          "999,999,999.999"              "@I"                           Arial                          "Precio"                       PRECIO                         Arial                          "9,999,999.99999"              "@I"                           Arial                          "Bultos"                       BULTOS                         Arial                          "999,999,999.999"              "@I"                           Arial                          	"Fecha C"                      FECHA_C                        Arial                          "@I"                           Arial                          "Observ"                       OBSERV                         Arial                          "@I"                           Arial                          "Valor"                        VALOR                          Arial                          "9,999,999,999.99"             "@I"                           Arial                          "Grupo"                        GRUPO                          Arial                          !"P�gina " + ALLTRIM(STR(_PAGENO))                               Arial                          Arial                          Arial                          Arial                          Arial                          dataenvironment                JLeft = 1
Top = 220
Width = 520
Height = 200
Name = "Dataenvironment"
                       cursor                         yLeft = 10
Top = 20
Width = 91
Height = 90
Alias = "p_inv_juntar"
CursorSource = p_inv_juntar.dbf
Name = "Cursor1"
         cursor                         lLeft = 150
Top = 20
Width = 91
Height = 90
Alias = "conse"
CursorSource = conse.dbf
Name = "Cursor2"
                