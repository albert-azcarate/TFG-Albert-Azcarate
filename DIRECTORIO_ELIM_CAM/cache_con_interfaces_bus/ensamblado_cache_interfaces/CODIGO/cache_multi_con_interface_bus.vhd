library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.param_disenyo_pkg.all;
use work.cache_pkg.all;
use work.componentes_interfaces_bus_multi_pkg.all;
use work.componentes_cache_multi_con_inter_proc_pkg.all;
use work.interface_cache_bus_dir_pkg.all;
use work.controlador_multi_pkg.all;
use work.controlador_Obs_elim_pkg.all;
use work.cache_pkg.all;
use work.cache_multi_con_interface_proc_pkg.all;
use work.interface_observador_pkg.all;
use work.componentes_arbitraje_pkg.all;
--! @image html cache_multi_con_interface_bus.png 

entity cache_multi_con_interface_bus is 										
	port(reloj, pcero: in  std_logic;
		arb_peticion: out std_logic;
		arb_concesion: in std_logic;
		pet_proc: in tp_peticion;
		pet_listo: out st_cache_listo;
		obs_bus: in tp_observacion;
		resp_cache: out tp_respuesta;
		suministro_cache: out tp_suministro;
		suministro: out std_logic;
		mresp_cntl_bus: in tp_respuesta_control_dir;
		mpet_cntl_bus: out tp_peticion_control;
		mresp_info_bus: in tp_respuesta_info_dir;
		mpet_info_bus: out tp_peticion_info_dir;
		identificador: in natural);
end cache_multi_con_interface_bus;


architecture estructural of cache_multi_con_interface_bus is

signal mdato: st_elem_dat;
signal resp_m: tp_cntl_memoria_e;

signal pet_m: tp_peticion_mem;
signal mpet_cntl_e: tp_peticion_control;
signal mresp_cntl_s: tp_respuesta_control_dir;
signal mpet_info_e: tp_peticion_info_dir;
signal mresp_info_s: tp_respuesta_info_dir;


signal obs_bus_s: tp_observacion;
signal resp_O: tp_contro_Obs_s;
signal sum_cache: tp_suministro;

signal t_arb_peticion: std_logic;
signal t_suministro: std_logic;
begin
-- interconexion

-- mles representa quan escribim reament a memoria. mesc nomes quan es una peticio descriptura per que els observadosr vegin que passa
mpet_cntl_e <= (mpet => pet_m.m_pet,
				mles => pet_m.m_pet,
				mexp => pet_m.m_exp,
                mesc => pet_m.m_esc);

				--mles => pet_m.m_acc);

resp_m <= (m_val => mresp_cntl_s.m_val);

mpet_info_e <= (id => std_logic_vector(to_unsigned(identificador, mpet_info_e.id'length)),
				acc => '0',--pet_m.m_acc,
				dir => pet_m.m_dir,
				dato_E => pet_m.m_DE);

mdato <= mresp_info_s.mdato_bus;


-- interface observador
obser: interface_observador port map (reloj => reloj, pcero => pcero,
								O_listo => 	resp_O.listo,
								pet_observacion_bus => obs_bus, pet_observacion_s => obs_bus_s);
								
-- cache con interfaces con el procesador 
cach: cache_multi_con_inter_proc port map(reloj => reloj, pcero => pcero, 
									arb_peticion => t_arb_peticion, arb_concesion => arb_concesion, 
									pet_proc => pet_proc, pet_listo => pet_listo, resp_O => resp_O,
									mdato => mdato, obs_bus => obs_bus_s,
									resp_cache => resp_cache,
                                    suministro_cache => sum_cache,
                                    resp_m => resp_m, pet_m => pet_m, suministro => t_suministro,
									identificador => identificador); --we have to get the id to the controller
	

-- interface con el arbitro
reg_arb_pet: RD_1_arbi port map (reloj => reloj, pcero => pcero, e => t_arb_peticion, s => arb_peticion);

-- interface con el bus: informacion
inter_Pr_BUS_IN: interface_cache_bus_info port map (reloj => reloj, pcero => pcero, arb_conc => arb_concesion,
												mpet_info_e => mpet_info_e, mpet_info_bus => mpet_info_bus,
												mresp_info_bus => mresp_info_bus, mresp_info_s => 
												mresp_info_s);

-- interface con el bus: control
inter_Pr_BUS_CON: interface_cache_bus_control port map (reloj => reloj, pcero => pcero, arb_conc => arb_concesion,
												mpet_cntl_e => mpet_cntl_e, mpet_cntl_bus => mpet_cntl_bus,
												mresp_cntl_bus => mresp_cntl_bus, mresp_cntl_s =>
												mresp_cntl_s, suministro_e => t_suministro , suministro_s 
												=> suministro, suministro_cntl_e => sum_cache, suministro_cntl_s => suministro_cache);
end;



