public ffffff,xusuario,xterminal,xnivel,xnofecha,xempresa,xpathrepo,xpathpaso,xpathopera,xpathcomun
USE conse
store date() to ffffff
ffffff = fechac
xusuario='luis      '
xterminal='Z1234567'
xempresa =nombre
xnivel=9
xnofecha = .t.
yorigen = ' '

set date to dmy
store 0 to xclavei,xclavef
store FFFFFF to xFECHAI
store FFFFFF to xFECHAF
store "xx" to xnombrei,xnombref
xpathpaso="\sisadm_temporal"
xpathrepo="\sisadm_reportes"
xpathopera="\sisadm"
xpathcomun="\sisadm_comunes"

xpathpaso= "\sisadm135"
xpathrepo= "\sisadm135"
xpathopera="\sisadm135"
xpathcomun="\sisadm135"
set path to &xpathcomun,&xpathopera
_ASCIIROWS = 60
_ASCIICOLS = 300
set safety off
set dele on
set century on
set exact off
SET EXCLUSIVE off
set talk on

close table all
