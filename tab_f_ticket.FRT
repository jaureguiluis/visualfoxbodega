   �   @                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              �DRIVER=winspool
DEVICE=TABLERO
OUTPUT=USB001
ORIENTATION=0
PAPERLENGTH=4466
PAPERWIDTH=722
ASCII=0
COPIES=1
DEFAULTSOURCE=15
PRINTQUALITY=135
COLOR=1
YRESOLUTION=135
TTOPTION=2
COLLATE=0
                                                     �<VFPData><reportdata name="" type="R" script="" execute="" execwhen="" class="" classlib="" declass="" declasslib=""/></VFPData>
                                                            L    winspool  TABLERO  USB001                   USB001                                                                   \TABLERO AJA\Samsung M2020 Seri   � 4M� r�d   �   �     etter                                                       ����                DINU" � 4  �2�                            	                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            �   SMTJ     � G P - 5 8 1 2 0 ( 1 3 5 d p i )   InputBin Option1 RESDLL UniresDLL Orientation PORTRAIT Resolution Option1 PaperSize Option2 MediaType Option1 PrintQuality Option1 OutputBin Option1 Halftone HT_PATSIZE_AUTO                         e LETTER PagesPerSheet 1 PageOrder FrontToBack PageBorder OFF ColorMode Grayscale                                  V4DM                                                     Arial                                                         
ORD_99.DBF                                                    Ord_99                                                        
ORD_98.DBF                                                    Ord_98                                                        TIME()                                                        "99:99"                                                       Device Font 10cpi                                             cantidad                                                      .iif(int(cantidad)=cantidad,nodecimal,cantidad)                "@BZ 999,999"                                                 Arial                                                         bultos                                                        iif(bultos<>0,bultos,' ')                                     	"@Z 9999"                                                     Arial                                                         precio                                                        precio                                                        "@Z 999.99"                                                   Arial                                                         valor                                                         cantidad*precio                                               "@Z 999999.99"                                                Arial                                                         xfac                                                          "@L 999999"                                                   Device Font 10cpi                                             rfc                                                           xfecha                                                        Arial                                                         valor                                                         	xvalortot                                                     "999,999.99"                                                  Arial                                                         nombre                                                        nombre                                                        Arial                                                         lugar                                                         	xncliente                                                     Arial                                                         "Kilos / Cja"                                                 Arial                                                         "Blts"                                                        Arial                                                         "P.U."                                                        Arial                                                         "Total"                                                       Arial                                                         cia                                                           	conse.cia                                                     Device Font 10cpi                                             rfc                                                           
xdocumento                                                    Device Font 10cpi                                             "_______________________"                                     Arial                                                         "Total Compra"                                                Arial                                                         xfolio                                                        "999999"                                                      Device Font 10cpi                                             rfc                                                           xtickett                                                      Arial                                                         Arial                                                         Device Font 10cpi                                             Arial                                                         Arial                                                         Device Font 10cpi                                             Arial                                                         Device Font 10cpi                                             dataenvironment                                               �Top = 384
Left = 144
Width = 520
Height = 449
AutoOpenTables = .T.
AutoCloseTables = .T.
InitialSelectedAlias = "Ord_98"
DataSource = .NULL.
Name = "dataenvironment"
               sPROCEDURE Destroy
*- [CONVERTER] Restablecer tablas para compatibilidad
*THIS.OpenTables
*THIS.Init

ENDPROC
           ����    �   �                         q^   %   3       H      D           �  U    U   Destroy,     ��1 5                       h       )   �                                       cursor                                                        �Top = 20
Left = 10
Height = 328
Width = 91
Alias = "p_vnt_venta"
CursorSource = p_vnt_venta.dbf
Name = "Cursor1"
                                                                                                                                      cursor                                                        lTop = 20
Left = 150
Height = 90
Width = 91
Alias = "conse"
CursorSource = conse.dbf
Name = "Cursor2"
                  �DRIVER=winspool
DEVICE=TABLERO
OUTPUT=USB001
ORIENTATION=0
PAPERLENGTH=4466
PAPERWIDTH=722
ASCII=0
COPIES=1
DEFAULTSOURCE=15
PRINTQUALITY=135
COLOR=1
YRESOLUTION=135
TTOPTION=2
COLLATE=0
                                                     �<VFPData><reportdata name="" type="R" script="" execute="" execwhen="" class="" classlib="" declass="" declasslib=""/></VFPData>
                                                            L    winspool  TABLERO  USB001                   USB001                                                                   \TABLERO AJA\Samsung M2020 Seri   � 4M� r�d   �   �     etter                                                       ����                DINU" � 4  �2�                            	                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            �   SMTJ     � G P - 5 8 1 2 0 ( 1 3 5 d p i )   InputBin Option1 RESDLL UniresDLL Orientation PORTRAIT Resolution Option1 PaperSize Option2 MediaType Option1 PrintQuality Option1 OutputBin Option1 Halftone HT_PATSIZE_AUTO                         e LETTER PagesPerSheet 1 PageOrder FrontToBack PageBorder OFF ColorMode Grayscale                                  V4DM                                                     Arial                                                         
ORD_99.DBF                                                    Ord_99                                                        
ORD_98.DBF                                                    Ord_98                                                        TIME()                                                        "99:99"                                                       Device Font 10cpi                                             cantidad                                                      .iif(int(cantidad)=cantidad,nodecimal,cantidad)                "@BZ 999,999"                                                 Arial                                                         bultos                                                        iif(bultos<>0,bultos,' ')                                     	"@Z 9999"                                                     Arial                                                         precio                                                        precio                                                        "@Z 999.99"                                                   Arial                                                         valor                                                         cantidad*precio                                               "@Z 999999.99"                                                Arial                                                         xfac                                                          "@L 999999"                                                   Device Font 10cpi                                             rfc                                                           xfecha                                                        Arial                                                         valor                                                         	xvalortot                                                     "999,999.99"                                                  Arial                                                         nombre                                                        nombre                                                        Arial                                                         lugar                                                         	xncliente                                                     Arial                                                         "Kilos / Cja"                                                 Arial                                                         "Blts"                                                        Arial                                                         "P.U."                                                        Arial                                                         "Total"                                                       Arial                                                         cia                                                           	conse.cia                                                     Device Font 10cpi                                             rfc                                                           
xdocumento                                                    Device Font 10cpi                                             "_______________________"                                     Arial                                                         "Total Compra"                                                Arial                                                         xfolio                                                        "999999"                                                      Device Font 10cpi                                             rfc                                                           xtickett                                                      Arial                                                         Arial                                                         Device Font 10cpi                                             Arial                                                         Arial                                                         Device Font 10cpi                                             Arial                                                         dataenvironment                                               �Top = 384
Left = 144
Width = 520
Height = 449
AutoOpenTables = .T.
AutoCloseTables = .T.
InitialSelectedAlias = "Ord_98"
DataSource = .NULL.
Name = "dataenvironment"
               sPROCEDURE Destroy
*- [CONVERTER] Restablecer tablas para compatibilidad
*THIS.OpenTables
*THIS.Init

ENDPROC
           ����    �   �                         q^   %   3       H      D           �  U    U   Destroy,     ��1 5                       h       )   �                                       cursor                                                       Top = 20
Left = 10
Height = 328
Width = 91
Alias = "p_vnt_venta"
CursorSource = ..\..\..\..\..\sisadm119\p_vnt_venta.dbf
Name = "Cursor1"
                                                                                                                                                                             cursor                                                        �Top = 20
Left = 150
Height = 90
Width = 91
Alias = "conse"
CursorSource = ..\..\..\..\..\sisadm119\conse.dbf
Name = "Cursor2"
                                                   