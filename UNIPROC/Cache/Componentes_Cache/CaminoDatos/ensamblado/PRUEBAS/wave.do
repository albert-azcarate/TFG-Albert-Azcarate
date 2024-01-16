onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -label reloj /prueba_camino_datos/reloj
add wave -noupdate -divider {Camino Ida}
add wave -noupdate -group Camino_ida -label Dir -radix hexadecimal /prueba_camino_datos/camino/cami_e.dirB
add wave -noupdate -group Camino_ida -group Acc -label {Acc etiq} /prueba_camino_datos/camino/cami_e.etiq_acc
add wave -noupdate -group Camino_ida -group Acc -label {Acc est} /prueba_camino_datos/camino/cami_e.est_acc
add wave -noupdate -group Camino_ida -group Acc -label {Acc dat} /prueba_camino_datos/camino/cami_e.dat_acc
add wave -noupdate -group Camino_ida -group En -label {En etiq} /prueba_camino_datos/camino/cami_e.etiq_esc
add wave -noupdate -group Camino_ida -group En -label {En est} /prueba_camino_datos/camino/cami_e.est_esc
add wave -noupdate -group Camino_ida -group En -label {En dat} /prueba_camino_datos/camino/cami_e.dat_esc
add wave -noupdate -group Camino_ida -label byte /prueba_camino_datos/camino/cami_e.byte
add wave -noupdate -group Camino_ida -label proc/mem /prueba_camino_datos/camino/cami_e.proc_mem
add wave -noupdate -group Camino_ida -group Datos -label {Estado nuevo} /prueba_camino_datos/camino/cami_e.est_DE
add wave -noupdate -group Camino_ida -group Datos -label {Dato proc} -radix hexadecimal /prueba_camino_datos/camino/cami_e.dat_DE
add wave -noupdate -group Camino_ida -group Datos -label {Dato mem} -radix hexadecimal /prueba_camino_datos/camino/cami_e.dat_mem_DE
add wave -noupdate -divider {Camino Vuelta}
add wave -noupdate -label camino_s -radix hexadecimal -childformat {{/prueba_camino_datos/camino_s.cam_DL_mem -radix hexadecimal} {/prueba_camino_datos/camino_s.cam_DL -radix hexadecimal} {/prueba_camino_datos/camino_s.cam_AF -radix hexadecimal} {/prueba_camino_datos/camino_s.cam_EST -radix hexadecimal}} -subitemconfig {/prueba_camino_datos/camino_s.cam_DL_mem {-height 15 -radix hexadecimal} /prueba_camino_datos/camino_s.cam_DL {-height 15 -radix hexadecimal} /prueba_camino_datos/camino_s.cam_AF {-height 15 -radix hexadecimal} /prueba_camino_datos/camino_s.cam_EST {-height 15 -radix hexadecimal}} /prueba_camino_datos/camino_s
add wave -noupdate -divider Datos
add wave -noupdate -group Datos -group Inputs -label acc /prueba_camino_datos/camino/datos_ca/DAT_Mem/M_e.acc
add wave -noupdate -group Datos -group Inputs -label en /prueba_camino_datos/camino/datos_ca/DAT_Mem/M_e.esc
add wave -noupdate -group Datos -group Inputs -label Dir -radix hexadecimal /prueba_camino_datos/camino/datos_ca/DAT_Mem/M_e.dir
add wave -noupdate -group Datos -group Inputs -label Dato -radix hexadecimal /prueba_camino_datos/camino/datos_ca/DAT_Mem/M_e.DE
add wave -noupdate -group Datos -label Bloques -radix hexadecimal -childformat {{/prueba_camino_datos/camino/datos_ca/DAT_Mem/DAT_mem(0) -radix hexadecimal} {/prueba_camino_datos/camino/datos_ca/DAT_Mem/DAT_mem(1) -radix hexadecimal} {/prueba_camino_datos/camino/datos_ca/DAT_Mem/DAT_mem(2) -radix hexadecimal} {/prueba_camino_datos/camino/datos_ca/DAT_Mem/DAT_mem(3) -radix hexadecimal} {/prueba_camino_datos/camino/datos_ca/DAT_Mem/DAT_mem(4) -radix hexadecimal} {/prueba_camino_datos/camino/datos_ca/DAT_Mem/DAT_mem(5) -radix hexadecimal} {/prueba_camino_datos/camino/datos_ca/DAT_Mem/DAT_mem(6) -radix hexadecimal} {/prueba_camino_datos/camino/datos_ca/DAT_Mem/DAT_mem(7) -radix hexadecimal}} -subitemconfig {/prueba_camino_datos/camino/datos_ca/DAT_Mem/DAT_mem(0) {-height 15 -radix hexadecimal} /prueba_camino_datos/camino/datos_ca/DAT_Mem/DAT_mem(1) {-height 15 -radix hexadecimal} /prueba_camino_datos/camino/datos_ca/DAT_Mem/DAT_mem(2) {-height 15 -radix hexadecimal} /prueba_camino_datos/camino/datos_ca/DAT_Mem/DAT_mem(3) {-height 15 -radix hexadecimal} /prueba_camino_datos/camino/datos_ca/DAT_Mem/DAT_mem(4) {-height 15 -radix hexadecimal} /prueba_camino_datos/camino/datos_ca/DAT_Mem/DAT_mem(5) {-height 15 -radix hexadecimal} /prueba_camino_datos/camino/datos_ca/DAT_Mem/DAT_mem(6) {-height 15 -radix hexadecimal} /prueba_camino_datos/camino/datos_ca/DAT_Mem/DAT_mem(7) {-height 15 -radix hexadecimal}} /prueba_camino_datos/camino/datos_ca/DAT_Mem/DAT_mem
add wave -noupdate -radix hexadecimal /prueba_camino_datos/camino/datos_ca/DL
add wave -noupdate -divider Etiq
add wave -noupdate -group Etiquetas -group Etiq -label acc /prueba_camino_datos/camino/etiq/M_e.acc
add wave -noupdate -group Etiquetas -group Etiq -label en /prueba_camino_datos/camino/etiq/M_e.esc
add wave -noupdate -group Etiquetas -group Etiq -label Dir -radix unsigned /prueba_camino_datos/camino/etiq/conjunto
add wave -noupdate -group Etiquetas -group Etiq -label AF /prueba_camino_datos/camino/etiq/AF
add wave -noupdate -group Etiquetas -group Etiq -label Etiq_escr -radix hexadecimal /prueba_camino_datos/camino/etiq/M_e.DE
add wave -noupdate -group Etiquetas -group Etiq -label Etiq_leida -radix hexadecimal /prueba_camino_datos/camino/etiq/DL
add wave -noupdate -group Etiquetas -label Etiquetas -radix hexadecimal /prueba_camino_datos/camino/etiq/ET_Mem/ET_mem
add wave -noupdate /prueba_camino_datos/camino/etiq/AF
add wave -noupdate -radix hexadecimal /prueba_camino_datos/camino/etiq/DL
add wave -noupdate -divider Estado
add wave -noupdate -group Estados -group Inputs -label acc /prueba_camino_datos/camino/estado/M_e.acc
add wave -noupdate -group Estados -group Inputs -label en /prueba_camino_datos/camino/estado/M_e.esc
add wave -noupdate -group Estados -group Inputs -label Dir -radix unsigned /prueba_camino_datos/camino/estado/M_e.dir
add wave -noupdate -group Estados -group Inputs -label Est_esc /prueba_camino_datos/camino/estado/M_e.DE
add wave -noupdate -group Estados -group Inputs -label Est_leido /prueba_camino_datos/camino/estado/DL
add wave -noupdate -group Estados -label Estados /prueba_camino_datos/camino/estado/EST_mem
add wave -noupdate /prueba_camino_datos/camino/estado/DL
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {124250 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 173
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 10000
configure wave -gridperiod 20000
configure wave -griddelta 20
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ps} {1491 ns}
