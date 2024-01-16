onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /prueba_ensamblado_multi/ciclo
add wave -noupdate /prueba_ensamblado_multi/reloj
add wave -noupdate -divider ARBITRAJE
add wave -noupdate -label Arbitraje/Concesión /prueba_ensamblado_multi/ensa_ca_mem/arbitraje/estado
add wave -noupdate /prueba_ensamblado_multi/ensa_ca_mem/arbitraje/arb_peticiones
add wave -noupdate /prueba_ensamblado_multi/ensa_ca_mem/arbitraje/arb_concesiones
add wave -noupdate -label {Fin de transacción} /prueba_ensamblado_multi/ensa_ca_mem/arbitraje/fin_trans
add wave -noupdate -divider {CACHE 0}
add wave -noupdate -label {Respuesta Dato Leído} -radix hexadecimal /prueba_ensamblado_multi/respuestas(0).DL
add wave -noupdate -label {Respuesta Dato Válido} -radix hexadecimal /prueba_ensamblado_multi/respuestas(0).val
add wave -noupdate -divider Campos
add wave -noupdate -label {Etiqueta Bloque 0} -radix unsigned /prueba_ensamblado_multi/ensa_ca_mem/proc_multi(0)/cache/cach/cache_sin/camino/etiq/ET_Mem/ET_mem(0)
add wave -noupdate -label {Estado Bloque 0} /prueba_ensamblado_multi/ensa_ca_mem/proc_multi(0)/cache/cach/cache_sin/camino/estado/EST_mem(0)
add wave -noupdate -label {Dato Bloque 0} -radix hexadecimal /prueba_ensamblado_multi/ensa_ca_mem/proc_multi(0)/cache/cach/cache_sin/camino/datos_ca/DAT_Mem/DAT_mem(0)
add wave -noupdate -divider {Estado CC_proc}
add wave -noupdate /prueba_ensamblado_multi/ensa_ca_mem/proc_multi(0)/cache/cach/cache_sin/contro/contro_proc/estado
add wave -noupdate /prueba_ensamblado_multi/ensa_ca_mem/proc_multi(0)/cache/cach/cache_sin/contro/contro_proc/prxestado
add wave -noupdate -divider {Estados CC_Obser}
add wave -noupdate -group {Observación CC0} /prueba_ensamblado_multi/ensa_ca_mem/proc_multi(0)/cache/cach/cache_sin/acceso_campos
add wave -noupdate -group {Observación CC0} /prueba_ensamblado_multi/ensa_ca_mem/proc_multi(0)/cache/cach/cache_sin/contro/contro_obser/estado
add wave -noupdate -group {Observación CC0} /prueba_ensamblado_multi/ensa_ca_mem/proc_multi(0)/cache/cach/cache_sin/contro/contro_obser/prxestado
add wave -noupdate -group {Observación CC0} -expand -group {Petición observada} -label Dirección -radix hexadecimal /prueba_ensamblado_multi/ensa_ca_mem/proc_multi(0)/cache/cach/cache_sin/obs_bus.dir
add wave -noupdate -group {Observación CC0} -expand -group {Petición observada} -label Petición -radix hexadecimal /prueba_ensamblado_multi/ensa_ca_mem/proc_multi(0)/cache/cach/cache_sin/obs_bus.pet
add wave -noupdate -group {Observación CC0} -expand -group {Petición observada} -label Pt/PtIm -radix hexadecimal /prueba_ensamblado_multi/ensa_ca_mem/proc_multi(0)/cache/cach/cache_sin/obs_bus.esc
add wave -noupdate -group {Observación CC0} -expand -group {Petición observada} -label PtX -radix hexadecimal /prueba_ensamblado_multi/ensa_ca_mem/proc_multi(0)/cache/cach/cache_sin/obs_bus.exp
add wave -noupdate -group {Observación CC0} -label {Bloque suministrado} -radix unsigned /prueba_ensamblado_multi/ensa_ca_mem/proc_multi(0)/cache/cach/cache_sin/suministro_cache.BL
add wave -noupdate -group {Observación CC0} -label {Dirección reconstruida} -radix unsigned /prueba_ensamblado_multi/ensa_ca_mem/proc_multi(0)/cache/cach/cache_sin/suministro_cache.dir_rec
add wave -noupdate -group {Observación CC0} -label {Suministro Válido} /prueba_ensamblado_multi/ensa_ca_mem/proc_multi(0)/cache/cach/cache_sin/contro/contro_obser/suministro
add wave -noupdate -group {Observación CC0} -label {Bloque del Bus} -radix unsigned /prueba_ensamblado_multi/ensa_ca_mem/proc_multi(0)/cache/cach/cache_sin/suministro_cache.bloqueo
add wave -noupdate -divider {CACHE 1}
add wave -noupdate -label {Respuesta Procesador 1} -radix hexadecimal -childformat {{/prueba_ensamblado_multi/respuestas(1).DL -radix hexadecimal} {/prueba_ensamblado_multi/respuestas(1).BL -radix hexadecimal} {/prueba_ensamblado_multi/respuestas(1).dir_rec -radix hexadecimal} {/prueba_ensamblado_multi/respuestas(1).val -radix hexadecimal}} -subitemconfig {/prueba_ensamblado_multi/respuestas(1).DL {-height 16 -radix hexadecimal} /prueba_ensamblado_multi/respuestas(1).BL {-height 16 -radix hexadecimal} /prueba_ensamblado_multi/respuestas(1).dir_rec {-height 16 -radix hexadecimal} /prueba_ensamblado_multi/respuestas(1).val {-height 16 -radix hexadecimal}} /prueba_ensamblado_multi/respuestas(1)
add wave -noupdate -divider Campos
add wave -noupdate -label {Etiqueta Bloque 0} -radix unsigned /prueba_ensamblado_multi/ensa_ca_mem/proc_multi(1)/cache/cach/cache_sin/camino/etiq/ET_Mem/ET_mem(0)
add wave -noupdate -label {Estado Bloque 0} /prueba_ensamblado_multi/ensa_ca_mem/proc_multi(1)/cache/cach/cache_sin/camino/estado/EST_mem(0)
add wave -noupdate -label {Dato Bloque 0} -radix hexadecimal /prueba_ensamblado_multi/ensa_ca_mem/proc_multi(1)/cache/cach/cache_sin/camino/datos_ca/DAT_Mem/DAT_mem(0)
add wave -noupdate -divider {Estado CC_proc}
add wave -noupdate /prueba_ensamblado_multi/ensa_ca_mem/proc_multi(1)/cache/cach/cache_sin/contro/contro_proc/estado
add wave -noupdate /prueba_ensamblado_multi/ensa_ca_mem/proc_multi(1)/cache/cach/cache_sin/contro/contro_proc/prxestado
add wave -noupdate -divider {Estado CC_obser}
add wave -noupdate -label {Acceso del AP} /prueba_ensamblado_multi/ensa_ca_mem/proc_multi(1)/cache/cach/cache_sin/contro/acceso
add wave -noupdate /prueba_ensamblado_multi/ensa_ca_mem/proc_multi(1)/cache/cach/cache_sin/contro/contro_obser/estado
add wave -noupdate /prueba_ensamblado_multi/ensa_ca_mem/proc_multi(1)/cache/cach/cache_sin/contro/contro_obser/prxestado
add wave -noupdate -label Dirección -radix unsigned /prueba_ensamblado_multi/ensa_ca_mem/proc_multi(1)/cache/cach/obs_bus.dir
add wave -noupdate -label Petición -radix unsigned /prueba_ensamblado_multi/ensa_ca_mem/proc_multi(1)/cache/cach/obs_bus.pet
add wave -noupdate -label Pt/PtIm -radix unsigned /prueba_ensamblado_multi/ensa_ca_mem/proc_multi(1)/cache/cach/obs_bus.esc
add wave -noupdate -label PtX -radix unsigned /prueba_ensamblado_multi/ensa_ca_mem/proc_multi(1)/cache/cach/obs_bus.exp
add wave -noupdate -label {Cancelar PtX} /prueba_ensamblado_multi/ensa_ca_mem/proc_multi(1)/cache/cach/cache_sin/contro/cancelar_pme
add wave -noupdate -label {Bloque suministrado} -radix hexadecimal /prueba_ensamblado_multi/ensa_ca_mem/proc_multi(1)/cache/cach/suministro_cache.BL
add wave -noupdate -label {Dirección reconstruida} -radix hexadecimal /prueba_ensamblado_multi/ensa_ca_mem/proc_multi(1)/cache/cach/suministro_cache.dir_rec
add wave -noupdate -label {Suministro Válido} /prueba_ensamblado_multi/ensa_ca_mem/proc_multi(1)/cache/cach/suministro
add wave -noupdate -divider Memoria
add wave -noupdate -label {Respuesta de Memoria Válida} -radix hexadecimal /prueba_ensamblado_multi/ensa_ca_mem/proc_multi(1)/cache/mresp_cntl_bus.m_val
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{P0 y P1 inicio petición} {19560000 ps} 1} {{Concesión de Bus a P0} {19800000 ps} 1} {{Observación de P1} {19960000 ps} 1} {{Cancelación de PtX y suministro} {20120000 ps} 1} {{Cache0 recibe el bloque} {20280000 ps} 1} {{Lectura del Dato P0} {20440000 ps} 1}
quietly wave cursor active 6
configure wave -namecolwidth 221
configure wave -valuecolwidth 65
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
WaveRestoreZoom {19406675 ps} {21524351 ps}
