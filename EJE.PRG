**********************************
***MODULO: FACTURACION
***PROGRAMA: A,B,C DE MOVIMIENTOS
***          ENTRADAS/SALIDAS PTOS
***VAINV201.PRG
**********************************
close all
****RUITNA DE MULTIUSUARIO
set procedure to block
****RUTINA DE PANTALLA
var1="INVENTARIOS"
clear
@ 0,0 to 2,79 doub
@ 1,(80-len(var1))/2 say var1
@ 3,0 to 20,79 doub
@ 21,0 to 23,79 doub
@ 1,3 say date() pict "@E"
@ 2,3 say " S.D. ROM "
****DECLARACION DE ARCHIVOS
select 1
use minv01 index minv011,minv012
select 2
use pinv01  index pinv011,pinv012,pinv013
select 3
use inv01 index inv011
select 4
use prod01 index prod011
select 5
use mpr01 index mpr011,mpr012,mpr013
select 6
use conc index conc1,conc2,conc3,conc4
select 7
use mcl01 index mcl011,mcl012
sele 8
use ami01 index ami011
sele 9
use acxp01 index acxp011,acxp012,acxp013,acxp014

****DECLARACION DE VARIABLES

store 0 to sw,sw1,swc,sws,pminv02,pminv03,pminv07,pminv08,pminv09,pminv10
store 0 to pminv13,c1
store space(20) to pminv12
store space(12) to pminv11
store space(1) to pminv01,clave
store space(8) to pminv05,pminv06
pminv04=date()
store space(60) to psal02,psal2x
store 0 to sw,sw1,swc,sws,psal05,psal04,psal03,reng,psal06,mes,ano,par,swo
store space(8) to psal01
store space(1) to psal07
psal08=date()
nombre=space(50)
reng=12
pven01=space(18)
cliente=space(18)
****INICIO DE PROCESO
do while .t.
   opcion=1
   
   @ 22,10 say space(65)
   @ 19,5 say space(74)
   @ 19,3  prompt "ALTAS"
   @ 19,30 prompt "CANCELACION"
   @ 19,71 prompt "SALIR"
   @ 1,25 say "MOVIMIENTOS DE INVENTARIOS"
   
   
   menu to opcion
   save screen to pan101
   do case
   case opcion=3
      close all
      exit
      
   case opcion=1
      
      
      ****INICIO DE PROCESO O CICLO
      @ 11,2 clear to 19,78
      
      reng=12
      par=1
      @ 4,2 say "MOVIMIENTO"
      @ 5,2 say "TIPO"
      @ 6,2 say "FECHA"
      @ 7,2 say "PROVEEDOR"
      @ 8,2 say "ORDEN DE COMPRA"
      @ 4,40 say "PEDIMENTO"
      @ 5,40 say "ADUANA"
      @ 6,40 say "NO. REM/FACT."
      @ 7,40 say "IMPORTE FACT."
      @ 8,40 say "CON. DE PAGO"
      @ 16,47 say "SUBTOTAL"
      @ 17,47 say "I.V.A.  "
      @ 18,47 say "TOTAL   "
      @ 09,01 to 15,78 double
      @ 11,02 to 11,77 double
      @ 10,10 to 14,10 double
      @ 10,31 to 14,31 double
      @ 10,39 to 14,39 double
      @ 10,46 to 14,46 double
      @ 10,61 to 14,61 double
      @ 10,76 to 14,76 double
      @ 10,2  say "PRODUCTO"
      @ 10,15 say "DESCRIPCION"
      @ 10,33 say "U/MED"
      @ 10,41 say "CANT."
      @ 10,47 say "COSTO UNITARIO"
      @ 10,65 say "IMPORTE"
      @ 10,77 say "S"
      save screen to invpan
      
      do while .t.
         select 1
         
         if sw1=0                                       && SI SW1=1  CORRECION DE INFORMACION  &&
            store 0 to sw,swc,sws,pminv02,pminv03,pminv07,pminv08,pminv09,pminv10
            store 0 to pminv13,subtot
            store space(20) to pminv12
            store space(12) to pminv11
            store space(1) to pminv01
            store space(8) to pminv05,pminv06
            pminv04=date()
            store space(60) to pinv02
            store 0 to sw,swc,sws,pinv03,pinv04,pinv05,pinv06,pinv07,pinv08
            store 0 to pinv09,pinv10,pinv11,pinv12,pinv13,pinv15,tot,condi
            store space(1) to pinv16,pinv01
            pinv14=date()
            fechav=date()
         endif
         
         set deli off
         clear gets
         set deli on
         save screen to pame
         @19,5 say space(74)
         mens="ALIMENTA LA CLAVE DEL MOVIMIENTO [1 ESP.]"
         set deli off
         @ 19,20 get mens
         clear gets
         set deli on
         @ 22,3 say "[F1] CATALOGO DE MOVIMIENTO"
         do while .t.
            select 6
            sec=4
            @ 4,20 get pminv01 pict "!"
            read
            if mod(readkey(),256)=12
               sws=1
               restore screen from pan101
               return
            endif
            save screen to paninv
            if mod(readkey(),256)=36
               do catalogo
               if swc = 0
                  loop
               else
                  pminv01=clave
                  des=co04
                  des1=substr(des,1,7)
                  @ 4,20 get pminv01 pict '!'
                  set deli off
                  @ 4,31 get des1
                  clear gets
                  set deli on
               endif
            endif
            set order to 2
            seek str(sec,3,0)+pminv01
            if found()
               des=co04
               des1=substr(des,1,8)
               set deli off
               @ 4,31 get des1
               clear gets
               set deli on
               exit
            else
               mensaje = "ERROR, MOVIMIENTO NO EXISTE.. [ENTER] PARA CONTINUAR"
               do alerta
            endif
         enddo
         if sws=1
            sws=0
            loop
         endif
         @ 22,2 say space(30)
         @19,5 say space(74)
         mens="ALIMENTA EL TIPO DEL MOVIMIENTO [99]"
         set deli off
         @ 19,20 get mens
         clear gets
         set deli on
         @ 22,3 say "[F1] CATALOGO DE TIPO MOV."
         do while .t.
            select 6
            sec=5
            @ 5,20 get pminv02 pict '99'
            read
            if mod(readkey(),256)=12
               sws = 1
               exit
            endif
            if mod(readkey(),256)=36
               do catalogo
               if swc = 0
                  loop
               else
                  pminv02=c1
                  @ 5,20 get pminv02 pict '99'
                  store space(8) to pco05
                  store substr(co05,1,7) to pco05
                  set deli off
                  clea gets
               endif
            endif
            set order to 3
            seek str(sec,3,0)+str(pminv02,6,0)
            if found()
               store space(8) to pco05
               store substr(co05,1,7) to pco05
               store substr(co04,1,8) to mpco05
               set deli off
               @ 5,31 get mpco05
               clear gets
               set deli on
               exit
            else
               mensaje = "ERROR, TIPO DE MOV.  NO EXISTE.. [ENTER] PARA CONTINUAR"
               do alerta
            endif
         enddo
         if sws=1
            return
         endif
         @ 22,2 say space(30)
         @19,5 say space(74)
         mens="ALIMENTA LA FECHA  DEL MOVIMIENTO [DD-MM-AA]"
         set deli off
         @ 19,20 get mens
         clear gets
         set deli on
         @ 6,20 get pminv04 pict '@D'
         read
         if mod(readkey(),256)=12
            sws=1
            restore screen from pan101
            exit
         endif
         if pminv01="E"
            @19,5 say space(74)
            mens="ALIMENTA LA CLAVE DEL PROVEEDOR [999999999999]"
            set deli off
            @ 19,20 get mens
            clear gets
            set deli on
            @ 22,3 say "[F1] CATALOGO DE PROVEEDORES"
            select 5
            do while .t.
               @ 7,2 say "               "
               @ 7,2 say "PROVEEDOR"
               @ 7,20 get pminv03 pict '999999999999'
               read
               if mod(readkey(),256)=12
                  sws=1
                  restore screen from pan101
                  exit
               endif
               if mod(readkey(),256)=36
                  sele 5
                  do catpro
                  if swc=0
                     loop
                  else
                     pminv03=clave
                     @ 7,20 get pminv03 pict '999999999999'
                     clear gets
                  endif
               endif
               select 5
               seek str(cia,2,0)+div+str(pminv03,12,0)
               if .NOT. found()
                  @ 19,02 say space(74)
                  @ 19,20 say "ERROR  PROVEEDOR NO ESTA DADO DE ALTA"
                  do while inkey()=0
                  enddo
                  @ 19,02 say space(74)
                  loop
               else
                  pro02p=substr(pr02,1,8)
                  nombre=pr02
                  set deli off
                  @ 7,31 get pro02p
                  clear gets
                  set deli on
                  exit
               endif
            enddo
         else
            @ 19,5 say space(74)
            mens="ALIMENTA LA CLAVE DEL CLIENTE "
            set deli off
            @ 19,25 get mens
            clear gets
            set deli on
            select 7
            @ 22,3 say "[F1] ALOGO DE CLIENTES"
            do while .t.
               @ 7,2 say "               "
               @ 7,2 say "CLIENTE"
               @ 7,20 get pven01 pict "@!18X"
               read
               if mod(readkey(),256)=12
                  close all
                  sws = 1
                  return
               endif
               if mod(readkey(),256)=36
                  do catcli
                  if swc = 0
                     loop
                  else
                     pven01=cliente
                     @ 7,20 get pven01 pict '@!18X'
                     clear gets
                  endif
               else
                  @ 7,20 get pven01 pict "@!18X"
                  clear gets
               endif
               sele 7
               set order to 1
               seek pven01
               if found()
                  set deli off
                  nom=cl02
                  nom1=substr(cl02,1,20)
                  @ 7,20 say space(20)
                  @ 7,20 get nom1
                  clear gets
                  set deli on
                  exit
               else
                  mensaje = "ERROR, CLIENTE NO EXISTE.. [ENTER] PARA CONTINUAR"
                  do alerta
               endif
            enddo
         endif
         if sws=1
            sws=0
            exit
         endif
         @ 22,2 say space(30)
         @19,5 say space(74)
         mens="ALIMENTA EL NUMERO DE ORDEN DE COMPRA [8 ESP.]"
         set deli off
         @ 19,20 get mens
         clear gets
         set deli on
         @ 8,20 get pminv06
         read
         if mod(readkey(),256)=12
            sws=1
            restore screen from pan101
            exit
         endif
         @19,5 say space(74)
         mens="ALIMENTA EL NUMERO DEL PEDIMENTO DE IMPORTACION [12 ESP.]"
         set deli off
         @ 19,15 get mens
         clear gets
         set deli on
         @ 4,55 get pminv11
         read
         if mod(readkey(),256)=12
            sws=1
            restore screen from pan101
            exit
         endif
         @19,5 say space(74)
         mens="ALIMENTA LA ADUANA QUE TRAMITO LA IMPORTACION [20 ESP.]"
         set deli off
         @ 19,15 get mens
         clear gets
         set deli on
         @ 5,55 get pminv12
         read
         if mod(readkey(),256)=12
            sws=1
            restore screen from pan101
            exit
         endif
         @19,5 say space(74)
         mens="ALIMENTA EL NO. DE LA REMISION O FACTURA [8 ESP.]"
         set deli off
         @ 19,20 get mens
         clear gets
         set deli on
         @ 6,55 get pminv05
         read
         if mod(readkey(),256)=12
            sws=1
            restore screen from pan101
            exit
         endif
         if pminv03<>0
	         select 1
             set order to 1	         
    	     seek pminv05+str(pminv03,12,0)+str(cia,2,0)+div
        	 if found()
	            @ 19,5 say space(74)
    	        @ 19,12 say "<<<<< ERROR, ESA FACTURA YA EXISTE [ENTER] CONTINUAR >>>>>"
        	    do while inkey()=0
	            enddo
    	        @ 19,5 say space(70)
        	    sw1=1
	            loop
    	     endif
         else
             sele 1
             set order to 2
    	     seek pminv05+pven01+str(cia,2,0)+div
        	 if found()
	            @ 19,5 say space(74)
    	        @ 19,12 say "<<<<< ERROR, ESA FACTURA YA EXISTE [ENTER] CONTINUAR >>>>>"
        	    do while inkey()=0
	            enddo
    	        @ 19,5 say space(70)
        	    sw1=1
	            loop
    	     endif
         endif         
         @19,5 say space(74)
         mens="ALIMENTA EL IMPORTE TOTAL DE LA FACTURA C/IVA  [99,999,999.99]"
         set deli off
         @ 19,10 get mens
         clear gets
         set deli on
         @ 7,55 get pminv08 pict '99,999,999.99'
         read
         if mod(readkey(),256)=12
            sws=1
            restore screen from pan101
            exit
         endif
         @19,5 say space(74)
         mens="ALIMENTA LA CONDICION DE PAGO DE LA FACTURA  [99]"
         set deli off
         @ 19,15 get mens
         clear gets
         set deli on
         select 6
         do while .t.
            sec=30
            @ 8,55 get pminv10 pict '99'
            read
            if mod(readkey(),256)=12
               sws = 1
               exit
            endif
            if mod(readkey(),256)=36
               do catalogo
               if swc = 0
                  loop
               else
                  pminv10=c1
                  @ 8,55 get pminv10 pict '99'
                  @  2,70 say ltrim(rtrim(co05))
                  clea gets
               endif
            endif            
            set order to 3
            seek str(sec,3,0)+str(pminv10,6,0)
            if found()
               condi=co06
               desdiv=co04
               despa=substr(co04,1,8)
               set deli off
               @ 8,60 get despa
               clear gets
               set deli on
               exit
            else
               mensaje = "ERROR, COND. PAGO NO EXISTE.. [ENTER] PARA CONTINUAR"
               do alerta
               loop
            endif
         enddo
         if sws=1
            return
         endif
         fechav=pminv04+condi
         do while .t.
            set deli off
            @ 22,2 say space(74)
            @19,5 say space(74)
            mens="ALIMENTA LA CLAVE DEL PRODUCTO [99999999]"
            set deli off
            @ 19,20 get mens
            clear gets
            @ 22,3 say "[F1] CATALOGO DE PRODUCTOS"
            do while .t.
               @ reng,2 get psal01 pict '@S8L 99999999'
               read
               if mod(readkey(),256)=12
                  @ 22,2 say space(74)
                  set deli on
                  @ 17,62 get pminv09 pict '999,999,999.99'
                  read
                  tot=subtot+pminv09
                  @ 18,62 get tot pict '999,999,999.99'
                  clear gets
                  wait ""
                  set deli off
                  @ 19,02 say space(74)
                  resp=space(1)
                  @ 19,05 say "SON CORRECTOS LOS DATOS [S/N]" get resp valid resp $"S,N"
                  read
                  save screen to pant1
                  if resp="N" .or. mod(readkey(),256)=12
                     sws=1
                     sw1=1
                     exit
                  else
                     if tot=pminv08
                        do while .t.
                           sino=" "
                           @ 19,2 say space(74)
                           @ 19,05 say "DESEA REALIZAR AFECTACIONES (S/N) " get sino pict "!" valid sino$"S,N"
                           read
                           if mod(readkey(),256)=12
                              loop
                           endif
                           if sino="S" .or. sino="N"
                              exit
                           else
                              loop
                           endif
                        enddo
                        
                        swo=0
                        sw1=0
                        select 1
                        do filblock
                        append blank
                        unlock
                        do regblock
                        replace minv01 with pminv01
                        replace minv02 with pminv02
                        replace minv03 with pminv03
                        replace minv04 with pminv04
                        replace minv05 with pminv05
                        replace minv06 with pminv06
                        replace minv10 with pminv10
                        replace minv08 with pminv08
                        replace minv11 with pminv11
                        replace minv12 with pminv12
                        replace minv14 with cia
                        replace minv15 with div
                        replace minv16 with pven01
                        replace minv18 with sino
                        unlock
                        sele 1
                        do regblock
                        replace minv07 with subtot
                        replace minv09 with pminv09
                        unlock
                        sws=1
                        if sino="S"
                           @ 17,10 to 20,70 clear
                           @ 17,10 to 20,70 double
                           @ 18,18 say "      -----------  UN MOMENTO  ------------"
                           @ 19,18 say "    <<<     REGISTRANDO AFECTACIONES      >>>  "
                           if pminv01="E"
                              do cxp
                           endif
                           ********  <<<<<     TRASPASO DE VARIABLES       >>>>>
                           
                           p06p=cia  && CIA
                           p07p=div  && DIV
                           p03p=pminv04  && FECHA
                           p04p=pminv05  && REFERENCIA
                           cvemod=2  && MODULO DE INVENT
                           tmov=pminv02    && TIPO MOVTO
                           paso1=pminv08     && TOTAL
                           paso2=subtot  && IMPTE S/IVA
                           paso3=pminv09    && IMPTE IVA
                           
                           close data
                           do rutina
                           close data
							select 1
							use minv01 index minv011,minv012
							select 2
							use pinv01  index pinv011,pinv012,pinv013
							select 3
							use inv01 index inv011
							select 4
							use prod01 index prod011
							select 5
							use mpr01 index mpr011,mpr012,mpr013
							select 6
							use conc index conc1,conc2,conc3,conc4
							select 7
							use mcl01 index mcl011,mcl012
							sele 8
							use ami01 index ami011
                        endif
                        restore screen from pame
                        restore screen from invpan
                        exit
                     else
                        save screen to porm
                        @ 10,10 to 15,70 clear
                        @ 10,10 to 15,70
                        @ 12,11 say "   Lo siento, Importe No corresponde con Importe  Factura "
                        @ 13,11 say "             Presione [Enter] para continuar .....        "
                        ? chr(7)
                        do while inkey()=0
                        enddo
                        clear
                        restore screen from porm
                        loop
                     endif
                  endif
                  restore screen from invpan
               endif
               if mod(readkey(),256)=36
                  sele 4
                  do catprod
                  set deli off
                  if swc=0
                     loop
                  else
                     psal01=c1
                     @ reng,2 get psal01 pict '@S8L 99999999'
                     clear gets
                     exit
                  endif
               endif
               exit
            enddo
            if sws=1
               sws=0
               restore screen from pant1
               exit
            endif
            @ 22,2 say space(30)
            @ 22,3 say space(35)
            select 2
            seek pminv05+str(par,2,0)+str(cia,2,0)+div
            if found()
               @ 19,02 say space(74)
               @ 19,20 say "ERROR, ESA PARTIDA YA EXISTE [ENTER]  CONTINUAR..."
               do while inkey()=0
               enddo
               loop
            endif
            select 4
            seek psal01+str(cia,2,0)+div
            if .not. eof()
               @ 19,02 say space(74)
               store prod02 to psal02x
               store substr(prod02,1,20) to psal02
               set deli off
               @ reng,11 get psal02
               clear gets
               set deli on
            else
               @ 19,02 say space(74)
               @ 19,18 say "ERROR PRODUCTO NO EXISTE [ENTER], CONTINUAR..."
               do while inkey()=0
               enddo
               @ 19,02 say space(74)
               loop
            endif
            @ 19,5 say space(74)
            mens="ALIMENTA LA CLAVE DE UNIDAD DE MEDIDA [99]"
            set deli off
            @ 19,20 get mens
            clear gets
            set deli off
            @ 22,2 say space(30)
            @ 22,3 say "[F1] CATALOGO DE UNI/MED"
            do while .t.
               select 6
               sec=3
               @ reng,32 say space(7)
               @ reng,32 get psal03 pict '99'
               read
               if mod(readkey(),256)=12
                  sws = 1
                  exit
               endif
               if mod(readkey(),256)=36
                  do catalogo
                  if swc = 0
                     loop
                  else
                     psal03=c1
                     @ reng,32 get psal03 pict '99'
                     store space(8) to pco05
                     store substr(co05,1,7) to pco05
                     set deli off
                     @ reng,32 get pco05
                     clea gets
                     exit
                  endif
               endif
               set order to 3
               seek str(sec,3,0)+str(psal03,6,0)
               if found()
                  store space(8) to pco05
                  store substr(co05,1,7) to pco05
                  @ reng,32 get pco05
                  clear gets
                  exit
               else
                  mensaje = "ERROR, UNIDAD DE MEDIDA NO EXISTE.. [ENTER] PARA CONTINUAR"
                  do alerta
               endif
            enddo
            if sws=1
               loop
            endif
            do while .t.
               @ 22,2 say space(30)
               @19,5 say space(74)
               mens="ALIMENTA LA CANTIDAD DE DE PRODUCTO EN EXISTENCIA [999999]"
               set deli off
               @ 19,15 get mens
               clear gets
               @ reng,40 get psal04 pict '999999'
               read
               if mod(readkey(),256)=12
                  swy=1
                  exit
               endif
               if psal04=0
                  loop
               else
                  swy=0
                  exit
               endif
            enddo
            if swy=1
               loop
            endif
            do while .t.
               @19,5 say space(74)
               mens="ALIMENTA EL COSTO UNITARIO DEL PRODUCTO [999999.99]"
               set deli off
               @ 19,20 get mens
               clear gets
               @ reng,47 get psal05 pict '999,999,999.99'
               read
               if mod(readkey(),256)=12
                  swy=1
                  exit
               endif
               if psal05=0
                  loop
               else
                  swy=0
                  exit
               endif
            enddo
            if swy=1
               loop
            endif
            @19,5 say space(74)
            mens="IMPORTE TOTAL DEL PRODUCTO [999,999,999.99]"
            set deli off
            @ 19,20 get mens
            clear gets
            psal06=psal04*psal05
            @ reng,62 get psal06 pict '999,999,999.99'
            clear gets
            @19,5 say space(74)
            mens="ESTAN CORRECTOS LOS DATOS [S/N]"
            set deli off
            @ 19,20 get mens
            clear gets
            psal07=" "
            @ reng,77 get psal07 pict '!' valid psal07 $"S/N"
            read
            if psal07="N" .or. mod(readkey(),256)=12
               sw1=1
               loop
            else
               subtot=subtot+psal06
               set deli on
               @ 16,62 get subtot pict '999,999,999.99'
               clear gets
               if pminv01="E"
                  select 2
                  do filblock
                  append blank
                  unlock
                  do regblock
                  replace pin01 with psal01
                  replace pin02 with psal02
                  replace pin04 with psal03
                  replace pin05 with psal04
                  replace pin06 with psal06
                  replace pin03 with pminv02
                  replace pin07 with pminv05
                  replace pin08 with pminv03
                  replace pin09 with par
                  replace pin10 with cia
                  replace pin11 with div
                  replace pin12 with pven01
                  replace pin13 with psal05
                  replace pin14 with psal04
                  replace pin15 with 0
                  replace pin16 with pminv04
                  unlock
                  select 3
                  seek psal01+str(cia,2,0)+div
                  if .not. found()
                     do filblock
                     append blank
                     unlock
                     do regblock
                     replace inv01 with psal01
                     replace inv02 with psal02x
                     replace inv03 with 0
                     replace inv09 with 0
                     replace inv13 with psal03
                     replace inv14 with psal08
                     replace inv15 with cia
                     replace inv16 with div
                     unlock
                  endif
                  store 0 to sal,ent,entx,salx
                  ent=inv04+psal04
                  sal=inv03+ent-inv05
                  entx=inv08+psal06
                  salx=inv07+entx-inv09
                  do regblock
                  replace inv04 with ent
                  replace inv06 with sal
                  replace inv08 with entx
                  replace inv10 with salx
                  unlock
               else
                  if pminv01="S"
                     do invfac
                  endif
               endif
               par=par+1
               reng=reng+1
               if reng>14
                  reng=reng-1
                  scroll 12,2,14,77,1
                  @ 09,01 to 15,78 double
                  @ 11,02 to 11,77 double
                  @ 10,10 to 14,10 double
                  @ 10,31 to 14,31 double
                  @ 10,39 to 14,39 double
                  @ 10,46 to 14,46 double
                  @ 10,61 to 14,61 double
                  @ 10,76 to 14,76 double
               endif
            endif
         enddo
      enddo
      
      
      ***************************************************
      **   CANCELACION DE UNA ENTRADA
      ***************************************************
      
      
   case opcion=2
      sw1=0
      do while .t.
         
         if sw1=0
            store space(60) to pminv02
            store 0 to sw,swc,sws,pminv02,pminv03,pminv07,pminv08,pminv09,pminv10
            store 0 to pminv13
            store space(20) to pminv12
            store space(12) to pminv11
            store space(1) to pminv01
            store space(8) to pminv05,pminv06
            pminv04=date()
            store space(60) to pinv02
            store 0 to sw,swc,sws,pinv03,pinv04,pinv05,pinv06,pinv07,pinv08
            store 0 to pinv09,pinv10,pinv11,pinv12,pinv13,pinv15,tot,MIN02P
            store space(1) to pinv16,pinv01
            pinv14=date()
            store " " to estcon
         endif
         ****INICIO DE PROCESO O CICLO
         @ 4,1 clear to 19,78
      
         @ 5,25 say "CANCELACION DE UNA FACTURA"
         @  7,15 to 14,65 double
         @19,5 say space(74)
         mens="ALIMENTA LA CLAVE DEL MOVIMIENTO [1 ESP.] REALIZADO"
         set deli off
         @ 19,20 get mens
         clear gets
         set deli on
         @ 22,3 say "[F1] CATALOGO DE MOVIMIENTO"
         do while .t.
            select 6
            sec=4
            @  9,20 say "CVE. MOVIMIENTO:"
            @  9,38 get pminv01 pict "!"
            read
            save screen to pancan
            if mod(readkey(),256)=12
               sws=1
               restore screen from pan101
               return
            endif
            if mod(readkey(),256)=36
               do catalogo
               if swc = 0
                  loop
               else
                  pminv01=clave
                  des=co04
                  des1=substr(des,1,7)
                  @ 9,38 get pminv01 pict '!'
                  set deli off
                  @ 9,50 get des1
                  clear gets
                  set deli on
                  exit
               endif
            endif
            set order to 2
            seek str(sec,3,0)+pminv01
            if found()
               des=co04
               des1=substr(des,1,7)
               set deli off
               @ 9,50 get des1
               clear gets
               set deli on
               exit
            else
               mensaje = "ERROR, MOVIMIENTO NO EXISTE.. [ENTER] PARA CONTINUAR"
               do alerta
            endif
         enddo
         if sws=1
            sws=0
            loop
         endif
         @ 22,2 say space(30)
         @19,5 say space(74)
         mens="ALIMENTA EL TIPO DEL MOVIMIENTO [99] REALIZADO"
         set deli off
         @ 19,20 get mens
         clear gets
         set deli on
         @ 22,3 say "[F1] CATALOGO DE TIPO MOV."
         do while .t.
            select 6
            sec=5
            @  10,20 say "TIPO MOVTO:"
            @  10,38 get pminv02 pict '99'
            read
            if mod(readkey(),256)=12
               sws = 1
               exit
            endif
            if mod(readkey(),256)=36
               do catalogo
               if swc = 0
                  loop
               else
                  pminv02=c1
                  @ 10,38 get pminv02 pict '99'
                  store space(8) to pco05
                  store substr(co05,1,7) to pco05
                  set deli off
                  clea gets
               endif
            endif
            set order to 3
            seek str(sec,3,0)+str(pminv02,6,0)
            if found()
               store space(8) to pco05
               store substr(co05,1,7) to pco05
               store substr(co04,1,8) to mpco05
               set deli off
               @ 10,50 get mpco05
               clear gets
               set deli on
               exit
            else
               mensaje = "ERROR, TIPO DE MOV.  NO EXISTE.. [ENTER] PARA CONTINUAR"
               do alerta
            endif
         enddo
         if sws=1
            return
         endif
         @ 22,2 SAY SPACE(76)
         @ 11,20 say "No. FACTURA: "
         @ 11,38 get pminv05
         read
         if mod(readkey(),256)=12
            close data
            return
         endif
         
         @ 22,2 say space(30)
         @ 19,5 say space(74)
         mens="ALIMENTA EL TIPO DEL MOVIMIENTO [99] A REALIZAR"
         set deli off
         @ 19,20 get mens
         clear gets
         set deli on
         @ 22,3 say "[F1] CATALOGO DE TIPO MOV."
         do while .t.
            select 6
            sec=5
            @  12,20 say "TIPO MOVTO:"
            @  12,38 get min02p pict '99'
            read
            if mod(readkey(),256)=12
               sws = 1
               exit
            endif
            if mod(readkey(),256)=36
               do catalogo
               if swc = 0
                  loop
               else
                  min02p=c1
                  @ 12,38 get min02p pict '99'
                  store space(8) to co05p
                  store substr(co05,1,7) to co05p
                  set deli off
                  clea gets
               endif
            endif
            set order to 3
            seek str(sec,3,0)+str(min02p,6,0)
            if found()
               store space(8) to co05p,pco05m
               store substr(co05,1,7) to co05p
               store substr(co04,1,8) to pco05m
               set deli off
               @ 12,50 get pco05m
               clear gets
               set deli on
               exit
            else
               mensaje = "ERROR, TIPO DE MOV.  NO EXISTE.. [ENTER] PARA CONTINUAR"
               do alerta
            endif
         enddo
         if sws=1
            return
         endif
         
         @ 22,2 say space(30)
         save screen to factura
         sele 1
         locate for pminv05=minv05 .and. pminv01=minv01 .and. pminv02=minv02 .and. cia=minv14 .and. div=minv15         
         if found()
            if minv17="C"
               save screen to porm
               @ 10,10 to 15,70 clear
               @ 10,10 to 15,70
               @ 12,11 say "         Lo siento, Documento   C a n c e l a d o          "
               @ 13,11 say "             Presione [Enter] para continuar .....         "
               ? chr(7)
               do while inkey()=0
               enddo
               clear
               sw1=1
               restore screen from porm
               loop
            endif
            pminv03=minv03
            pminv04=minv04
            pminv05=minv05
            pminv06=minv06
            pminv07=minv07
            pminv08=minv08
            pminv09=minv09
            pminv10=minv10
            pminv11=minv11
            pminv12=minv12
            pminv13=minv13
            pminv16=minv16
            estcon=minv18
         else
            save screen to porm
            @ 10,10 to 15,70 clear
            @ 10,10 to 15,70
            @ 12,11 say "         Lo siento, No existe numero de Documento          "
            @ 13,11 say "             Presione [Enter] para continuar .....         "
            ? chr(7)
            do while inkey()=0
            enddo
            clear
            sw1=1
            restore screen from porm
            loop
         endif
         
         
         @ 4,2 clear to 19,78
         reng=12
         par=1
         @ 4,2 say "MOVIMIENTO"
         @ 5,2 say "TIPO"
         @ 6,2 say "FECHA"
         @ 7,2 say "PROVEEDOR"
         @ 8,2 say "ORDEN DE COMPRA"
         @ 4,40 say "PEDIMENTO"
         @ 5,40 say "ADUANA"
         @ 6,40 say "NO. REM/FACT."
         @ 7,40 say "IMPORTE FACT."
         @ 8,40 say "CON. DE PAGO"
         @ 16,47 say "SUBTOTAL"
         @ 17,47 say "I.V.A.  "
         @ 18,47 say "TOTAL   "
         @ 09,01 to 15,78 double
         @ 11,02 to 11,77 double
         @ 10,10 to 14,10 double
         @ 10,31 to 14,31 double
         @ 10,39 to 14,39 double
         @ 10,46 to 14,46 double
         @ 10,61 to 14,61 double
         @ 10,76 to 14,76 double
         @ 10,2  say "PRODUCTO"
         @ 10,15 say "DESCRIPCION"
         @ 10,33 say "U/MED"
         @ 10,41 say "CANT."
         @ 10,47 say "COSTO UNITARIO"
         @ 10,65 say "IMPORTE"
         @ 10,77 say "S"
         
         @ 4,20 get pminv01 pict "!"
         @ 4,20 get pminv01 pict '!'
         @ 5,20 get pminv02 pict '99'
         @ 5,20 get pminv02 pict '99'
         @ 6,20 get pminv04 pict '@D'
         if pminv01="E"
            @ 7,20 get pminv03 pict '999999999999'
         else
            @ 7,20 get pminv16 pict "@!18X"
         endif
         @ 8,20 get pminv06
         @ 4,55 get pminv11
         @ 5,55 get pminv12
         @ 6,55 get pminv05
         @ 7,55 get pminv08 pict '99,999,999.99'
         @ 8,55 get pminv10 pict '99'
         clear gets
         set deli off
         sele 2
         locate for pminv05=pin07 .and. cia=pin10 .and. div=pin11 .and. pminv02=pin03
         do while pminv05=pin07 .and. cia=pin10 .and. div=pin11 .and. pminv02=pin03
            @ reng,2  get pin01 pict '@S8L 99999999'
            pin02z=substr(pin02,1,20)
            @ reng,11 get pin02z
            psal03=pin04
            sele 6
            sec=3
            set order to 3
            seek str(sec,3,0)+str(psal03,6,0)
            if found()
               store space(8) to pco05
               store substr(co05,1,7) to pco05
               @ reng,32 get pco05
               clear gets
            else
               @ reng,32 get psal03 pict '99'
            endif
            sele 2
            @ reng,40 get pin05 pict '999999'
            @ reng,47 get pin13 pict '999,999,999.99'
            @ reng,62 get pin06 pict '999,999,999.99'
            clear gets
            skip
            par=par+1
            reng=reng+1
            if reng>14
               reng=reng-1
               scroll 12,2,14,77,1
               @ 09,01 to 15,78 double
               @ 11,02 to 11,77 double
               @ 10,10 to 14,10 double
               @ 10,31 to 14,31 double
               @ 10,39 to 14,39 double
               @ 10,46 to 14,46 double
               @ 10,61 to 14,61 double
               @ 10,76 to 14,76 double
            endif
         enddo
         set deli on
         @ 16,62 get pminv07 pict '999,999,999.99'
         @ 17,62 get pminv09 pict '999,999,999.99'
         @ 18,62 get pminv08 pict '999,999,999.99'
         clear gets
         @ 19,02 say space(74)
         resp=space(1)
         @ 19,05 say "DESEA CANCELAR EL DOCUMENTO [S/N]" get resp valid resp $"S,N"
         read
         if resp="N" .or. mod(readkey(),256)=12
            sw1=1
            restore screen from factura
            loop
         else            
            if pminv01="E"
               sele 9
               LOCATE FOR CIA=CXP19 .AND. DIV=CXP18 .AND. pminv05=CXP03 .AND. pminv03=CXP01 .AND. CXP04=1 .AND. CXP16<>0
			   IF FOUND()
			      save screen to porm
			      @ 10,10 to 15,70 clear
			      @ 10,10 to 15,70
			      @ 12,11 say "  Lo siento, Documento No se puede Cancelar existen Pagos  "
			      @ 13,11 say "             Presione [Enter] para continuar .....         "
			      ? chr(7)
			      do while inkey()=0
			      enddo
			      sw1=1
			      restore screen from porm
			      loop
    		   ENDIF       		   
            endif
            @ 17,10 to 21,70 clear
            @ 17,10 to 21,70 double
            @ 19,18 say "    <<<     C A N C E L A C I O N         >>>  "
            sw1=0

            select 1
            do regblock
            replace minv17 with "C"
            unlock
            if pminv01="E"              
               sele 2
               locate for pminv05=pin07 .and. cia=pin10 .and. div=pin11 .and. pminv02=pin03
               do while  pminv05=pin07 .and. cia=pin10 .and. div=pin11 .and. pminv02=pin03
                  store 0 to psal01,cant,psal06
                  psal01=pin01
                  cant=pin05
                  psal06=pin06
                  select 3
                  seek psal01+str(cia,2,0)+div
                  if found()
                     store 0 to sal,ent,entx,salx
                     ent=inv04-cant
                     sal=inv03+ent-inv05
                     entx=inv08-psal06
                     salx=inv07+entx-inv09
                     do regblock
                     replace inv04 with ent
                     replace inv06 with sal
                     replace inv08 with entx
                     replace inv10 with salx
                     unlock
                  endif
                  sele 2
                  skip
               enddo
               if estcon="S"
	               do cxp01	               
	           endif
            else
               ***** VENTAS
               pven01=pminv16
               pven03=pminv05
               do invx
            endif
            if estcon="S"            
               ********  <<<<<     TRASPASO DE VARIABLES       >>>>>
                           
               p06p=cia  && CIA
               p07p=div  && DIV
               p03p=pminv04  && FECHA
               p04p=pminv05  && REFERENCIA
               cvemod=2  && MODULO DE INVENT
               tmov=min02p    && TIPO MOVTO
               paso1=pminv08     && TOTAL
               paso2=pminv07  && IMPTE S/IVA
               paso3=pminv09    && IMPTE IVA
               close data
               do rutina
               close data
    			select 1
				use minv01 index minv011,minv012
				select 2
				use pinv01  index pinv011,pinv012,pinv013
				select 3
				use inv01 index inv011
				select 4
				use prod01 index prod011
				select 5
				use mpr01 index mpr011,mpr012,mpr013
				select 6
				use conc index conc1,conc2,conc3,conc4
				select 7
				use mcl01 index mcl011,mcl012
				sele 8
				use ami01 index ami011
            endif
            restore screen from pancan
         endif
      enddo
   endcase
enddo
close database
close all
return
*: EOF: VAINV201.PRG
