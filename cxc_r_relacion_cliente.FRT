   �   @                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              �DRIVER=winspool
DEVICE=Lexmark E120
OUTPUT=USB001
ORIENTATION=0
PAPERSIZE=1
COPIES=1
DEFAULTSOURCE=1
PRINTQUALITY=600
DUPLEX=1
YRESOLUTION=600
TTOPTION=1
COLLATE=0
              8     winspool  Lexmark E120  USB001                       �Lexmark E120                     � �           X  X                                                                                       ⤗� �       Lexmark E120                    Lexmark E120                     6  Lexmark E120  R 2                 ��       	                     	     	C�( s�    * , " ? 0   A >  ⤗�   �  X        X           �                                                                                                                                                                                                  
   
   
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   �r                        ⤗�                      Courier New                                                   cliente                                                       	documento                                                     "999999"                                                                                                                    Courier New                                                   fecha_c                                                       relation                                                      Courier New                                                   refer                                                         "@Z 999999"                                                                                                                 Courier New                                                   
movimiento                                                    Courier New                                                   cargo                                                         "@Z 999,999,999.99"                                                                                                         Courier New                                                   credito                                                       "@Z 999,999,999.99"                                                                                                         Courier New                                                   "Documento"                                                   "@I"                                                          Arial                                                         "Aplica"                                                      "@I"                                                          Arial                                                         "Clave"                                                       "@I"                                                          Arial                                                         !"P�gina " + ALLTRIM(STR(_PAGENO))                             Arial                                                         "RELACION CLIENTE:"                                           Arial                                                         
DATETIME()                                                                                                                  Arial                                                         "SISTEMA DE CLIENTES"                                         Arial                                                         	conse.cia                                                     Arial                                                         	"Credito"                                                     "@I"                                                          Arial                                                         "Cargo"                                                       "@I"                                                          Arial                                                         "Fecha"                                                       "@I"                                                          Arial                                                         cargo                                                         "@Z 999,999,999.99"                                                                                                         Courier New                                                   credito                                                       "@Z 999,999,999.99"                                                                                                         Courier New                                                   cargo+ credito                                                "@Z 999,999,999.99"                                           Courier New                                                   "Total"                                                       "@I"                                                          Arial                                                         �"DEL  "+STR(DAY(xfechai),2)+" "+CMONTH(XFECHAI)+' '+STR( YEAR(XFECHAI),4)+"  AL  "+STR(DAY(xfechaF),2)+" "+ CMONTH(XFECHAF)+' '+STR( YEAR(XFECHAF),4)                                                                                                       Arial                                                         xusuario                                                      Arial                                                         "alltrim(observ)+" "+alltrim(banco)                                                                                          Courier New                                                   cxc_cliente.corto                                             Courier New                                                   p_cxc_juntar.cliente                                          Courier New                                                   cargo                                                         "@Z 999,999,999.99"                                                                                                         Courier New                                                   credito                                                       "@Z 999,999,999.99"                                                                                                         Courier New                                                   "Total"                                                       "@I"                                                          Arial                                                         xletrero                                                                                                                    Courier New                                                   	documento                                                     	"999,999"                                                                                                                   Courier New                                                   	documento                                                     	"999,999"                                                                                                                   Courier New                                                   cargo                                                         iif(clave<50,valor,0)                                         0                                                             credito                                                       iif(clave>50,valor,0)                                         0                                                             Courier New                                                   Arial                                                         Arial                                                         Arial                                                         Arial                                                         Arial                                                         Arial                                                         Courier New                                                   Arial                                                         dataenvironment                                               `Top = 311
Left = 27
Width = 520
Height = 326
DataSource = .NULL.
Name = "Dataenvironment"
                              cursor                                                        xTop = 1
Left = 14
Height = 90
Width = 91
Alias = "p_cxc_juntar"
CursorSource = p_cxc_juntar.dbf
Name = "Cursor1"
      cursor                                                        �Top = 121
Left = 139
Height = 90
Width = 91
Alias = "cxc_cliente"
Database = ccbasedatos.dbc
CursorSource = "cxc_cliente"
Name = "Cursor2"
                                           cursor                                                        �Top = 5
Left = 140
Height = 90
Width = 91
Alias = "cxc_clave"
Database = ccbasedatos.dbc
CursorSource = "cxc_clave"
Name = "Cursor3"
                                                 cursor                                                        lTop = 19
Left = 290
Height = 90
Width = 91
Alias = "conse"
CursorSource = conse.dbf
Name = "Cursor4"
                  relation                                                      �ParentAlias = "p_cxc_juntar"
RelationalExpr = "cliente"
ChildAlias = "cxc_cliente"
ChildOrder = "cliente"
Name = "Relation1"
                                                            |ParentAlias = "p_cxc_juntar"
RelationalExpr = "clave"
ChildAlias = "cxc_clave"
ChildOrder = "clave"
Name = "Relation2"
                                                            