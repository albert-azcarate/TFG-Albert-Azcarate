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
add wave -noupdate -group {Petición Procesador 0} -label Petición /prueba_ensamblado_multi/ensa_ca_mem/proc_multi(0)/cache/pet_proc.acc
add wave -noupdate -group {Petición Procesador 0} -label Dirección -radix unsigned /prueba_ensamblado_multi/peticiones(0).dir
add wave -noupdate -group {Petición Procesador 0} -label LPr/EPr -radix unsigned /prueba_ensamblado_multi/peticiones(0).esc
add wave -noupdate -group {Petición Procesador 0} -label {Dato Escrito} -radix unsigned /prueba_ensamblado_multi/peticiones(0).DE
add wave -noupdate -label {Respuesta Procesador 0} -radix unsigned /prueba_ensamblado_multi/respuestas(0)
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
add wave -noupdate -group {Observación CC0} -group {Petición observada} -height 16 -label Dirección -radix hexadecimal /prueba_ensamblado_multi/ensa_ca_mem/proc_multi(0)/cache/cach/cache_sin/obs_bus.dir
add wave -noupdate -group {Observación CC0} -group {Petición observada} -height 16 -label Petición -radix hexadecimal /prueba_ensamblado_multi/ensa_ca_mem/proc_multi(0)/cache/cach/cache_sin/obs_bus.pet
add wave -noupdate -group {Observación CC0} -group {Petición observada} -height 16 -label Pt/PtIm -radix hexadecimal /prueba_ensamblado_multi/ensa_ca_mem/proc_multi(0)/cache/cach/cache_sin/obs_bus.esc
add wave -noupdate -group {Observación CC0} -group {Petición observada} -label PtX -radix hexadecimal /prueba_ensamblado_multi/ensa_ca_mem/proc_multi(0)/cache/cach/cache_sin/obs_bus.exp
add wave -noupdate -group {Observación CC0} -label {Bloque suministrado} -radix unsigned /prueba_ensamblado_multi/ensa_ca_mem/proc_multi(0)/cache/cach/cache_sin/suministro_cache.BL
add wave -noupdate -group {Observación CC0} -label {Dirección reconstruida} -radix unsigned /prueba_ensamblado_multi/ensa_ca_mem/proc_multi(0)/cache/cach/cache_sin/suministro_cache.dir_rec
add wave -noupdate -group {Observación CC0} -label {Suministro Válido} /prueba_ensamblado_multi/ensa_ca_mem/proc_multi(0)/cache/cach/cache_sin/contro/contro_obser/suministro
add wave -noupdate -group {Observación CC0} -label {Bloque del Bus} -radix unsigned /prueba_ensamblado_multi/ensa_ca_mem/proc_multi(0)/cache/cach/cache_sin/suministro_cache.bloqueo
add wave -noupdate -divider {CACHE 1}
add wave -noupdate -group {Petición Procesador 1} -label Petición /prueba_ensamblado_multi/ensa_ca_mem/proc_multi(1)/cache/pet_proc.acc
add wave -noupdate -group {Petición Procesador 1} -label Dirección -radix hexadecimal /prueba_ensamblado_multi/peticiones(1).dir
add wave -noupdate -group {Petición Procesador 1} -label LPr/EPr -radix hexadecimal /prueba_ensamblado_multi/peticiones(1).esc
add wave -noupdate -group {Petición Procesador 1} -label {Dato Escrito} -radix hexadecimal /prueba_ensamblado_multi/peticiones(1).DE
add wave -noupdate -label {Respuesta Procesador 1} -radix hexadecimal /prueba_ensamblado_multi/respuestas(1)
add wave -noupdate -divider Campos
add wave -noupdate -label {Etiqueta Bloque 0} -radix unsigned /prueba_ensamblado_multi/ensa_ca_mem/proc_multi(1)/cache/cach/cache_sin/camino/etiq/ET_Mem/ET_mem(0)
add wave -noupdate -label {Estado Bloque 0} /prueba_ensamblado_multi/ensa_ca_mem/proc_multi(1)/cache/cach/cache_sin/camino/estado/EST_mem(0)
add wave -noupdate -label {Dato Bloque 0} -radix hexadecimal /prueba_ensamblado_multi/ensa_ca_mem/proc_multi(1)/cache/cach/cache_sin/camino/datos_ca/DAT_Mem/DAT_mem(0)
add wave -noupdate -divider {Estado CC_proc}
add wave -noupdate /prueba_ensamblado_multi/ensa_ca_mem/proc_multi(1)/cache/cach/cache_sin/contro/contro_proc/estado
add wave -noupdate /prueba_ensamblado_multi/ensa_ca_mem/proc_multi(1)/cache/cach/cache_sin/contro/contro_proc/prxestado
add wave -noupdate -divider {Estado CC_obser}
add wave -noupdate -expand -group {Observación CC1} -label {Acceso del AP} /prueba_ensamblado_multi/ensa_ca_mem/proc_multi(1)/cache/cach/cache_sin/contro/acceso
add wave -noupdate -expand -group {Observación CC1} /prueba_ensamblado_multi/ensa_ca_mem/proc_multi(1)/cache/cach/cache_sin/contro/contro_obser/estado
add wave -noupdate -expand -group {Observación CC1} /prueba_ensamblado_multi/ensa_ca_mem/proc_multi(1)/cache/cach/cache_sin/contro/contro_obser/prxestado
add wave -noupdate -expand -group {Observación CC1} -expand -group {Petición Observada} -height 16 -label Dirección -radix unsigned /prueba_ensamblado_multi/ensa_ca_mem/proc_multi(1)/cache/cach/obs_bus.dir
add wave -noupdate -expand -group {Observación CC1} -expand -group {Petición Observada} -height 16 -label Petición -radix unsigned /prueba_ensamblado_multi/ensa_ca_mem/proc_multi(1)/cache/cach/obs_bus.pet
add wave -noupdate -expand -group {Observación CC1} -expand -group {Petición Observada} -height 16 -label Pt/PtIm -radix unsigned /prueba_ensamblado_multi/ensa_ca_mem/proc_multi(1)/cache/cach/obs_bus.esc
add wave -noupdate -expand -group {Observación CC1} -expand -group {Petición Observada} -label PtX -radix unsigned /prueba_ensamblado_multi/ensa_ca_mem/proc_multi(1)/cache/cach/obs_bus.exp
add wave -noupdate -expand -group {Observación CC1} -label {Bloque suministrado} -radix hexadecimal /prueba_ensamblado_multi/ensa_ca_mem/proc_multi(1)/cache/cach/suministro_cache.BL
add wave -noupdate -expand -group {Observación CC1} -label {Dirección reconstruida} -radix hexadecimal /prueba_ensamblado_multi/ensa_ca_mem/proc_multi(1)/cache/cach/suministro_cache.dir_rec
add wave -noupdate -expand -group {Observación CC1} -label {Suministro Válido} /prueba_ensamblado_multi/ensa_ca_mem/proc_multi(1)/cache/cach/suministro
add wave -noupdate -expand -group {Observación CC1} -label {Bloqueo del bus} /prueba_ensamblado_multi/ensa_ca_mem/proc_multi(1)/cache/cach/cache_sin/s_control_obs.bloq_bus
add wave -noupdate -divider Memoria
add wave -noupdate -label {Respuesta de Memoria Válida} -radix hexadecimal /prueba_ensamblado_multi/ensa_ca_mem/proc_multi(1)/cache/mresp_cntl_bus.m_val
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{P0 y P1 inicio petición} {803000 ps} 1} {{Peticiones de concesión} {922000 ps} 1} {{Concesión de Bus a P1} {1002000 ps} 1} {{Respuesta de memoria} {1564000 ps} 1} {{Escritura P1; Concesión P0} {1721000 ps} 1} {{Observación de Pt y sumnistro} {1962000 ps} 1}
quietly wave cursor active 6
configure wave -namecolwidth 221
configure wave -valuecolwidth 189
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
WaveRestoreZoom {704653 ps} {2799646 ps}
