   J   @                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              ORIENTATION=0
PAPERSIZE=1
ark E120
OUTPUT=USB001
ORI      lTop = 20
Left = 150
Height = 90
Width = 91
Alias = "conse"
CursorSource = conse.dbf
Name = "Cursor2"
                  cursor                                                        Courier New                                                   "Ticket"                                                      Courier New                                                   ticket                                                        ticket                                                        "99999"                                                       Courier New                                                   observ                                                        p_inv_juntar.observ                                           Courier New                                                   factura                                                       p_inv_juntar.factura                                          "999999"                                                      Courier New                                                   	"Factura"                                                     Courier New                                                   !"P�gina " + ALLTRIM(STR(_PAGENO))                             Arial                                                         "Relacion de Tickets:"                                        Arial                                                         
DATETIME()                                                                                                                  Arial                                                         "SISTEMA DE INVENTARIOS"                                      Arial                                                         	conse.cia                                                     Arial                                                         xtfecha                                                                                                                     Arial                                                         xusuario                                                      Arial                                                         "Ticket"                                                      Courier New                                                   	"Factura"                                                     Courier New                                                   "Ticket"                                                      Courier New                                                   	"Factura"                                                     Courier New                                                   	"Elaboro"                                                     Arial                                                         
"Autorizo"                                                    Arial                                                         "Reviso"                                                      Arial                                                         xusuario                                                      Arial                                                         Courier New                                                   Arial                                                         Arial                                                         Arial                                                         Arial                                                         Arial                                                         Arial                                                         dataenvironment                                               aTop = 299
Left = 205
Width = 520
Height = 200
DataSource = .NULL.
Name = "Dataenvironment"
                             cursor                                                        yTop = 20
Left = 10
Height = 90
Width = 91
Alias = "p_inv_juntar"
CursorSource = p_inv_juntar.dbf
Name = "Cursor1"
                                                               