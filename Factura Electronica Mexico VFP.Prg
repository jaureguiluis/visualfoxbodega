*
* Programa       : Factura Electronica México 
*
* Autor          : Halcón Divino 
*                  -------------
* 
* Desarrollado en: VFP 6.0 y corre perfectamente en VFP 9.0 sp2
* 
* Objetivo       : Proveer al desarrollador de VFP de un ejemplo o guía de como desarrollé 
*                  la Factura Electrónica ...para que no se quiebre tanto la cabeza como yo. 
* 
* Reflexion      : No hay pregunta tonta …Tonto el que no pregunta.
*                  Y así fue como pude terminar este desarrollo ..preguntando y preguntando. 
* 
* 
*Agradecimientos a: 
*-------------------
*   Cneftaly  miembro del del foro Taringa por su apoyo en el sello digital
*
*   Edeledel  miembro del del foro Taringa por su apyo en la generación del arhivo XML
*
*   Aampudia  miembro del del foro Taringa por su apyo en los seriales del componente ChilKat 
* 
* 
*Versión: del programa:
*----------------------
*   Fecha Creación : 2010 / Agosto   / 13
*   Modificación   : 2010 / Agosto   / 24  Generar archivo con componentes XML 
*   Modificación   : 2010 / Agosto   / 25  Incluir en la  Referencias el link  "para realizar pruebas" con 
*                                          Certificados de Sello Digital (CSD) (incluye los archivos .key y .cer así como la contraseña).
* 
* 
*Referencias 
*------------
*  para realizar pruebas  Certificados de Sello Digital (CSD) (incluye los archivos .key y .cer así como la contraseña).
*    http://www.sat.gob.mx/sitio_internet/e_sat/comprobantes_fiscales/15_15564.html
*
*  Emisión de CFD por sus propios medios
*    http://www.sat.gob.mx/sitio_internet/e_sat/comprobantes_fiscales/15_15634.html
*
*  Anexo 20 de la Resolución Miscelánea Fiscal para 2010
*    http://www.sat.gob.mx/sitio_internet/e_sat/comprobantes_fiscales/15_6534.html
*
*  Esquema de validación de forma y sintaxis
*    http://www.sat.gob.mx/sitio_internet/e_sat/comprobantes_fiscales/15_6545.html
*
*  Validadores oficiales de la SAT
*    http://www.sat.gob.mx/sitio_internet/e_sat/comprobantes_fiscales/15_15565.html
*
*  Validador no oficial de la SAT
*    http://validacfd.com.mx/XMLSATFreeValidator/Validate.xsa 
*
*  Todo sobre la Firma Electronica Avanzada (Fiel) 	
*    http://www.sat.gob.mx/sitio_internet/e_sat/tu_firma/
*
*  Descargue aquí la solicitud de certificado de Firma Electrónica Avanzada
*    http://www.sat.gob.mx/sitio_internet/e_sat/tu_firma/60_6627.html
*
*  Descargue aquí el programa SOLCEDI
*    http://www.sat.gob.mx/sitio_internet/e_sat/tu_firma/60_6626.html
*
*  Ejemplo del componente ChilKat para VFP para el sello electronico 
*    http://www.example-code.com/foxpro/rsa_openssl_sign.asp
*
*  Dscargeue el componente ChilKat 
*    http://www.megaupload.com/?d=3CJ2LGCE  para aplicaciones windows 
*     * los seriales estan en este mismo programa *
*
*
*
* 

* Definicon de Variables 
Public DatosGrales  
Public DatosCnspts  
Public strOriginal 
Public strSello 
Public noCertificado      
Public Certificado        
Public ArchivoCertificado
Public ArchivoKey 
Public PasswordKery

* Archivos de entrada                                              
ArchivoCertificado = "E:\CFD\SelloCFD\aaa010101aaa_CSD_01.cer"   && para realizar pruebas  Certificados incluye los archivos .key y .cer así como la contraseña
ArchivoKey         = "E:\CFD\SelloCFD\aaa010101aaa_CSD_01.key"   && http://www.sat.gob.mx/sitio_internet/e_sat/comprobantes_fiscales/15_15564.html
PasswordKey        = "a0123456789"

* Archivos de Salida 
ArchivoXml         = "E:\CFD\BuzonFacturas\Factura.Xml" 
ArchivoLog         = "E:\CFD\BuzonFacturas\Factura.Log" 

* Archivos temporales de trabajo donde se guardan los datos de la factura 
DatosGrales        = "C:\Windows\Temp\" + SUBSTR(SYS(2015), 3)    && Contiene los datos generales de la factura 
DatosCnspts        = "C:\Windows\Temp\" + SUBSTR(SYS(2015), 3)    && Contiene los items o partidas que conforman la factura

* Proceso 
Do CreaFactura    && Crea el contenedor de datos de la factura
Do AsignaValores  && Asigna datos a la factura 
Do CadenaOriginal && Genera la cadena original 
Do SelloDigital   && Genera el Sello Digital , Certificado, Num Certificado 
Do FacturaXml     && Geneara el archivo XML que contiene los datos de la factura
Do FacturaLog     && Se guarda log de Cadena Original y Sello Digital 

* Borra Archivos temporales de trabajo 
Erase &DatosGrales.
Erase &DatosGrales.

* Fin 
Return 

Procedure CreaFactura

* Datos Generales de la Factura 
Select 1 
Create Table &DatosGrales    ;
   (                    ;
    versions   C(005)  ,; && = "2.0" 
    serie      C(005)  ,; && = "A" 
    folio      C(010)  ,; && = "25810" 
    fecha      C(020)  ,; && = "2010-06-24T16:00:00" 
    noAprobaci C(005)  ,; && = "1" 
    anoAprobac C(005)  ,; && = "2009" 
    formaDePag C(080)  ,; && = "Una sola exhibición" 
    condicione C(250)  ,; && = "a"
    metodoDePa C(250)  ,; && = ""
    motivoDesc C(250)  ,; && = ""
    subTotal   C(020)  ,; && = "4371.00" 
    descuento  C(020)  ,; && = "0.00" 
    total      C(020)  ,; && = "5070.36" 
    tipoDeComp C(010)  ,; && = "ingreso" 
    noCertific C(030)  ,; && = "10001200000000022517" 
    sello      C(250)  ,; && = ""
    Enombre    C(100)  ,; && = "Elit Grupo Comercial, S.A. de C.V." 
    Erfc       C(015)  ,; && = ="EGC980817DF3">
    Ecalle     C(100)  ,; && = "Benito Juarez Ote" 
    EcodigoPos C(010)  ,; && = "67100" 
    Ecolonia   C(050)  ,; && = "Centro" 
    Eestado    C(020)  ,; && = "Nuevo Leon" 
    Elocalidad C(050)  ,; && = "Mexico" 
    Emunicipio C(050)  ,; && = "Cd. Guadalupe" 
    EnoExterio C(010)  ,; && = "106" 
    EnoInterio C(010)  ,; && = "1" 
    Epais      C(015)  ,; && = "Mexico"
    Xcalle     C(100)  ,; && = "Benito Juarez Ote" 
    XcodigoPos C(010)  ,; && = "67100" 
    Xcolonia   C(050)  ,; && = "Centro" 
    Xestado    C(020)  ,; && = "Nuevo Leon" 
    Xlocalidad C(050)  ,; && = "Cd. Guadalupe" 
    Xmunicipio C(050)  ,; && = "Cd. Guadalupe" 
    XnoExterio C(010)  ,; && = "106" 
    XnoInterio C(010)  ,; && = "" 
    Xpais      C(015)  ,; && = "Mexico"
    Rnombre    C(100)  ,; && = "ENVASADORAS DE AGUAS EN MEXICO, S. DE R. L. DE C.V." 
    Rrfc       C(015)  ,; && = "EAM001231D51">
    Rcalle     C(100)  ,; && = "AVE. LA SILLA" 
    RcodigoPos C(010)  ,; && = "67190" 
    Rcolonia   C(050)  ,; && = "PARQUE IND. LA SILLA" 
    Restado    C(020)  ,; && = "NUEVO LEON" 
    Rlocalidad C(050)  ,; && = "GUADALUPE" 
    Rmunicipio C(050)  ,; && = "GUADALUPE" 
    RnoExterio C(010)  ,; && = "7707" 
    RnoInterio C(010)  ,; && = "" 
    Rpais      C(015)  ,; && = "Mexico"
    impuesto   C(010)  ,; && = "IVA" 
    tasa       C(010)  ,; && = "16.00" 
    importe    C(020)   ; && = "699.36"/>
   )

Use 

* Datos de las partidas o conceptos que forman la factura
Create Table &DatosCnspts ;
   (                      ;
    cantidad    C(010) ,; && ="1.000" 
    noID        C(020) ,; && =""
    descripcio  C(250) ,; && ="CAUTÍN DE ESTACIÓN PROFESIONAL DE 50 WATTS" 
    importe     C(020) ,; && ="2499.00" 
    unidad      C(010) ,; && ="PIEZA" 
    valorUnita  C(020)  ; && ="2499.00"
   )
                
Use 

Return 

Procedure AsignaValores

* Datos Generales de la Factura 
Insert Into            ;
  &DatosGrales (folio) ; && Se da de alta un registro en blanco 
         Value ("   ")  


Update &DatosGrales Set  ;
    versions   = "2.0",  ;
    serie      = "A"  ,  ;                 
    folio      = "25810",; 
    fecha      = "2010-06-24T16:00:00" ,;
    noAprobaci = "1" ,;
    anoAprobac = "2009" ,;
    formaDePag = "Una sola exhibición" ,;
    condicione = "A 30 días",;
    metodoDePa = "Cheque",;
    motivoDesc = "Anticipo",;
    subTotal   = "4371.00" ,; && Anexo 20 indica: "la suma de los importes ANTES de descuentos e impuestos."
    descuento  =  "371.00" ,; && Anexo 20 indica: "importe total de los descuentos aplicables ANTES de impuestos"
    importe    =  "640.00" ,; && importe del impuesto trasladado  (4371.00 - 371.00) * 0.16 = 640.00 
    total      = "4640.00" ,; && Anexo 20 indica: "la suma del subtotal,menos los descuentos aplicables, más los impuestos trasladados, menos los impuestos retenidos"
    tipoDeComp = "ingreso" ,;
    impuesto   = "IVA"     ,;
    tasa       = "16.00"    

Update &DatosGrales Set  ;
    Enombre    = "Elit Grupo Comercial, S.A. de C.V." ,;
    Erfc       = "EGC980817DF3"     ,;
    Ecalle     = "Benito Juarez Ote" ,;
    EcodigoPos = "67100" ,;
    Ecolonia   = "Centro" ,;
    Eestado    = "Nuevo León" ,;
    Elocalidad = "México" ,;
    Emunicipio = "Cd. Guadalupe" ,;
    EnoExterio = "106" ,;
    EnoInterio = "1" ,;
    Epais      = "Mexico"

Update &DatosGrales Set  ;
    Xcalle     = "Benito Juarez Ote" ,;
    XcodigoPos = "67100" ,;
    Xcolonia   = "Centro" ,;
    Xestado    = "Nuevo León" ,;
    Xlocalidad = "Cd. Guadalupe" ,;
    Xmunicipio = "Cd. Guadalupe" ,;
    XnoExterio = "106" ,;
    Xpais      = "México"

Update &DatosGrales Set  ;
    Rnombre    = "ENVASADORAS DE AGUAS EN MÉXICO, S. DE R. L. DE C.V." ,;
    Rrfc       = "EAM001231D51",;
    Rcalle     = "AVE. LA SILLA" ,;
    RcodigoPos = "67190" ,;
    Rcolonia   = "PARQUE INDUSTRIAL LA SILLA" ,;
    Restado    = "NUEVO LEÓN" ,;
    Rlocalidad = "GUADALUPE" ,;
    Rmunicipio = "GUADALUPE" ,;
    RnoExterio = "7707" ,;
    RnoInterio = "1" ,;
    Rpais      = "México"
    



* Datos de los items o partidas de la Factura 
Insert Into &DatosCnspts ;
   (cantidad   ,; 
    noID       ,; 
    descripcio ,; 
    importe    ,; 
    unidad     ,; 
    valorUnita );
Values          ;
   ("1.000"    ,;
    ""         ,;
    "ARCO PARA SEGUETA DE ALTA TENS" ,;
    "176.00" ,;
    "PIEZA"   ,;
    "176.00" )
              
Insert Into &DatosCnspts ;
   (cantidad   ,; 
    noID       ,; 
    descripcio ,; 
    importe    ,; 
    unidad     ,; 
    valorUnita );
Values          ;
   ("1.000"    ,;
    ""         ,;
    "DOBLATUBO DE PALANCA 1/2" ,;
    "1696.00" ,;
    "PIEZA"   ,;
    "1696.00" )

Insert Into &DatosCnspts ;
   (cantidad   ,; 
    noID       ,; 
    descripcio ,; 
    importe    ,; 
    unidad     ,; 
    valorUnita );
Values          ;
   ("1.000"    ,;
    ""         ,;
    "CAUTÍN DE ESTACIÓN PROFESIONAL DE 50 WATTS" ,;
    "2499.00" ,;
    "PIEZA"   ,;
    "2499.00" )

Select * From &DatosGrales Into Cursor Gral   
Select * From &DatosCnspts Into Cursor Cnspts   

Return 


Procedure CadenaOriginal 

strOriginal  = "" 
strOriginal  = strOriginal  + "||" 
strOriginal  = strOriginal  + Iif(Len(QtarChrInval(Gral.versions  )) = 0, "" ,QtarChrInval(Gral.versions  ) + "|") && 1.a 
strOriginal  = strOriginal  + Iif(Len(QtarChrInval(Gral.serie     )) = 0, "" ,QtarChrInval(Gral.serie     ) + "|") && 1.b 
strOriginal  = strOriginal  + Iif(Len(QtarChrInval(Gral.folio     )) = 0, "" ,QtarChrInval(Gral.folio     ) + "|") && 1.c 
strOriginal  = strOriginal  + Iif(Len(QtarChrInval(Gral.fecha     )) = 0, "" ,QtarChrInval(Gral.fecha     ) + "|") && 1.d
strOriginal  = strOriginal  + Iif(Len(QtarChrInval(Gral.noAprobaci)) = 0, "" ,QtarChrInval(Gral.noAprobaci) + "|") && 1.e 
strOriginal  = strOriginal  + Iif(Len(QtarChrInval(Gral.anoAprobac)) = 0, "" ,QtarChrInval(Gral.anoAprobac) + "|") && 1.f 
strOriginal  = strOriginal  + Iif(Len(QtarChrInval(Gral.tipoDeComp)) = 0, "" ,QtarChrInval(Gral.tipoDeComp) + "|") && 1.g 
strOriginal  = strOriginal  + Iif(Len(QtarChrInval(Gral.formaDePag)) = 0, "" ,QtarChrInval(Gral.formaDePag) + "|") && 1.h 
strOriginal  = strOriginal  + Iif(Len(QtarChrInval(Gral.condicione)) = 0, "" ,QtarChrInval(Gral.condicione) + "|") && 1.i 
strOriginal  = strOriginal  + Iif(Len(QtarChrInval(Gral.subTotal  )) = 0, "" ,QtarChrInval(Gral.subTotal  ) + "|") && 1.j 
strOriginal  = strOriginal  + Iif(Len(QtarChrInval(Gral.descuento )) = 0, "" ,QtarChrInval(Gral.descuento ) + "|") && 1.k 
strOriginal  = strOriginal  + Iif(Len(QtarChrInval(Gral.total     )) = 0, "" ,QtarChrInval(Gral.total     ) + "|") && 1.L 
    
strOriginal  = strOriginal  + Iif(Len(QtarChrInval(Gral.Erfc      )) = 0, "" ,QtarChrInval(Gral.Erfc      ) + "|") && 2.a
strOriginal  = strOriginal  + Iif(Len(QtarChrInval(Gral.Enombre   )) = 0, "" ,QtarChrInval(Gral.Enombre   ) + "|") && 2.b
    
strOriginal  = strOriginal  + Iif(Len(QtarChrInval(Gral.Ecalle    )) = 0, "" ,QtarChrInval(Gral.Ecalle    ) + "|") && 3 a
strOriginal  = strOriginal  + Iif(Len(QtarChrInval(Gral.EnoExterio)) = 0, "" ,QtarChrInval(Gral.EnoExterio) + "|") && 3 b
strOriginal  = strOriginal  + Iif(Len(QtarChrInval(Gral.EnoInterio)) = 0, "" ,QtarChrInval(Gral.EnoInterio) + "|") && 3 c
strOriginal  = strOriginal  + Iif(Len(QtarChrInval(Gral.Ecolonia  )) = 0, "" ,QtarChrInval(Gral.Ecolonia  ) + "|") && 3 d
strOriginal  = strOriginal  + Iif(Len(QtarChrInval(Gral.Elocalidad)) = 0, "" ,QtarChrInval(Gral.Elocalidad) + "|") && 3 e
strOriginal  = strOriginal  + Iif(Len(QtarChrInval(Gral.Emunicipio)) = 0, "" ,QtarChrInval(Gral.Emunicipio) + "|") && 3 g
strOriginal  = strOriginal  + Iif(Len(QtarChrInval(Gral.Eestado   )) = 0, "" ,QtarChrInval(Gral.Eestado   ) + "|") && 3 h
strOriginal  = strOriginal  + Iif(Len(QtarChrInval(Gral.Epais     )) = 0, "" ,QtarChrInval(Gral.Epais     ) + "|") && 3 i
strOriginal  = strOriginal  + Iif(Len(QtarChrInval(Gral.EcodigoPos)) = 0, "" ,QtarChrInval(Gral.EcodigoPos) + "|") && 3 j

strOriginal  = strOriginal  + Iif(Len(QtarChrInval(Gral.Xcalle    )) = 0, "" ,QtarChrInval(Gral.Xcalle    ) + "|") && 4 a
strOriginal  = strOriginal  + Iif(Len(QtarChrInval(Gral.XnoExterio)) = 0, "" ,QtarChrInval(Gral.XnoExterio) + "|") && 4 h
strOriginal  = strOriginal  + Iif(Len(QtarChrInval(Gral.XnoInterio)) = 0, "" ,QtarChrInval(Gral.XnoInterio) + "|") && 3 c
strOriginal  = strOriginal  + Iif(Len(QtarChrInval(Gral.Xcolonia  )) = 0, "" ,QtarChrInval(Gral.Xcolonia  ) + "|") && 4 d
strOriginal  = strOriginal  + Iif(Len(QtarChrInval(Gral.Xlocalidad)) = 0, "" ,QtarChrInval(Gral.Xlocalidad) + "|") && 4 e
strOriginal  = strOriginal  + Iif(Len(QtarChrInval(Gral.Xmunicipio)) = 0, "" ,QtarChrInval(Gral.Xmunicipio) + "|") && 4 g
strOriginal  = strOriginal  + Iif(Len(QtarChrInval(Gral.Xestado   )) = 0, "" ,QtarChrInval(Gral.Xestado   ) + "|") && 4 h
strOriginal  = strOriginal  + Iif(Len(QtarChrInval(Gral.Xpais     )) = 0, "" ,QtarChrInval(Gral.Xpais     ) + "|") && 4 i
strOriginal  = strOriginal  + Iif(Len(QtarChrInval(Gral.XcodigoPos)) = 0, "" ,QtarChrInval(Gral.XcodigoPos) + "|") && 4 j

strOriginal  = strOriginal  + Iif(Len(QtarChrInval(Gral.Rrfc      )) = 0, "" ,QtarChrInval(Gral.Rrfc      ) + "|") && 5.a
strOriginal  = strOriginal  + Iif(Len(QtarChrInval(Gral.Rnombre   )) = 0, "" ,QtarChrInval(Gral.Rnombre   ) + "|") && 5.b

strOriginal  = strOriginal  + Iif(Len(QtarChrInval(Gral.Rcalle    )) = 0, "" ,QtarChrInval(Gral.Rcalle    ) + "|") && 6.a
strOriginal  = strOriginal  + Iif(Len(QtarChrInval(Gral.RnoExterio)) = 0, "" ,QtarChrInval(Gral.RnoExterio) + "|") && 6.b
strOriginal  = strOriginal  + Iif(Len(QtarChrInval(Gral.RnoInterio)) = 0, "" ,QtarChrInval(Gral.RnoInterio) + "|") && 6.c
strOriginal  = strOriginal  + Iif(Len(QtarChrInval(Gral.Rcolonia  )) = 0, "" ,QtarChrInval(Gral.Rcolonia  ) + "|") && 6.d
strOriginal  = strOriginal  + Iif(Len(QtarChrInval(Gral.Rlocalidad)) = 0, "" ,QtarChrInval(Gral.Rlocalidad) + "|") && 6.e
strOriginal  = strOriginal  + Iif(Len(QtarChrInval(Gral.Rmunicipio)) = 0, "" ,QtarChrInval(Gral.Rmunicipio) + "|") && 6.g
strOriginal  = strOriginal  + Iif(Len(QtarChrInval(Gral.Restado   )) = 0, "" ,QtarChrInval(Gral.Restado   ) + "|") && 6.h
strOriginal  = strOriginal  + Iif(Len(QtarChrInval(Gral.Rpais     )) = 0, "" ,QtarChrInval(Gral.Rpais     ) + "|") && 6.i
strOriginal  = strOriginal  + Iif(Len(QtarChrInval(Gral.RcodigoPos)) = 0, "" ,QtarChrInval(Gral.RcodigoPos) + "|") && 6.j


Select Cnspts
GoTo Top 
Do While Not Eof() 
   strOriginal  = strOriginal  + Iif(Len(QtarChrInval(Cnspts.cantidad   )) = 0, "" ,QtarChrInval(Cnspts.cantidad  ) + "|") && 7.a  
   strOriginal  = strOriginal  + Iif(Len(QtarChrInval(Cnspts.unidad     )) = 0, "" ,QtarChrInval(Cnspts.unidad    ) + "|") && 7.b
   strOriginal  = strOriginal  + Iif(Len(QtarChrInval(Cnspts.noID       )) = 0, "" ,QtarChrInval(Cnspts.noID      ) + "|") && 7.c
   strOriginal  = strOriginal  + Iif(Len(QtarChrInval(Cnspts.descripcio )) = 0, "" ,QtarChrInval(Cnspts.descripcio) + "|") && 7.d
   strOriginal  = strOriginal  + Iif(Len(QtarChrInval(Cnspts.valorUnita )) = 0, "" ,QtarChrInval(Cnspts.valorUnita) + "|") && 7.e
   strOriginal  = strOriginal  + Iif(Len(QtarChrInval(Cnspts.importe    )) = 0, "" ,QtarChrInval(Cnspts.importe   ) + "|") && 7.f
   Skip 
EndDo 

strOriginal  = strOriginal  + Iif(Len(QtarChrInval(Gral.impuesto  )) = 0, "" ,QtarChrInval(Gral.impuesto  ) + "|") && 10.a
strOriginal  = strOriginal  + Iif(Len(QtarChrInval(Gral.tasa      )) = 0, "" ,QtarChrInval(Gral.tasa      ) + "|") && 10.b
strOriginal  = strOriginal  + Iif(Len(QtarChrInval(Gral.importe   )) = 0, "" ,QtarChrInval(Gral.importe   ) + "|") && 10.c

strOriginal  = strOriginal  +  "|"  && fIN 

Return 

Procedure SelloDigital 

Local loPkey
Local lnSuccess
Local lcPkeyXml
Local loRsa
Local lcFileData
Local lcBase64Sig
Local loCert 

*  Objetos 
loPkey = CreateObject('Chilkat.PrivateKey')
loRsa  = CreateObject('Chilkat.Rsa')
loCert = CreateObject('Chilkat.Cert')

*  Load the Certificado 
loCert.LoadFromFile(ArchivoCertificado)

*  Load the private key from an RSA PEM file:     * loPkey.LoadPemFile("myKey.pem")
loPkey.LoadPkcs8EncryptedFile(ArchivoKey, PasswordKey)

*  Get the private key in XML format:
lcPkeyXml = loPkey.GetXml()

*  Desbloquea componente
*lnSuccess = loRsa.UnlockComponent("RSAT34MB34N_7F1CD986683M")  && Con cualquier número de serie se debloquea 
*lnSuccess = loRsa.UnlockComponent("RSAT34MB34N_2637664B634J")  
*lnSuccess = loRsa.UnlockComponent("RSAT34MB34N_3F0D2D9C642S")
*lnSuccess = loRsa.UnlockComponent("RSAT34MB34N_7A2D7D1A680G")
 lnSuccess = loRsa.UnlockComponent("RSAT34MB34N_7F1CD986683M")

* Error
IF (lnSuccess <> 1) THEN
    ? loRsa.LastErrorText
    Return
ENDIF

*  Import the private key into the RSA component:
lnSuccess = loRsa.ImportPrivateKey(lcPkeyXml)

* Error
IF (lnSuccess <> 1) THEN
    ? loRsa.LastErrorText
    Return
ENDIF

*  OpenSSL uses BigEndian byte ordering:
loRsa.LittleEndian = 0
lorsa.Charset      = "utf-8"
loRsa.EncodingMode = "base64"

strSello           = loRsa.SignStringENC(strOriginal,"md5")

N                  = loCert.SerialNumber
noCertificado      = SubStr(N,02,1)+SubStr(N,04,1)+SubStr(N,06,1)+SubStr(N,08,1)+SubStr(N,10,1)+;
                     SubStr(N,12,1)+SubStr(N,14,1)+SubStr(N,16,1)+SubStr(N,18,1)+SubStr(N,20,1)+;
                     SubStr(N,22,1)+SubStr(N,24,1)+SubStr(N,26,1)+SubStr(N,28,1)+SubStr(N,30,1)+;
                     SubStr(N,32,1)+SubStr(N,34,1)+SubStr(N,36,1)+SubStr(N,38,1)+SubStr(N,40,1)+;
                     SubStr(N,42,1)+SubStr(N,44,1)+SubStr(N,46,1)+SubStr(N,48,1)+SubStr(N,50,1) 
                     
Certificado        = SubStr(loCert.GetEncoded(), 1, Len(loCert.GetEncoded()) - 2)


Return 

Procedure FacturaXML 

*Local  CFDXml         As msxml2.DOMDocument && En VFP 6.0 no reconoce esta instrucción pero no importa 
*                                            && En VFP 9.0 puedes quitar el comentario o dejarlo como esta.
* 
Local  root            As IXMLDOMProcessingInstruction 
Local  nComprobante    As XmlNode   
Local  nEmisor         As XmlNode   
Local  nReceptor       As XmlNode   
Local  nDomiciloFiscal As XmlNode   
Local  nExpedidoEn     As XmlNode   
Local  nConceptos      As XmlNode   
Local  nConcepto       As XmlNode   
Local  nImpuestos      As XmlNode   
Local  nTraslados      As XmlNode   
Local  nTraslado       As XmlNode   


* se crea el objeto XML 
CFDXml = CREATEOBJECT("msxml2.DOMDocument") 

* Header: La siguiente instrucción genera  <?xml version="1.0"?> como salida
root   = CFDXml.createProcessingInstruction("xml","version='1.0' encoding='UTF-8'")
CFDXml.insertBefore(root, CFDXml.documentElement)

* Crea el Nodo Principal COMPROBANTE 
nComprobante = CFDXml.CreateNode(1,"Comprobante","")

	nComprobante.setAttribute("xmlns"             ,"http://www.sat.gob.mx/cfd/2")	
	nComprobante.setAttribute("xmlns:xsi"         ,"http://www.w3.org/2001/XMLSchema-instance")
	nComprobante.setAttribute("xsi:schemaLocation","http://www.sat.gob.mx/cfd/2 http://www.sat.gob.mx/sitio_internet/cfd/2/cfdv2.xsd")

	If Len(QtarChrInval(Gral.versions  )) > 0
	   nComprobante.setAttribute("version"           ,QtarChrInval(Gral.versions     ))
	ENDIF
	
	If Len(QtarChrInval(Gral.serie     )) > 0
   	   nComprobante.setAttribute("serie"             ,QtarChrInval(Gral.serie        ))
	EndIf                             
	If Len(QtarChrInval(Gral.folio         )) > 0
	   nComprobante.setAttribute("folio"             ,QtarChrInval(Gral.folio        ))
	EndIf
	If Len(QtarChrInval(Gral.fecha         )) > 0
	   nComprobante.setAttribute("fecha"             ,QtarChrInval(Gral.fecha        ))
	EndIf
	If Len(QtarChrInval(Gral.noAprobaci    )) > 0
	   nComprobante.setAttribute("noAprobacion"      ,QtarChrInval(Gral.noAprobaci   ))
	EndIf
	If Len(QtarChrInval(Gral.anoAprobac    )) > 0
	   nComprobante.setAttribute("anoAprobacion"     ,QtarChrInval(Gral.anoAprobac   ))
	EndIf
	If Len(QtarChrInval(Gral.formaDePag    )) > 0
	   nComprobante.setAttribute("formaDePago"       ,QtarChrInval(Gral.formaDePag   ))
	ENDIF
	If Len(QtarChrInval(Gral.metodoDePa    )) > 0
	   nComprobante.setAttribute("metodoDePago"       ,QtarChrInval(Gral.metodoDePa  ))
	ENDIF	
	If Len(QtarChrInval(Gral.condicione    )) > 0
	   nComprobante.setAttribute("condicionesDePago"   ,QtarChrInval(Gral.condicione  ))
	ENDIF	
	If Len(QtarChrInval(Gral.motivoDesc    )) > 0
	   nComprobante.setAttribute("motivoDescuento"   ,QtarChrInval(Gral.motivoDesc   ))
	ENDIF
	If Len(QtarChrInval(Gral.subTotal      )) > 0
	   nComprobante.setAttribute("subTotal"          ,QtarChrInval(Gral.subTotal     ))
	EndIf
	If Len(QtarChrInval(Gral.descuento     )) > 0
	   nComprobante.setAttribute("descuento"          ,QtarChrInval(Gral.descuento   ))
	EndIf
	If Len(QtarChrInval(Gral.total         )) > 0
	   nComprobante.setAttribute("total"             ,QtarChrInval(Gral.total        ))
	EndIf
	If Len(QtarChrInval(Gral.tipoDeComp    )) > 0
	   nComprobante.setAttribute("tipoDeComprobante" ,QtarChrInval(Gral.tipoDeComp   ))
	EndIf
	If Len(QtarChrInval(noCertificado    )) > 0
	   nComprobante.setAttribute("noCertificado"     ,QtarChrInval(noCertificado     ))
	EndIf
	If Len(QtarChrInval(Certificado    )) > 0
	   nComprobante.setAttribute("certificado"       ,QtarChrInval(Certificado       ))
	EndIf
	If Len(QtarChrInval(strsello         )) > 0
	   nComprobante.setAttribute("sello"             ,QtarChrInval(strsello          ))
	EndIf

	* Se crea el Nodo Emisor
    nEmisor = CFDXml.CreateNode(1, "Emisor", "")
		If Len(QtarChrInval(Gral.Enombre        )) > 0
		   nEmisor.setAttribute("nombre"             ,QtarChrInval(Gral.Enombre      ))
		EndIf
		If Len(QtarChrInval(Gral.Erfc           )) > 0
		   nEmisor.setAttribute("rfc"               ,QtarChrInval(Gral.Erfc          ))
		ENDIF
	
	    * Se crea el Nodo Domicilio Fiscal
	    nDomiciloFiscal = CFDXml.CreateNode(1, "DomicilioFiscal", "")   

			If Len(QtarChrInval(Gral.Ecalle         )) > 0
		   	   nDomiciloFiscal.setAttribute("calle"               ,QtarChrInval(Gral.Ecalle       ))
			EndIf
			If Len(QtarChrInval(Gral.EcodigoPos    )) > 0
		   	   nDomiciloFiscal.setAttribute("codigoPostal"       ,QtarChrInval(Gral.EcodigoPos    ))
			EndIf
			If Len(QtarChrInval(Gral.Ecolonia       )) > 0
		   	   nDomiciloFiscal.setAttribute("colonia"            ,QtarChrInval(Gral.Ecolonia      ))
			EndIf
			If Len(QtarChrInval(Gral.Eestado        )) > 0
		   	   nDomiciloFiscal.setAttribute("estado"             ,QtarChrInval(Gral.Eestado       ))
			EndIf
			If Len(QtarChrInval(Gral.Elocalidad     )) > 0
		   	   nDomiciloFiscal.setAttribute("localidad"          ,QtarChrInval(Gral.Elocalidad    ))
			EndIf
			If Len(QtarChrInval(Gral.Emunicipio     )) > 0
		   	   nDomiciloFiscal.setAttribute("municipio"          ,QtarChrInval(Gral.Emunicipio    ))
			EndIf
			If Len(QtarChrInval(Gral.EnoExterio    )) > 0
		   	   nDomiciloFiscal.setAttribute("noExterior"         ,QtarChrInval(Gral.EnoExterio    ))
			EndIf
			If Len(QtarChrInval(Gral.EnoInterio    )) > 0
		   	   nDomiciloFiscal.setAttribute("noInterior"         ,QtarChrInval(Gral.EnoInterio    ))
			EndIf
			If Len(QtarChrInval(Gral.Epais          )) > 0
		   	   nDomiciloFiscal.setAttribute("pais"               ,QtarChrInval(Gral.Epais         ))
			ENDIF
		
		* El nodo Domicilio Fiscal se agrega al nodo Emisor 	
        nEmisor.AppendChild(nDomiciloFiscal)
        
        * Se crea el Nodo Expedido En
        nExpedidoEn  = CFDXml.CreateNode(1, "ExpedidoEn", "")
			If Len(QtarChrInval(Gral.Xcalle         )) > 0
		   	   nExpedidoEn.setAttribute("calle"               ,QtarChrInval(Gral.Xcalle        ))
			EndIf
			If Len(QtarChrInval(Gral.XcodigoPos    )) > 0
		   	   nExpedidoEn.setAttribute("codigoPostal"        ,QtarChrInval(Gral.XcodigoPos    ))
			EndIf
			If Len(QtarChrInval(Gral.Xcolonia       )) > 0
		   	   nExpedidoEn.setAttribute("colonia"             ,QtarChrInval(Gral.Xcolonia     ))
			EndIf
			If Len(QtarChrInval(Gral.Xestado        )) > 0
		   	   nExpedidoEn.setAttribute("estado"              ,QtarChrInval(Gral.Xestado       ))
			EndIf
			If Len(QtarChrInval(Gral.Xlocalidad     )) > 0
		   	   nExpedidoEn.setAttribute("localidad"           ,QtarChrInval(Gral.Xlocalidad    ))
			EndIf
			If Len(QtarChrInval(Gral.Xmunicipio     )) > 0
		   	   nExpedidoEn.setAttribute("municipio"           ,QtarChrInval(Gral.Xmunicipio    ))
			EndIf
			If Len(QtarChrInval(Gral.XnoExterio    )) > 0
		   	   nExpedidoEn.setAttribute("noExterior"          ,QtarChrInval(Gral.XnoExterio    ))
			EndIf
			If Len(QtarChrInval(Gral.XnoInterio    )) > 0
		   	   nExpedidoEn.setAttribute("noInterior"          ,QtarChrInval(Gral.XnoInterio    ))
			EndIf
			If Len(QtarChrInval(Gral.Xpais          )) > 0
		   	   nExpedidoEn.setAttribute("pais"               ,QtarChrInval(Gral.Xpais          ))
			ENDIF
		* Se agrega el nodo nExpedidoEn a el nodo Emisor 	
		nEmisor.AppendChild(nExpedidoEn )
		
	* Se agrega el nodo Emisor 	al nodo Comprobante
    nComprobante.AppendChild(nEmisor);
		
    * Se crea el Nodo Receptor
    nReceptor = CFDXml.CreateNode(1, "Receptor", "")
		If Len(QtarChrInval(Gral.Rnombre        )) > 0
		   nReceptor.setAttribute("nombre"             ,QtarChrInval(Gral.Rnombre       ))
		EndIf
		If Len(QtarChrInval(Gral.Rrfc           )) > 0
		   nReceptor.setAttribute("rfc"               ,QtarChrInval(Gral.Rrfc           ))
		ENDIF
	
	    * Se crea el Nodo Domicilio Fiscal del Receptor
	    nDomiciloFiscal = CFDXml.CreateNode(1, "Domicilio", "")   

			If Len(QtarChrInval(Gral.Rcalle         )) > 0
		   	   nDomiciloFiscal.setAttribute("calle"              ,QtarChrInval(Gral.Rcalle        ))
			EndIf
			If Len(QtarChrInval(Gral.RcodigoPos    )) > 0
		   	   nDomiciloFiscal.setAttribute("codigoPostal"       ,QtarChrInval(Gral.RcodigoPos    ))
			EndIf
			If Len(QtarChrInval(Gral.Rcolonia       )) > 0
		   	   nDomiciloFiscal.setAttribute("colonia"            ,QtarChrInval(Gral.Rcolonia      ))
			EndIf
			If Len(QtarChrInval(Gral.Restado        )) > 0
		   	   nDomiciloFiscal.setAttribute("estado"             ,QtarChrInval(Gral.Restado       ))
			EndIf
			If Len(QtarChrInval(Gral.Rlocalidad     )) > 0
		   	   nDomiciloFiscal.setAttribute("localidad"          ,QtarChrInval(Gral.Rlocalidad    ))
			EndIf
			If Len(QtarChrInval(Gral.Rmunicipio     )) > 0
		   	   nDomiciloFiscal.setAttribute("municipio"          ,QtarChrInval(Gral.Rmunicipio    ))
			EndIf
			If Len(QtarChrInval(Gral.RnoExterio    )) > 0
		   	   nDomiciloFiscal.setAttribute("noExterior"         ,QtarChrInval(Gral.RnoExterio    ))
			EndIf
			If Len(QtarChrInval(Gral.RnoInterio    )) > 0
		   	   nDomiciloFiscal.setAttribute("noInterior"         ,QtarChrInval(Gral.RnoInterio    ))
			EndIf
			If Len(QtarChrInval(Gral.Rpais          )) > 0
		   	   nDomiciloFiscal.setAttribute("pais"               ,QtarChrInval(Gral.Rpais         ))
			ENDIF
		
		* El nodo Domicilio Fiscal del Receptor se agrega al nodo nReceptor
        nReceptor.AppendChild(nDomiciloFiscal)
        
	* El nodo Receptor se agrega al nodo Comprobante 
	nComprobante.AppendChild(nReceptor);
	
    * Se crea el Nodo Conceptos
    nConceptos = CFDXml.CreateNode(1, "Conceptos", "")

		Select Cnspts
		Goto Top
		Do While Not Eof()
    		* Se crea el Nodo Concepto
        	nConcepto = CFDXml.CreateNode(1 , "Concepto", "")
   				If Len(QtarChrInval(Cnspts.cantidad)) > 0
		   	       nConcepto.setAttribute("cantidad"         ,QtarChrInval(Cnspts.cantidad  ))
			    EndIf
   			    If Len(QtarChrInval(Cnspts.descripcio)) > 0
		   	       nConcepto.setAttribute("descripcion"      ,QtarChrInval(Cnspts.descripcio))
			    EndIf
			    If Len(QtarChrInval(Cnspts.importe)) > 0
		   	       nConcepto.setAttribute("importe"          ,QtarChrInval(Cnspts.importe   ))
			    EndIf
			    If Len(QtarChrInval(Cnspts.unidad)) > 0
		   	       nConcepto.setAttribute("unidad"           ,QtarChrInval(Cnspts.unidad    ))
			    EndIf
			    If Len(QtarChrInval(Cnspts.valorUnita )) > 0
		   	       nConcepto.setAttribute("valorUnitario"    ,QtarChrInval(Cnspts.valorUnita))
			    ENDIF
			   
            nConceptos.AppendChild(nConcepto)
   		    Skip
		EndDo 
        
	* El nodo Conceptos se agrega al nodo Comprobante 
    nComprobante.AppendChild(nConceptos)

    * Se crea el Nodo Impuestos
    nImpuestos = CFDXml.CreateNode(1, "Impuestos", "")

    	* Se crea el Nodo Traslados
    	nTraslados = CFDXml.CreateNode(1, "Traslados", "")

        	* Se crea el Nodo Traslado
            nTraslado = CFDXml.CreateNode(1 , "Traslado", "")

				If Len(QtarChrInval(Gral.impuesto   )) > 0
                	nTraslado.setAttribute("impuesto",QtarChrInval(Gral.impuesto   ))
				EndIf
				If Len(QtarChrInval(Gral.tasa       )) > 0
                	nTraslado.setAttribute("tasa"    ,QtarChrInval(Gral.tasa       ))
				EndIf
				If Len(QtarChrInval(Gral.importe    )) > 0
                	nTraslado.setAttribute("importe",QtarChrInval(Gral.importe     ))
				EndIf

            * se agrega el nodo traslado al nodo traslados
            nTraslados.AppendChild(nTraslado);
            
        * se agrega el nodo Traslados al nodo Impuestos 
		nImpuestos.AppendChild(nTraslados)
		
    * se agrega el nodo Impuestos al nodo Comprobante 
    nComprobante.AppendChild(nImpuestos);
    
* se agrega el nodo Comprobante al nodo CFDXml 
CFDXml.AppendChild(nComprobante)

CFDXml.Save(ArchivoXml)

Return 

Function QtarChrInval
Parameter Dato

Dato    = AllTrim(Dato)
Dato    = CHRTRAN(Dato,[&><"'],[.....])
*ato    = CHRTRAN(Dato,[áéíóúñÁÉÍÓÚÑ&><"'],[aeiounAEIOUN.....])

* Quita blancos entre palabras (Colapsa espacios en blanco)
CharAnterior = ""
NewDato      = ""
For Iq = 1 To Len(Dato)
    CharActual = SubStr(Dato,Iq,1)
    If Not( CharAnterior = " " And  CharActual = " ")
       NewDato = NewDato + CharActual
    EndIf
    CharAnterior = CharActual 
EndFor 

Return NewDato

Procedure FacturaLog     

*LenOriginal = strtofile(strOriginal,"Prueba.Txt")
Set Console Off 
Set print to &ArchivoLog Additive
set print on 

? TtoC(DateTime()) + " Folio " + QtarChrInval(Gral.folio) + " Cadena Original . La Longitud es de " + Str(Len(strOriginal)) 
? TtoC(DateTime()) + " Folio " + QtarChrInval(Gral.folio) + " " 
For I = 1 To Len(strOriginal)
    ?? SubStr(strOriginal,I,1)
EndFor 
? TtoC(DateTime()) + " Folio " + QtarChrInval(Gral.folio) + " ----------------------------------------------------------------------------"
? TtoC(DateTime()) + " Folio " + QtarChrInval(Gral.folio) + " Sello Digital   - La Longitud es de " + Str(Len(strSello))
? TtoC(DateTime()) + " Folio " + QtarChrInval(Gral.folio) + " " + strSello 
? TtoC(DateTime()) + " Folio " + QtarChrInval(Gral.folio) + "----------------------------------------------------------------------------"
? 

set print off
Set print to 

modi comm &ArchivoLog 

RETURN


*  <?xml version="1.0" encoding="utf-8"?>
*    <Comprobante 
*      xmlns="http://www.sat.gob.mx/cfd/2" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"    xsi:schemaLocation="http://www.sat.gob.mx/cfd/2 http://www.sat.gob.mx/sitio_internet/cfd/2/cfdv2.xsd" 
*      version="2.0" 
*      serie="A" 
*      folio=" 25810" 
*      fecha="2010-06-24T16:00:00" 
*      noAprobacion="1" 
*      anoAprobacion="2009" 
*      formaDePago="Una sola exhibición" 
*      subTotal="4371.00" 
*      descuento="0.00" 
*      total="5070.36" 
*      tipoDeComprobante="ingreso" 
*      noCertificado="10001200000000022517" 
*      certificado="MIIDhDC...g=="*   
*      sello="pJshOP+AIxaewBg9ed+rfez2eWIhKiB+scaDU1sThYwfI1/mfG+DcOLlZXFAuQPPlfCecwSMztezCUYZYqBlxBLqu5A0XJYzUdiRB9xm6WpnxgSIT+EoGlGfgAlhnxRsAUhOD9ubaDyHR0Uv0yCkmV0qMd+ZPH85Ji5mKc+ZtAk=">
*      <Emisor 
*         nombre="Elit Grupo Comercial, S.A. de C.V." 
*         rfc="EGC980817DF3">
*         <DomicilioFiscal 
*           calle="Benito Juarez Ote" 
*           codigoPostal="67100" 
*           colonia="Centro" 
*           estado="Nuevo Leon" 
*           localidad="Mexico" 
*           municipio="Cd. Guadalupe" 
*           noExterior="106" 
*           noInterior="1" 
*           pais="Mexico"
*         />
*         <ExpedidoEn 
*           calle="Benito Juarez Ote" 
*           codigoPostal="67100" 
*           colonia="Centro" 
*           estado="Nuevo Leon" 
*           localidad="Cd. Guadalupe" 
*           municipio="Cd. Guadalupe" 
*           noExterior="106" 
*           pais="Mexico"
*         />
*      </Emisor>
*      <Receptor 
*         nombre="ENVASADORAS DE AGUAS EN MEXICO, S. DE R. L. DE C.V." 
*         rfc="EAM001231D51">
*         <Domicilio 
*           calle="AVE. LA SILLA" 
*           codigoPostal="67190" 
*           colonia="PARQUE IND. LA SILLA" 
*           estado="NUEVO LEON" 
*           localidad="GUADALUPE" 
*           municipio="GUADALUPE" 
*           noExterior="7707" 
*           pais="Mexico"
*         />
*      </Receptor>
*      <Conceptos>
*         <Concepto 
*           cantidad="1.000" 
*           descripcion="ARCO PARA SEGUETA DE ALTA TENS"  
*           importe="176.00" 
*           unidad="PIEZA" 
*           valorUnitario="176.00"
*         />
*         <Concepto 
*           cantidad="1.000" 
*           descripcion="DOBLATUBO DE PALANCA 1/2" 
*           importe="1696.00" 
*           unidad="PIEZA" 
*           valorUnitario="1696.00"
*         />
*         <Concepto 
*           cantidad="1.000" 
*           descripcion="CAUTÍN DE ESTACIÓN PROFESIONAL DE 50 WATTS" 
*           importe="2499.00" 
*           unidad="PIEZA" 
*           valorUnitario="2499.00"
*         />
*      </Conceptos>
*      <Impuestos>
*         <Traslados>
*           <Traslado 
*            impuesto="IVA" 
*            tasa="16.00" 
*            importe="699.36"/>
*         </Traslados>
*      </Impuestos>
*    </Comprobante>






