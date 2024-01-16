onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /prueba_controlador/contr/reloj
add wave -noupdate /prueba_controlador/contr/pcero
add wave -noupdate -divider Estado
add wave -noupdate /prueba_controlador/contr/estado
add wave -noupdate /prueba_controlador/contr/prxestado
add wave -noupdate -divider Inputs
add wave -noupdate -expand -group Inputs /prueba_controlador/contr/pet
add wave -noupdate -expand -group Inputs /prueba_controlador/contr/s_estado
add wave -noupdate -expand -group Inputs /prueba_controlador/contr/resp_m
add wave -noupdate -divider Outputs
add wave -noupdate -expand -group Outputs -expand /prueba_controlador/contr/resp
add wave -noupdate -expand -group Outputs /prueba_controlador/contr/pet_m
add wave -noupdate -expand -group Outputs /prueba_controlador/contr/s_control
add wave -noupdate /prueba_controlador/contr/derechos_acceso
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {203766 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 173
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ps} {483 ns}
