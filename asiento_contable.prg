* clave de movimiento  valor del movimiento  indica si modifica el movimiento  de que sistema es
parameter wsistema,wclave,wvalor,wmodificacion
*WCLAVE  =SUBSTR(WCLAVE,1,10)
*WSISTEMA=SUBSTR(WSISTEMA,1,10)
      sele 0
      use cnt_poliza
      SET ORDER TO poliza
      SEEK DTOC(ffffff)
      xpoliza = 0
      DO WHILE fecha = ffffff .and. .not. EOF()
         xpoliza = poliza
         SKIP
      ENDDO
      xpoliza = xpoliza + 1          
      sele 0
      use cnt_guia_contable
      set order to clave
      yiva = 0
      wtipo = "Diario"
      seek wsistema+wclave
IF EOF()
*  =MESSAGEBOX(wsistema+wclave+'X fin de archivo')
ENDIF
         do while sistema = wsistema .and. clave = wclave .and. .not. eof()
            wmovimiento = movimiento
            wcuenta     = cuenta
            wscuenta    = scuenta
            wsscuenta   = sscuenta
            wssscuenta  = ssscuenta
            wiva        = iva
            xmodifica   = SPACE(0)
            if wmodificacion = .t.
               xmodifica = 'Modificado'
               do case
                 case wmovimiento = "+"
                  wmovimiento = "-"
                 case wmovimiento = "-"
                  wmovimiento = "+"
                endcase  
            endif    
            sele cnt_poliza
            append blank
            replace cuenta     with wcuenta
            replace scuenta    with wscuenta
            replace sscuenta   with wsscuenta
            replace ssscuenta  with wssscuenta
            replace poliza     with xpoliza
            replace movimiento with wmovimiento
            replace tipo       with wtipo
            replace concepto   with "Movimiento del Dia "+xmodifica
            replace referencia with wclave
            replace fecha      with ffffff
            if wiva 
               replace valor      with yiva
            else
               replace valor      with wvalor
            endif                         
            sele cnt_guia_contable
            skip
         enddo   
         sele cnt_guia_contable
         use
         sele cnt_poliza
         use
