onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -divider {PROCESADOR produc./consum.}
add wave -noupdate /prueba_ensamblado/ciclo
add wave -noupdate /prueba_ensamblado/reloj
add wave -noupdate -divider Productor
add wave -noupdate -radix unsigned -childformat {{/prueba_ensamblado/peticion.acc -radix unsigned} {/prueba_ensamblado/peticion.dir -radix unsigned} {/prueba_ensamblado/peticion.esc -radix unsigned} {/prueba_ensamblado/peticion.ini -radix unsigned} {/prueba_ensamblado/peticion.DE -radix unsigned}} -subitemconfig {/prueba_ensamblado/peticion.acc {-height 18 -radix unsigned} /prueba_ensamblado/peticion.dir {-height 18 -radix unsigned} /prueba_ensamblado/peticion.esc {-height 18 -radix unsigned} /prueba_ensamblado/peticion.ini {-height 18 -radix unsigned} /prueba_ensamblado/peticion.DE {-height 18 -radix unsigned}} /prueba_ensamblado/peticion
add wave -noupdate /prueba_ensamblado/pet_listo
add wave -noupdate -divider Consumidor
add wave -noupdate -label {Dato Leído} -radix unsigned /prueba_ensamblado/respuesta.DL
add wave -noupdate -label {Dato válido} -radix unsigned /prueba_ensamblado/ensa_ca_mem/cache/cach/cache_sin/contro/resp.finalizada
add wave -noupdate -divider {PETICION en cache}
add wave -noupdate /prueba_ensamblado/ensa_ca_mem/cache/cach/inter_Pr_ca/pe
add wave -noupdate -radix unsigned -childformat {{/prueba_ensamblado/ensa_ca_mem/cache/cach/cache_sin/peticion.acc -radix unsigned} {/prueba_ensamblado/ensa_ca_mem/cache/cach/cache_sin/peticion.dir -radix unsigned} {/prueba_ensamblado/ensa_ca_mem/cache/cach/cache_sin/peticion.esc -radix unsigned} {/prueba_ensamblado/ensa_ca_mem/cache/cach/cache_sin/peticion.ini -radix unsigned} {/prueba_ensamblado/ensa_ca_mem/cache/cach/cache_sin/peticion.DE -radix unsigned}} -subitemconfig {/prueba_ensamblado/ensa_ca_mem/cache/cach/cache_sin/peticion.acc {-height 18 -radix unsigned} /prueba_ensamblado/ensa_ca_mem/cache/cach/cache_sin/peticion.dir {-height 18 -radix unsigned} /prueba_ensamblado/ensa_ca_mem/cache/cach/cache_sin/peticion.esc {-height 18 -radix unsigned} /prueba_ensamblado/ensa_ca_mem/cache/cach/cache_sin/peticion.ini {-height 18 -radix unsigned} /prueba_ensamblado/ensa_ca_mem/cache/cach/cache_sin/peticion.DE {-height 18 -radix unsigned}} /prueba_ensamblado/ensa_ca_mem/cache/cach/cache_sin/peticion
add wave -noupdate -divider {CAMPOS CACHE}
add wave -noupdate -label {Etiqueta Bloque 0} -radix hexadecimal /prueba_ensamblado/ensa_ca_mem/cache/cach/cache_sin/camino/etiq/ET_Mem/ET_mem(0)
add wave -noupdate -label {Estado Bloque 0} -radix binary /prueba_ensamblado/ensa_ca_mem/cache/cach/cache_sin/camino/estado/EST_mem(0)
add wave -noupdate -label {Dato Bloque 0} -radix hexadecimal -childformat {{/prueba_ensamblado/ensa_ca_mem/cache/cach/cache_sin/camino/datos_ca/DAT_Mem/DAT_mem(0)(15) -radix hexadecimal} {/prueba_ensamblado/ensa_ca_mem/cache/cach/cache_sin/camino/datos_ca/DAT_Mem/DAT_mem(0)(14) -radix hexadecimal} {/prueba_ensamblado/ensa_ca_mem/cache/cach/cache_sin/camino/datos_ca/DAT_Mem/DAT_mem(0)(13) -radix hexadecimal} {/prueba_ensamblado/ensa_ca_mem/cache/cach/cache_sin/camino/datos_ca/DAT_Mem/DAT_mem(0)(12) -radix hexadecimal} {/prueba_ensamblado/ensa_ca_mem/cache/cach/cache_sin/camino/datos_ca/DAT_Mem/DAT_mem(0)(11) -radix hexadecimal} {/prueba_ensamblado/ensa_ca_mem/cache/cach/cache_sin/camino/datos_ca/DAT_Mem/DAT_mem(0)(10) -radix hexadecimal} {/prueba_ensamblado/ensa_ca_mem/cache/cach/cache_sin/camino/datos_ca/DAT_Mem/DAT_mem(0)(9) -radix hexadecimal} {/prueba_ensamblado/ensa_ca_mem/cache/cach/cache_sin/camino/datos_ca/DAT_Mem/DAT_mem(0)(8) -radix hexadecimal} {/prueba_ensamblado/ensa_ca_mem/cache/cach/cache_sin/camino/datos_ca/DAT_Mem/DAT_mem(0)(7) -radix hexadecimal} {/prueba_ensamblado/ensa_ca_mem/cache/cach/cache_sin/camino/datos_ca/DAT_Mem/DAT_mem(0)(6) -radix hexadecimal} {/prueba_ensamblado/ensa_ca_mem/cache/cach/cache_sin/camino/datos_ca/DAT_Mem/DAT_mem(0)(5) -radix hexadecimal} {/prueba_ensamblado/ensa_ca_mem/cache/cach/cache_sin/camino/datos_ca/DAT_Mem/DAT_mem(0)(4) -radix hexadecimal} {/prueba_ensamblado/ensa_ca_mem/cache/cach/cache_sin/camino/datos_ca/DAT_Mem/DAT_mem(0)(3) -radix hexadecimal} {/prueba_ensamblado/ensa_ca_mem/cache/cach/cache_sin/camino/datos_ca/DAT_Mem/DAT_mem(0)(2) -radix hexadecimal} {/prueba_ensamblado/ensa_ca_mem/cache/cach/cache_sin/camino/datos_ca/DAT_Mem/DAT_mem(0)(1) -radix hexadecimal} {/prueba_ensamblado/ensa_ca_mem/cache/cach/cache_sin/camino/datos_ca/DAT_Mem/DAT_mem(0)(0) -radix hexadecimal}} -subitemconfig {/prueba_ensamblado/ensa_ca_mem/cache/cach/cache_sin/camino/datos_ca/DAT_Mem/DAT_mem(0)(15) {-height 18 -radix hexadecimal} /prueba_ensamblado/ensa_ca_mem/cache/cach/cache_sin/camino/datos_ca/DAT_Mem/DAT_mem(0)(14) {-height 18 -radix hexadecimal} /prueba_ensamblado/ensa_ca_mem/cache/cach/cache_sin/camino/datos_ca/DAT_Mem/DAT_mem(0)(13) {-height 18 -radix hexadecimal} /prueba_ensamblado/ensa_ca_mem/cache/cach/cache_sin/camino/datos_ca/DAT_Mem/DAT_mem(0)(12) {-height 18 -radix hexadecimal} /prueba_ensamblado/ensa_ca_mem/cache/cach/cache_sin/camino/datos_ca/DAT_Mem/DAT_mem(0)(11) {-height 18 -radix hexadecimal} /prueba_ensamblado/ensa_ca_mem/cache/cach/cache_sin/camino/datos_ca/DAT_Mem/DAT_mem(0)(10) {-height 18 -radix hexadecimal} /prueba_ensamblado/ensa_ca_mem/cache/cach/cache_sin/camino/datos_ca/DAT_Mem/DAT_mem(0)(9) {-height 18 -radix hexadecimal} /prueba_ensamblado/ensa_ca_mem/cache/cach/cache_sin/camino/datos_ca/DAT_Mem/DAT_mem(0)(8) {-height 18 -radix hexadecimal} /prueba_ensamblado/ensa_ca_mem/cache/cach/cache_sin/camino/datos_ca/DAT_Mem/DAT_mem(0)(7) {-height 18 -radix hexadecimal} /prueba_ensamblado/ensa_ca_mem/cache/cach/cache_sin/camino/datos_ca/DAT_Mem/DAT_mem(0)(6) {-height 18 -radix hexadecimal} /prueba_ensamblado/ensa_ca_mem/cache/cach/cache_sin/camino/datos_ca/DAT_Mem/DAT_mem(0)(5) {-height 18 -radix hexadecimal} /prueba_ensamblado/ensa_ca_mem/cache/cach/cache_sin/camino/datos_ca/DAT_Mem/DAT_mem(0)(4) {-height 18 -radix hexadecimal} /prueba_ensamblado/ensa_ca_mem/cache/cach/cache_sin/camino/datos_ca/DAT_Mem/DAT_mem(0)(3) {-height 18 -radix hexadecimal} /prueba_ensamblado/ensa_ca_mem/cache/cach/cache_sin/camino/datos_ca/DAT_Mem/DAT_mem(0)(2) {-height 18 -radix hexadecimal} /prueba_ensamblado/ensa_ca_mem/cache/cach/cache_sin/camino/datos_ca/DAT_Mem/DAT_mem(0)(1) {-height 18 -radix hexadecimal} /prueba_ensamblado/ensa_ca_mem/cache/cach/cache_sin/camino/datos_ca/DAT_Mem/DAT_mem(0)(0) {-height 18 -radix hexadecimal}} /prueba_ensamblado/ensa_ca_mem/cache/cach/cache_sin/camino/datos_ca/DAT_Mem/DAT_mem(0)
add wave -noupdate -divider {CONTROLADOR de cache}
add wave -noupdate -divider {Controlador estados}
add wave -noupdate /prueba_ensamblado/ensa_ca_mem/cache/cach/cache_sin/contro/derechos_acceso
add wave -noupdate /prueba_ensamblado/ensa_ca_mem/cache/cach/cache_sin/contro/estado
add wave -noupdate /prueba_ensamblado/ensa_ca_mem/cache/cach/cache_sin/contro/prxestado
add wave -noupdate -divider {Petición y Respuesta de Memoria}
add wave -noupdate -label {Petición a Memoria} -radix unsigned /prueba_ensamblado/ensa_ca_mem/cache/cach/cache_sin/contro/pet_m.m_pet
add wave -noupdate -label {Dirección de petición} -radix hexadecimal /prueba_ensamblado/ensa_ca_mem/cache/inter_Pr_BUS_IN/mpet_info_e.dir
add wave -noupdate -label Pt/PtX /prueba_ensamblado/ensa_ca_mem/cache/inter_Pr_BUS_CON/mpet_cntl_e.mexp
add wave -noupdate -label {Respuesta de Memoria Válida} -radix unsigned /prueba_ensamblado/ensa_ca_mem/cache/cach/cache_sin/contro/resp_m.m_val
add wave -noupdate -divider {Respuesta al Procesador}
add wave -noupdate -label {Respuesta de la Cache} -radix unsigned -childformat {{/prueba_ensamblado/ensa_ca_mem/cache/cach/cache_sin/contro/resp.listo -radix unsigned} {/prueba_ensamblado/ensa_ca_mem/cache/cach/cache_sin/contro/resp.finalizada -radix unsigned}} -expand -subitemconfig {/prueba_ensamblado/ensa_ca_mem/cache/cach/cache_sin/contro/resp.listo {-height 18 -radix unsigned} /prueba_ensamblado/ensa_ca_mem/cache/cach/cache_sin/contro/resp.finalizada {-height 18 -radix unsigned}} /prueba_ensamblado/ensa_ca_mem/cache/cach/cache_sin/contro/resp
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Inicio petición de Lectura} {25802000 ps} 1} {{Inicio petición de actualización a Memoria} {26122000 ps} 1} {{Confirmación de escritura de Memoria} {26602000 ps} 1} {{Inicio de petición de lectura a Memoria} {26762000 ps} 1} {{Respuesta de Memoria con el bloque} {27242000 ps} 1} {{Lectura del procesador} {27403000 ps} 1} {{Petición de Lectura 2} {27485000 ps} 1} {{Lectura del procesador 2} {27643000 ps} 1}
quietly wave cursor active 8
configure wave -namecolwidth 281
configure wave -valuecolwidth 61
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
WaveRestoreZoom {25768823 ps} {27815253 ps}
