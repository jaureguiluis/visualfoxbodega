   �   @                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              �DRIVER=winspool
DEVICE=Adobe PDF
OUTPUT=Mis documentos\*.pdf
ORIENTATION=1
PAPERSIZE=1
SCALE=100
ASCII=0
COPIES=1
DEFAULTSOURCE=1
PRINTQUALITY=600
COLOR=2
YRESOLUTION=600
TTOPTION=1
COLLATE=0
                                                C    winspool  Adobe PDF  Mis documentos\*.pdf                                                                            PAdobe PDF                        � �S�  �
od   X  X   Letter                                                                            PRIV�                                                                                        '''  '        � �                               0 \K hC                             FF��      � �                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       �   SMTJ     � A d o b e   P D F   C o n v e r t e r   Resolution 1200dpi PageSize Letter PageRegion  LeadingEdge  InputSlot OnlyOne                                           0  EBDA                   S t a n d a r d                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              Courier New                                                   	documento                                                     "999999"                                                      Arial                                                         fecha                                                         Arial                                                         valor                                                         "@Z 99,999,999.99"                                            Arial                                                         valor                                                         "@Z 999,999,999.99"                                           Arial                                                         cxc_cliente.corto                                             Arial                                                         !"P�gina " + ALLTRIM(STR(_PAGENO))                             Arial                                                         "RELACION DE EXPORTACION:"                                    Arial                                                         
DATETIME()                                                                                                                  Arial                                                         "SISTEMA DE CLIENTES"                                         Arial                                                         	conse.cia                                                     Arial                                                         "Total"                                                       Arial                                                         �"DEL  "+STR(DAY(xfechai),2)+" "+CMONTH(XFECHAI)+' '+STR( YEAR(XFECHAI),4)+"  AL  "+STR(DAY(xfechaF),2)+" "+ CMONTH(XFECHAF)+' '+STR( YEAR(XFECHAF),4)                                                                                                       Arial                                                         "Valor"                                                       Arial                                                         	"Cliente"                                                     Arial                                                         "Fecha"                                                       Arial                                                         "Documento"                                                   Arial                                                         	documento                                                     	"999,999"                                                     Arial                                                         xusuario                                                      Arial                                                         
"T.Cambio"                                                    Courier New                                                   tipoc                                                         tipoc                                                         "99.99"                                                       Courier New                                                   *"Operador       Placas    Caja    Agencia"                    Courier New                                                   operador                                                      observ                                                        Courier New                                                   "Movimiento"                                                  Courier New                                                   
movimiento                                                    p_cxc_juntar.movimiento                                       Courier New                                                   Courier New                                                   Arial                                                         Arial                                                         Arial                                                         Arial                                                         Arial                                                         Arial                                                         Arial                                                         Arial                                                         Arial                                                         dataenvironment                                               aTop = 332
Left = 200
Width = 520
Height = 334
DataSource = .NULL.
Name = "Dataenvironment"
                             cursor                                                        yTop = 20
Left = 10
Height = 90
Width = 91
Alias = "p_cxc_juntar"
CursorSource = p_cxc_juntar.dbf
Name = "Cursor1"
                                                                     cursor                                                        �Top = 20
Left = 150
Height = 211
Width = 91
Alias = "cxc_cliente"
Database = ccbasedatos.dbc
CursorSource = "cxc_cliente"
Name = "Cursor2"
                                           cursor                                                        lTop = 20
Left = 290
Height = 90
Width = 91
Alias = "conse"
CursorSource = conse.dbf
Name = "Cursor3"
                  relation                                                      �ParentAlias = "p_cxc_juntar"
RelationalExpr = "cliente"
ChildAlias = "cxc_cliente"
ChildOrder = "cliente"
Name = "Relation1"
                                                      