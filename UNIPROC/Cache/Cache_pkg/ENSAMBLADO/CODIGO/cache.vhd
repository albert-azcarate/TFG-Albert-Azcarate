--
-- Copyright (c) 2017 XXXX, UPC
-- All rights reserved.
-- 

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.param_disenyo_pkg.all;
use work.camino_dat_pkg.all;
use work.controlador_pkg.all;
use work.componentes_cache_pkg.all;
use work.acciones_pkg.all;
use work.cache_pkg.all;
--! @image html cache.png 

entity cache is
port (reloj, pcero: in std_logic;
		peticion: in tp_peticion;
		pet_listo: out st_cache_listo;
		mdato: in st_elem_dat;
		respuesta: out tp_respuesta;
		resp_m: in tp_cntl_memoria_e;
		pet_m: out tp_cntl_memoria_s);
end;
  
architecture estruc of cache is

signal cami_e : tp_camino_e;
signal cami_s : tp_camino_s;

signal pet: tp_contro_e;
signal s_estado: tp_contro_cam_estado;
signal s_control: tp_contro_cam_cntl;
signal resp: tp_contro_s;

signal mx_DAT: st_palabra_dat;

signal dirINIT : st_dir_bloque;
signal dir : st_dir;
signal pet_m_s: tp_cntl_memoria_s;

begin 
-- interconexión
cami_e <= (etiq_acc => s_control.ET_acc, 
			dirB => peticion.dir(dir_bits-1 downto 1),
			etiq_esc => s_control.ET_esc,
			byte => peticion.dir(0),
			
			est_acc => s_control.EST_acc,
			est_esc => s_control.EST_esc,
			est_DE => s_control.EST_DE,
			
			dat_acc => s_control.DAT_acc,
			dat_esc => s_control.DAT_esc,
			dat_DE => peticion.DE,
			
			dat_mem_DE => mdato,
			proc_mem => s_control.muxE,
			muxINI => s_control.muxINI);

-- camino de datos: ET, EST, DAT
camino: camino_datos port map (reloj => reloj, cami_e => cami_e, cami_s => cami_s, dirINI => dirINIT);

-- interconexión
s_estado <= (BYTE => peticion.dir(0),
				AF => cami_s.cam_AF,
				EST => cami_s.cam_EST);
pet <= (acc => peticion.acc, 
		esc => peticion.esc,
		ini => peticion.ini);
		
pet_m <= pet_m_s;

-- controlador de cache
contro: controlador port map(reloj => reloj, pcero => pcero, pet => pet, s_estado => s_estado, s_control => s_control, resp => resp, dirINI => dirINIT, resp_m => resp_m, pet_m => pet_m_s); 

-- [REVISAR] direcciones
dir <= ('0'&cami_s.cam_dir_rec) when pet_m_s.m_exp = '1' else
		('0'&peticion.dir(15 downto 1));

-- interconexión
respuesta <= (DL => cami_s.cam_DL,
			BL => cami_s.cam_DL_mem,
			dir_rec => dir,
			val => resp.finalizada);

pet_listo <= resp.listo;

end;


