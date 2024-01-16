--
-- Copyright (c) 2017 XXXX, UPC
-- All rights reserved.
-- 

library ieee;
use ieee.std_logic_1164.all;

use work.param_disenyo_pkg.all;
use work.camino_dat_pkg.all;
use work.controlador_multi_pkg.all;
use work.controlador_Obs_pkg.all;
use work.interface_observador_pkg.all;
use work.cache_pkg.all;
use work.componentes_cache_multi_con_inter_proc_pkg.all;
use work.interface_cache_bus_pkg.all;
use work.componentes_interfaces_bus_multi_pkg.all;
--! @image html cache_con_interface_proc.png 

entity cache_multi_con_inter_proc is
port (reloj, pcero: in std_logic;
		arb_peticion: out std_logic;
		arb_concesion: in std_logic;
		pet_proc: in tp_peticion;
		pet_listo: out st_cache_listo;
		resp_O: out tp_contro_Obs_s;
		mdato: in st_elem_dat;
		obs_bus: in tp_observacion;
		resp_cache: out tp_respuesta;
		suministro_cache: out tp_suministro;
		resp_m: in tp_cntl_memoria_e;
		suministro: out std_logic;
		pet_m: out tp_peticion_mem);
end;
  
architecture estruc of cache_multi_con_inter_proc is

signal t_pet_listo: st_cache_listo;
signal peticion: tp_peticion;
signal respuesta: tp_respuesta;
signal dir: st_dir;
signal suministro_c: tp_suministro;
signal pet_m_cntl: tp_cntl_memoria_s;
signal m_acc: std_logic;
signal suministro_bit: std_logic;

begin 
-- interface procesador- cache
inter_Pr_ca: interface_proc_cache port map(reloj => reloj, pcero => pcero, pet_proc => pet_proc, pet_listo => pet_listo, 
										peticion => peticion, pet_cache_listo => t_pet_listo);
-- cache 
cache_sin: cache_multi port map (reloj => reloj, pcero => pcero, arb_peticion => arb_peticion, arb_concesion => arb_concesion, 
							peticion => peticion, pet_listo => t_pet_listo, resp_O => resp_O, mdato => mdato, obs_bus => obs_bus,
							respuesta => respuesta, suministro_cache => suministro_c, suministro => suministro_bit, resp_m => resp_m, pet_m => pet_m_cntl);
							
-- Aqui es on pasem el bit [m_exp] per avisar que expulsem (REVISAR)
dir <= respuesta.dir_rec when pet_m_cntl.m_exp = '0' and suministro_bit = '0' else
		suministro_c.dir_rec;
		
suministro_cache <= suministro_c;

pet_m <= (m_acc => pet_m_cntl.m_acc,
		m_exp => pet_m_cntl.m_exp,
		m_pet => pet_m_cntl.m_pet,
		m_esc=> pet_m_cntl.m_esc,
		m_dir => dir,
		m_DE => respuesta.BL);

suministro <= suministro_bit;

-- interface cache - procesador
inter_ca_Pr: interface_cache_proc port map(respuesta => respuesta, resp_cache => resp_cache);
end;



