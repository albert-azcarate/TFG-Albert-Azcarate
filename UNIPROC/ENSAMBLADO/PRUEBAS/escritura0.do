onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -divider {PROCESADOR produc./consum.}
add wave -noupdate /prueba_ensamblado/ciclo
add wave -noupdate /prueba_ensamblado/reloj
add wave -noupdate -divider Productor
add wave -noupdate -radix unsigned -childformat {{/prueba_ensamblado/peticion.acc -radix unsigned} {/prueba_ensamblado/peticion.dir -radix unsigned} {/prueba_ensamblado/peticion.esc -radix unsigned} {/prueba_ensamblado/peticion.ini -radix unsigned} {/prueba_ensamblado/peticion.DE -radix unsigned}} -subitemconfig {/prueba_ensamblado/peticion.acc {-height 16 -radix unsigned} /prueba_ensamblado/peticion.dir {-height 16 -radix unsigned} /prueba_ensamblado/peticion.esc {-height 16 -radix unsigned} /prueba_ensamblado/peticion.ini {-height 16 -radix unsigned} /prueba_ensamblado/peticion.DE {-height 16 -radix unsigned}} /prueba_ensamblado/peticion
add wave -noupdate /prueba_ensamblado/pet_listo
add wave -noupdate -divider Consumidor
add wave -noupdate -radix unsigned -childformat {{/prueba_ensamblado/respuesta.DL -radix unsigned} {/prueba_ensamblado/respuesta.BL -radix unsigned} {/prueba_ensamblado/respuesta.dir_rec -radix unsigned} {/prueba_ensamblado/respuesta.val -radix unsigned}} -subitemconfig {/prueba_ensamblado/respuesta.DL {-height 16 -radix unsigned} /prueba_ensamblado/respuesta.BL {-height 15 -radix unsigned} /prueba_ensamblado/respuesta.dir_rec {-height 15 -radix unsigned} /prueba_ensamblado/respuesta.val {-height 16 -radix unsigned}} /prueba_ensamblado/respuesta
add wave -noupdate -divider {PETICION en cache}
add wave -noupdate /prueba_ensamblado/ensa_ca_mem/cache/cach/inter_Pr_ca/pe
add wave -noupdate -radix unsigned -childformat {{/prueba_ensamblado/ensa_ca_mem/cache/cach/cache_sin/peticion.acc -radix unsigned} {/prueba_ensamblado/ensa_ca_mem/cache/cach/cache_sin/peticion.dir -radix unsigned} {/prueba_ensamblado/ensa_ca_mem/cache/cach/cache_sin/peticion.esc -radix unsigned} {/prueba_ensamblado/ensa_ca_mem/cache/cach/cache_sin/peticion.ini -radix unsigned} {/prueba_ensamblado/ensa_ca_mem/cache/cach/cache_sin/peticion.DE -radix unsigned}} -subitemconfig {/prueba_ensamblado/ensa_ca_mem/cache/cach/cache_sin/peticion.acc {-radix unsigned} /prueba_ensamblado/ensa_ca_mem/cache/cach/cache_sin/peticion.dir {-radix unsigned} /prueba_ensamblado/ensa_ca_mem/cache/cach/cache_sin/peticion.esc {-radix unsigned} /prueba_ensamblado/ensa_ca_mem/cache/cach/cache_sin/peticion.ini {-radix unsigned} /prueba_ensamblado/ensa_ca_mem/cache/cach/cache_sin/peticion.DE {-radix unsigned}} /prueba_ensamblado/ensa_ca_mem/cache/cach/cache_sin/peticion
add wave -noupdate -divider {CAMPOS CACHE}
add wave -noupdate -label {Etiqueta Bloque 0} -radix hexadecimal /prueba_ensamblado/ensa_ca_mem/cache/cach/cache_sin/camino/etiq/ET_Mem/ET_mem(0)
add wave -noupdate -label {Estado Bloque 0} -radix hexadecimal /prueba_ensamblado/ensa_ca_mem/cache/cach/cache_sin/camino/estado/EST_mem(0)
add wave -noupdate -label {Dato Bloque 0} -radix hexadecimal -childformat {{/prueba_ensamblado/ensa_ca_mem/cache/cach/cache_sin/camino/datos_ca/DAT_Mem/DAT_mem(0)(15) -radix hexadecimal} {/prueba_ensamblado/ensa_ca_mem/cache/cach/cache_sin/camino/datos_ca/DAT_Mem/DAT_mem(0)(14) -radix hexadecimal} {/prueba_ensamblado/ensa_ca_mem/cache/cach/cache_sin/camino/datos_ca/DAT_Mem/DAT_mem(0)(13) -radix hexadecimal} {/prueba_ensamblado/ensa_ca_mem/cache/cach/cache_sin/camino/datos_ca/DAT_Mem/DAT_mem(0)(12) -radix hexadecimal} {/prueba_ensamblado/ensa_ca_mem/cache/cach/cache_sin/camino/datos_ca/DAT_Mem/DAT_mem(0)(11) -radix hexadecimal} {/prueba_ensamblado/ensa_ca_mem/cache/cach/cache_sin/camino/datos_ca/DAT_Mem/DAT_mem(0)(10) -radix hexadecimal} {/prueba_ensamblado/ensa_ca_mem/cache/cach/cache_sin/camino/datos_ca/DAT_Mem/DAT_mem(0)(9) -radix hexadecimal} {/prueba_ensamblado/ensa_ca_mem/cache/cach/cache_sin/camino/datos_ca/DAT_Mem/DAT_mem(0)(8) -radix hexadecimal} {/prueba_ensamblado/ensa_ca_mem/cache/cach/cache_sin/camino/datos_ca/DAT_Mem/DAT_mem(0)(7) -radix hexadecimal} {/prueba_ensamblado/ensa_ca_mem/cache/cach/cache_sin/camino/datos_ca/DAT_Mem/DAT_mem(0)(6) -radix hexadecimal} {/prueba_ensamblado/ensa_ca_mem/cache/cach/cache_sin/camino/datos_ca/DAT_Mem/DAT_mem(0)(5) -radix hexadecimal} {/prueba_ensamblado/ensa_ca_mem/cache/cach/cache_sin/camino/datos_ca/DAT_Mem/DAT_mem(0)(4) -radix hexadecimal} {/prueba_ensamblado/ensa_ca_mem/cache/cach/cache_sin/camino/datos_ca/DAT_Mem/DAT_mem(0)(3) -radix hexadecimal} {/prueba_ensamblado/ensa_ca_mem/cache/cach/cache_sin/camino/datos_ca/DAT_Mem/DAT_mem(0)(2) -radix hexadecimal} {/prueba_ensamblado/ensa_ca_mem/cache/cach/cache_sin/camino/datos_ca/DAT_Mem/DAT_mem(0)(1) -radix hexadecimal} {/prueba_ensamblado/ensa_ca_mem/cache/cach/cache_sin/camino/datos_ca/DAT_Mem/DAT_mem(0)(0) -radix hexadecimal}} -subitemconfig {/prueba_ensamblado/ensa_ca_mem/cache/cach/cache_sin/camino/datos_ca/DAT_Mem/DAT_mem(0)(15) {-radix hexadecimal} /prueba_ensamblado/ensa_ca_mem/cache/cach/cache_sin/camino/datos_ca/DAT_Mem/DAT_mem(0)(14) {-radix hexadecimal} /prueba_ensamblado/ensa_ca_mem/cache/cach/cache_sin/camino/datos_ca/DAT_Mem/DAT_mem(0)(13) {-radix hexadecimal} /prueba_ensamblado/ensa_ca_mem/cache/cach/cache_sin/camino/datos_ca/DAT_Mem/DAT_mem(0)(12) {-radix hexadecimal} /prueba_ensamblado/ensa_ca_mem/cache/cach/cache_sin/camino/datos_ca/DAT_Mem/DAT_mem(0)(11) {-radix hexadecimal} /prueba_ensamblado/ensa_ca_mem/cache/cach/cache_sin/camino/datos_ca/DAT_Mem/DAT_mem(0)(10) {-radix hexadecimal} /prueba_ensamblado/ensa_ca_mem/cache/cach/cache_sin/camino/datos_ca/DAT_Mem/DAT_mem(0)(9) {-radix hexadecimal} /prueba_ensamblado/ensa_ca_mem/cache/cach/cache_sin/camino/datos_ca/DAT_Mem/DAT_mem(0)(8) {-radix hexadecimal} /prueba_ensamblado/ensa_ca_mem/cache/cach/cache_sin/camino/datos_ca/DAT_Mem/DAT_mem(0)(7) {-radix hexadecimal} /prueba_ensamblado/ensa_ca_mem/cache/cach/cache_sin/camino/datos_ca/DAT_Mem/DAT_mem(0)(6) {-radix hexadecimal} /prueba_ensamblado/ensa_ca_mem/cache/cach/cache_sin/camino/datos_ca/DAT_Mem/DAT_mem(0)(5) {-radix hexadecimal} /prueba_ensamblado/ensa_ca_mem/cache/cach/cache_sin/camino/datos_ca/DAT_Mem/DAT_mem(0)(4) {-radix hexadecimal} /prueba_ensamblado/ensa_ca_mem/cache/cach/cache_sin/camino/datos_ca/DAT_Mem/DAT_mem(0)(3) {-radix hexadecimal} /prueba_ensamblado/ensa_ca_mem/cache/cach/cache_sin/camino/datos_ca/DAT_Mem/DAT_mem(0)(2) {-radix hexadecimal} /prueba_ensamblado/ensa_ca_mem/cache/cach/cache_sin/camino/datos_ca/DAT_Mem/DAT_mem(0)(1) {-radix hexadecimal} /prueba_ensamblado/ensa_ca_mem/cache/cach/cache_sin/camino/datos_ca/DAT_Mem/DAT_mem(0)(0) {-radix hexadecimal}} /prueba_ensamblado/ensa_ca_mem/cache/cach/cache_sin/camino/datos_ca/DAT_Mem/DAT_mem(0)
add wave -noupdate -divider {CONTROLADOR de cache}
add wave -noupdate -divider {Controlador estados}
add wave -noupdate /prueba_ensamblado/ensa_ca_mem/cache/cach/cache_sin/contro/derechos_acceso
add wave -noupdate /prueba_ensamblado/ensa_ca_mem/cache/cach/cache_sin/contro/estado
add wave -noupdate /prueba_ensamblado/ensa_ca_mem/cache/cach/cache_sin/contro/prxestado
add wave -noupdate -divider {Petición y Respuesta de Memoria}
add wave -noupdate -label {Petición a Memoria} -radix unsigned /prueba_ensamblado/ensa_ca_mem/cache/cach/cache_sin/contro/pet_m.m_pet
add wave -noupdate -label {Dirección de petición} -radix unsigned /prueba_ensamblado/ensa_ca_mem/cache/inter_Pr_BUS_IN/mpet_info_e.dir
add wave -noupdate -label Pt/PtX /prueba_ensamblado/ensa_ca_mem/cache/inter_Pr_BUS_CON/mpet_cntl_e.mexp
add wave -noupdate -label {Respuesta de Memoria Válida} -radix unsigned /prueba_ensamblado/ensa_ca_mem/cache/cach/cache_sin/contro/resp_m.m_val
add wave -noupdate -divider {Respuesta al Procesador}
add wave -noupdate -label {Respuesta de la Cache} -radix unsigned -childformat {{/prueba_ensamblado/ensa_ca_mem/cache/cach/cache_sin/contro/resp.listo -radix unsigned} {/prueba_ensamblado/ensa_ca_mem/cache/cach/cache_sin/contro/resp.finalizada -radix unsigned}} -expand -subitemconfig {/prueba_ensamblado/ensa_ca_mem/cache/cach/cache_sin/contro/resp.listo {-height 16 -radix unsigned} /prueba_ensamblado/ensa_ca_mem/cache/cach/cache_sin/contro/resp.finalizada {-height 16 -radix unsigned}} /prueba_ensamblado/ensa_ca_mem/cache/cach/cache_sin/contro/resp
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Petición de Escritura} {883000 ps} 1} {{Inicio petición a Memoria} {1082000 ps} 1} {{Respuesta de Memoria con el Bloque} {1562000 ps} 1} {{Final de Escritura} {1805000 ps} 1} {{Petición de Escritura 2} {1880000 ps} 1} {{Final de Escritura 2} {2045000 ps} 1}
quietly wave cursor active 6
configure wave -namecolwidth 310
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 40000
configure wave -gridperiod 80000
configure wave -griddelta 20
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {778178 ps} {2122822 ps}
