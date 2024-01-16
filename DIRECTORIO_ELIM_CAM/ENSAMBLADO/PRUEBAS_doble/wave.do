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
add wave -noupdate -divider {Petición Procesador}
add wave -noupdate -label {Petición Válida} -radix unsigned /prueba_ensamblado_multi/ensa_ca_mem/proc_multi(0)/cache/cach/cache_sin/peticion.acc
add wave -noupdate -label {Dirección} -radix hexadecimal /prueba_ensamblado_multi/ensa_ca_mem/proc_multi(0)/cache/cach/cache_sin/peticion.dir
add wave -noupdate -label {LPr/EPr} -radix unsigned /prueba_ensamblado_multi/ensa_ca_mem/proc_multi(0)/cache/cach/cache_sin/peticion.esc
add wave -noupdate -label {Dato escrito} -radix unsigned /prueba_ensamblado_multi/ensa_ca_mem/proc_multi(0)/cache/cach/cache_sin/peticion.DE
add wave -noupdate -divider {Respuesta Procesador}
add wave -noupdate -label {Dato Leído} -radix unsigned /prueba_ensamblado_multi/respuestas(0).DL
add wave -noupdate -label {Válido} -radix unsigned /prueba_ensamblado_multi/respuestas(0).val
add wave -noupdate -divider Campos
add wave -noupdate -radix hexadecimal /prueba_ensamblado_multi/ensa_ca_mem/proc_multi(0)/cache/cach/cache_sin/camino/etiq/ET_Mem/ET_mem
add wave -noupdate -radix binary /prueba_ensamblado_multi/ensa_ca_mem/proc_multi(0)/cache/cach/cache_sin/camino/estado/EST_mem
add wave -noupdate -radix hexadecimal -childformat {{/prueba_ensamblado_multi/ensa_ca_mem/proc_multi(0)/cache/cach/cache_sin/camino/datos_ca/DAT_Mem/DAT_mem(0) -radix hexadecimal} {/prueba_ensamblado_multi/ensa_ca_mem/proc_multi(0)/cache/cach/cache_sin/camino/datos_ca/DAT_Mem/DAT_mem(1) -radix hexadecimal} {/prueba_ensamblado_multi/ensa_ca_mem/proc_multi(0)/cache/cach/cache_sin/camino/datos_ca/DAT_Mem/DAT_mem(2) -radix hexadecimal} {/prueba_ensamblado_multi/ensa_ca_mem/proc_multi(0)/cache/cach/cache_sin/camino/datos_ca/DAT_Mem/DAT_mem(3) -radix hexadecimal} {/prueba_ensamblado_multi/ensa_ca_mem/proc_multi(0)/cache/cach/cache_sin/camino/datos_ca/DAT_Mem/DAT_mem(4) -radix hexadecimal} {/prueba_ensamblado_multi/ensa_ca_mem/proc_multi(0)/cache/cach/cache_sin/camino/datos_ca/DAT_Mem/DAT_mem(5) -radix hexadecimal} {/prueba_ensamblado_multi/ensa_ca_mem/proc_multi(0)/cache/cach/cache_sin/camino/datos_ca/DAT_Mem/DAT_mem(6) -radix hexadecimal} {/prueba_ensamblado_multi/ensa_ca_mem/proc_multi(0)/cache/cach/cache_sin/camino/datos_ca/DAT_Mem/DAT_mem(7) -radix hexadecimal}} -expand -subitemconfig {/prueba_ensamblado_multi/ensa_ca_mem/proc_multi(0)/cache/cach/cache_sin/camino/datos_ca/DAT_Mem/DAT_mem(0) {-radix hexadecimal} /prueba_ensamblado_multi/ensa_ca_mem/proc_multi(0)/cache/cach/cache_sin/camino/datos_ca/DAT_Mem/DAT_mem(1) {-radix hexadecimal} /prueba_ensamblado_multi/ensa_ca_mem/proc_multi(0)/cache/cach/cache_sin/camino/datos_ca/DAT_Mem/DAT_mem(2) {-radix hexadecimal} /prueba_ensamblado_multi/ensa_ca_mem/proc_multi(0)/cache/cach/cache_sin/camino/datos_ca/DAT_Mem/DAT_mem(3) {-radix hexadecimal} /prueba_ensamblado_multi/ensa_ca_mem/proc_multi(0)/cache/cach/cache_sin/camino/datos_ca/DAT_Mem/DAT_mem(4) {-radix hexadecimal} /prueba_ensamblado_multi/ensa_ca_mem/proc_multi(0)/cache/cach/cache_sin/camino/datos_ca/DAT_Mem/DAT_mem(5) {-radix hexadecimal} /prueba_ensamblado_multi/ensa_ca_mem/proc_multi(0)/cache/cach/cache_sin/camino/datos_ca/DAT_Mem/DAT_mem(6) {-radix hexadecimal} /prueba_ensamblado_multi/ensa_ca_mem/proc_multi(0)/cache/cach/cache_sin/camino/datos_ca/DAT_Mem/DAT_mem(7) {-radix hexadecimal}} /prueba_ensamblado_multi/ensa_ca_mem/proc_multi(0)/cache/cach/cache_sin/camino/datos_ca/DAT_Mem/DAT_mem
add wave -noupdate -divider {Estado CC_proc}
add wave -noupdate /prueba_ensamblado_multi/ensa_ca_mem/proc_multi(0)/cache/cach/cache_sin/contro/contro_proc/estado
add wave -noupdate /prueba_ensamblado_multi/ensa_ca_mem/proc_multi(0)/cache/cach/cache_sin/contro/contro_proc/prxestado
add wave -noupdate -divider {Estados CC_Obser}
add wave -noupdate -expand -group {Observación CC0} -label {Acceso del AP} /prueba_ensamblado_multi/ensa_ca_mem/proc_multi(0)/cache/cach/cache_sin/acceso_campos
add wave -noupdate -expand -group {Observación CC0} /prueba_ensamblado_multi/ensa_ca_mem/proc_multi(0)/cache/cach/cache_sin/contro/contro_obser/estado
add wave -noupdate -expand -group {Observación CC0} /prueba_ensamblado_multi/ensa_ca_mem/proc_multi(0)/cache/cach/cache_sin/contro/contro_obser/prxestado
add wave -noupdate -expand -group {Observación CC0} -expand -group {Petición observada} -label Dirección -radix hexadecimal /prueba_ensamblado_multi/ensa_ca_mem/proc_multi(0)/cache/cach/cache_sin/obs_bus.dir
add wave -noupdate -expand -group {Observación CC0} -expand -group {Petición observada} -label Petición -radix hexadecimal /prueba_ensamblado_multi/ensa_ca_mem/proc_multi(0)/cache/cach/cache_sin/obs_bus.pet
add wave -noupdate -expand -group {Observación CC0} -expand -group {Petición observada} -label Pt/PtIm -radix hexadecimal /prueba_ensamblado_multi/ensa_ca_mem/proc_multi(0)/cache/cach/cache_sin/obs_bus.esc
add wave -noupdate -expand -group {Observación CC0} -expand -group {Petición observada} -label {Debe suministrar} -radix hexadecimal /prueba_ensamblado_multi/ensa_ca_mem/proc_multi(0)/cache/cach/cache_sin/obs_bus.exp
add wave -noupdate -expand -group {Observación CC0} -label {Bloque suministrado} -radix hexadecimal /prueba_ensamblado_multi/ensa_ca_mem/proc_multi(0)/cache/cach/cache_sin/suministro_cache.BL
add wave -noupdate -expand -group {Observación CC0} -label {Suministro Válido} /prueba_ensamblado_multi/ensa_ca_mem/proc_multi(0)/cache/cach/cache_sin/contro/contro_obser/suministro
add wave -noupdate -divider {CACHE 1}
add wave -noupdate -label {Petición Válida} -radix unsigned /prueba_ensamblado_multi/ensa_ca_mem/proc_multi(1)/cache/cach/cache_sin/peticion.acc
add wave -noupdate -label {Dirección} -radix hexadecimal /prueba_ensamblado_multi/ensa_ca_mem/proc_multi(1)/cache/cach/cache_sin/peticion.dir
add wave -noupdate -label {LPr/EPr} -radix unsigned /prueba_ensamblado_multi/ensa_ca_mem/proc_multi(1)/cache/cach/cache_sin/peticion.esc
add wave -noupdate -label {Dato Escrito} -radix unsigned /prueba_ensamblado_multi/ensa_ca_mem/proc_multi(1)/cache/cach/cache_sin/peticion.DE
add wave -noupdate -divider {Respuesta Procesador}
add wave -noupdate -label {Dato Leído} -radix hexadecimal /prueba_ensamblado_multi/respuestas(1).DL
add wave -noupdate -label {Válido} -radix hexadecimal /prueba_ensamblado_multi/respuestas(1).val
add wave -noupdate -divider Campos
add wave -noupdate -radix hexadecimal /prueba_ensamblado_multi/ensa_ca_mem/proc_multi(1)/cache/cach/cache_sin/camino/etiq/ET_Mem/ET_mem
add wave -noupdate -radix binary /prueba_ensamblado_multi/ensa_ca_mem/proc_multi(1)/cache/cach/cache_sin/camino/estado/EST_mem
add wave -noupdate -radix hexadecimal -childformat {{/prueba_ensamblado_multi/ensa_ca_mem/proc_multi(1)/cache/cach/cache_sin/camino/datos_ca/DAT_Mem/DAT_mem(0) -radix hexadecimal} {/prueba_ensamblado_multi/ensa_ca_mem/proc_multi(1)/cache/cach/cache_sin/camino/datos_ca/DAT_Mem/DAT_mem(1) -radix hexadecimal} {/prueba_ensamblado_multi/ensa_ca_mem/proc_multi(1)/cache/cach/cache_sin/camino/datos_ca/DAT_Mem/DAT_mem(2) -radix hexadecimal} {/prueba_ensamblado_multi/ensa_ca_mem/proc_multi(1)/cache/cach/cache_sin/camino/datos_ca/DAT_Mem/DAT_mem(3) -radix hexadecimal} {/prueba_ensamblado_multi/ensa_ca_mem/proc_multi(1)/cache/cach/cache_sin/camino/datos_ca/DAT_Mem/DAT_mem(4) -radix hexadecimal} {/prueba_ensamblado_multi/ensa_ca_mem/proc_multi(1)/cache/cach/cache_sin/camino/datos_ca/DAT_Mem/DAT_mem(5) -radix hexadecimal} {/prueba_ensamblado_multi/ensa_ca_mem/proc_multi(1)/cache/cach/cache_sin/camino/datos_ca/DAT_Mem/DAT_mem(6) -radix hexadecimal} {/prueba_ensamblado_multi/ensa_ca_mem/proc_multi(1)/cache/cach/cache_sin/camino/datos_ca/DAT_Mem/DAT_mem(7) -radix hexadecimal}} -expand -subitemconfig {/prueba_ensamblado_multi/ensa_ca_mem/proc_multi(1)/cache/cach/cache_sin/camino/datos_ca/DAT_Mem/DAT_mem(0) {-radix hexadecimal} /prueba_ensamblado_multi/ensa_ca_mem/proc_multi(1)/cache/cach/cache_sin/camino/datos_ca/DAT_Mem/DAT_mem(1) {-radix hexadecimal} /prueba_ensamblado_multi/ensa_ca_mem/proc_multi(1)/cache/cach/cache_sin/camino/datos_ca/DAT_Mem/DAT_mem(2) {-radix hexadecimal} /prueba_ensamblado_multi/ensa_ca_mem/proc_multi(1)/cache/cach/cache_sin/camino/datos_ca/DAT_Mem/DAT_mem(3) {-radix hexadecimal} /prueba_ensamblado_multi/ensa_ca_mem/proc_multi(1)/cache/cach/cache_sin/camino/datos_ca/DAT_Mem/DAT_mem(4) {-radix hexadecimal} /prueba_ensamblado_multi/ensa_ca_mem/proc_multi(1)/cache/cach/cache_sin/camino/datos_ca/DAT_Mem/DAT_mem(5) {-radix hexadecimal} /prueba_ensamblado_multi/ensa_ca_mem/proc_multi(1)/cache/cach/cache_sin/camino/datos_ca/DAT_Mem/DAT_mem(6) {-radix hexadecimal} /prueba_ensamblado_multi/ensa_ca_mem/proc_multi(1)/cache/cach/cache_sin/camino/datos_ca/DAT_Mem/DAT_mem(7) {-radix hexadecimal}} /prueba_ensamblado_multi/ensa_ca_mem/proc_multi(1)/cache/cach/cache_sin/camino/datos_ca/DAT_Mem/DAT_mem
add wave -noupdate -divider {Estado CC_proc}
add wave -noupdate /prueba_ensamblado_multi/ensa_ca_mem/proc_multi(1)/cache/cach/cache_sin/contro/contro_proc/estado
add wave -noupdate /prueba_ensamblado_multi/ensa_ca_mem/proc_multi(1)/cache/cach/cache_sin/contro/contro_proc/prxestado
add wave -noupdate -divider {Estado CC_obser}
add wave -noupdate -expand -group {Observación CC1} -label {Acceso del AP} /prueba_ensamblado_multi/ensa_ca_mem/proc_multi(1)/cache/cach/cache_sin/contro/acceso
add wave -noupdate -expand -group {Observación CC1} /prueba_ensamblado_multi/ensa_ca_mem/proc_multi(1)/cache/cach/cache_sin/contro/contro_obser/estado
add wave -noupdate -expand -group {Observación CC1} /prueba_ensamblado_multi/ensa_ca_mem/proc_multi(1)/cache/cach/cache_sin/contro/contro_obser/prxestado
add wave -noupdate -expand -group {Observación CC1} -expand -group {Petición Observada} -label Dirección -radix unsigned /prueba_ensamblado_multi/ensa_ca_mem/proc_multi(1)/cache/cach/obs_bus.dir
add wave -noupdate -expand -group {Observación CC1} -expand -group {Petición Observada} -label Petición -radix unsigned /prueba_ensamblado_multi/ensa_ca_mem/proc_multi(1)/cache/cach/obs_bus.pet
add wave -noupdate -expand -group {Observación CC1} -expand -group {Petición Observada} -label Pt/PtIm -radix unsigned /prueba_ensamblado_multi/ensa_ca_mem/proc_multi(1)/cache/cach/obs_bus.esc
add wave -noupdate -expand -group {Observación CC1} -expand -group {Petición Observada} -label {Debe suministrar} -radix unsigned /prueba_ensamblado_multi/ensa_ca_mem/proc_multi(1)/cache/cach/obs_bus.exp
add wave -noupdate -expand -group {Observación CC1} -label {Bloque suministrado} -radix hexadecimal /prueba_ensamblado_multi/ensa_ca_mem/proc_multi(1)/cache/cach/suministro_cache.BL
add wave -noupdate -expand -group {Observación CC1} -label {Suministro Válido} /prueba_ensamblado_multi/ensa_ca_mem/proc_multi(1)/cache/cach/suministro
add wave -noupdate -divider {MEMORIA PRINCIPAL}
add wave -noupdate /prueba_ensamblado_multi/ensa_ca_mem/memoria/direct/acc_dir/estado
add wave -noupdate /prueba_ensamblado_multi/ensa_ca_mem/memoria/direct/acc_dir/prxestado
add wave -noupdate -label {Cancelar PtX} /prueba_ensamblado_multi/ensa_ca_mem/memoria/direct/acc_dir/cancel_pme
add wave -noupdate -label {Respuesta de Memoria Válida} -radix hexadecimal /prueba_ensamblado_multi/ensa_ca_mem/proc_multi(1)/cache/mresp_cntl_bus.m_val
add wave -noupdate -divider Directorio
add wave -noupdate -radix hexadecimal /prueba_ensamblado_multi/ensa_ca_mem/memoria/direct/dir
add wave -noupdate -label {VP Leído} /prueba_ensamblado_multi/ensa_ca_mem/memoria/direct/acc_dir/LD_pres
add wave -noupdate -label {BM Leído} /prueba_ensamblado_multi/ensa_ca_mem/memoria/direct/acc_dir/LD_mod
add wave -noupdate -label {VP Escrito} /prueba_ensamblado_multi/ensa_ca_mem/memoria/direct/acc_dir/s_control.ED_pres
add wave -noupdate -label {BM Escrito} /prueba_ensamblado_multi/ensa_ca_mem/memoria/direct/acc_dir/s_control.ED_mod
add wave -noupdate -divider MP
add wave -noupdate /prueba_ensamblado_multi/ensa_ca_mem/memoria/memoria/mem/t_indice
add wave -noupdate /prueba_ensamblado_multi/ensa_ca_mem/memoria/memoria/mem/MPET
add wave -noupdate -radix hexadecimal /prueba_ensamblado_multi/ensa_ca_mem/memoria/memoria/mem/LD
add wave -noupdate /prueba_ensamblado_multi/ensa_ca_mem/memoria/memoria/mem/pe
add wave -noupdate -radix hexadecimal /prueba_ensamblado_multi/ensa_ca_mem/memoria/memoria/mem/ED
add wave -noupdate /prueba_ensamblado_multi/ensa_ca_mem/memoria/memoria/mem/suministra
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {Inicio {12086790 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 221
configure wave -valuecolwidth 38
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
WaveRestoreZoom {11906271 ps} {13719309 ps}
