--
-- Copyright (c) 2017 XXXX, UPC
-- All rights reserved.
-- 

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.param_disenyo_pkg.all;
use work.camino_dat_pkg.all;
use work.controlador_obs_pkg.all;
use work.controlador_multi_pkg.all;
use work.interface_observador_pkg.all;
use work.componentes_cache_multi_pkg.all;
use work.acciones_pkg.all;
use work.cache_pkg.all;
--! @image html cache.png 

entity cache_multi is
port (reloj, pcero: in std_logic;
		arb_peticion: out std_logic;
		arb_concesion: in std_logic;
		peticion: in tp_peticion;
		pet_listo: out st_cache_listo;
		resp_O: out tp_contro_Obs_s;
		mdato: in st_elem_dat;
		obs_bus: in tp_observacion;
		respuesta: out tp_respuesta;
		suministro_cache: out tp_suministro;
		resp_m: in tp_cntl_memoria_e;
		suministro: out std_logic;
		pet_m: out tp_cntl_memoria_s);
end;
  
architecture estruc of cache_multi is

signal cami_e : tp_camino_e;
signal cami : tp_camino_e;
signal cami_obs_e : tp_camino_e;
signal cami_obs : tp_camino_e;
signal cami_s : tp_camino_s;
signal cami_obs_s : tp_camino_s;

signal pet: tp_contro_e;
signal s_estado: tp_contro_cam_estado;
signal s_estado_obs: tp_contro_cam_estado;
signal s_control: tp_contro_cam_cntl;
signal s_control_obs: tp_contro_cam_cntl;
signal resp: tp_contro_s;

signal dirINIT : st_dir_bloque;
signal pet_m_s: tp_cntl_memoria_s;
signal dir_cache : st_dir_bloque;
signal dir_cache_obs : st_dir_bloque;
signal DE_mux : st_palabra_dat;
signal muxO : std_logic;
signal cntl : std_logic;
signal cntl_obs : std_logic;
signal suministro_c : std_logic;
signal acceso_campos: std_logic_vector(2 downto 0);
signal pet_bus: tp_contro_Obs_e;

begin 
-- interconexion
cami <= (etiq_acc => s_control.ET_acc, 
			dirB => dir_cache,
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
			
			
cami_obs <= (etiq_acc => s_control_obs.ET_acc, 
			dirB => dir_cache_obs,
			etiq_esc => s_control_obs.ET_esc,
			byte => peticion.dir(0),
			
			est_acc => s_control_obs.EST_acc,
			est_esc => s_control_obs.EST_esc,
			est_DE => s_control_obs.EST_DE,
			
			dat_acc => s_control_obs.DAT_acc,
			dat_esc => s_control_obs.DAT_esc,
			dat_DE => peticion.DE,
			
			dat_mem_DE => mdato,
			proc_mem => s_control_obs.muxE,
			muxINI => s_control.muxINI);
			
			
			

-- Usamos las senyales de control del procesador excepto cuando no estamos accediendo desde el procesador y el observador quiere escribir	
--cntl <= '1' when acceso_campos /= "00" and s_control_obs.EST_esc = '0' else
cntl <= '1' when (acceso_campos /= "000" or (acceso_campos = "000" and s_control_obs.bloq_bus = '1')) and
				(acceso_campos /= "010" or cntl_obs /= '1') else
		'0';

cntl_obs <= '1' when acceso_campos /= "011" and muxO = '1' else
		'0';
		
cami_obs_e 	<= cami when cntl_obs = '0' else
				cami_obs;   

cami_e 		<= cami when cntl = '1' else
				cami_obs;

-- seleccion de la direccion de peticion
dir_cache      <= 	peticion.dir(dir_bits-1 downto 1) when cntl = '1' else
				obs_bus.dir(dir_bits-2 downto 0);

dir_cache_obs  <= 	peticion.dir(dir_bits-1 downto 1) when cntl_obs = '0' else
				obs_bus.dir(dir_bits-2 downto 0);


-- camino de datos: ET, EST, DAT
camino: camino_datos_multi port map (	reloj => reloj, 
										cami_e => cami_e, 
										cami_obs_e => cami_obs_e, 
										cami_s => cami_s, 
										cami_obs_s => cami_obs_s, 
										dirINI => dirINIT);

-- interconexion
s_estado <= (BYTE => peticion.dir(0),
				AF => cami_s.cam_AF,
				EST => cami_s.cam_EST);
				
s_estado_obs <= (BYTE => obs_bus.dir(0),
				AF => cami_obs_s.cam_AF,
				EST => cami_obs_s.cam_EST);

pet <=     (acc => peticion.acc, 
            esc => peticion.esc,
            ini => peticion.ini,
			dir => peticion.dir(15 downto 0));
            
-- solo observamos peticion si es Pt o PtIm
pet_bus <= (acc => obs_bus.pet and not(obs_bus.exp),
            esc => obs_bus.esc,
			dir => obs_bus.dir(15 downto 0));
		
pet_m <= (  m_acc => pet_m_s.m_acc,
			m_pet => pet_m_s.m_pet,
			m_esc => pet_m_s.m_esc,
			m_exp => pet_m_s.m_exp);
			
suministro <= suministro_c;


-- controlador de cache
contro: controlador_multi port map(reloj => reloj, 
												pcero => pcero, 
												arb_peticion => arb_peticion,
												arb_concesion => arb_concesion,
												pet => pet, 
												pet_bus => pet_bus, 
												s_estado => s_estado, 
												s_estado_obs => s_estado_obs, 
												s_control => s_control, 
												s_control_obs => s_control_obs, 
												mxO => muxO, 
												resp => resp, 
												dirINI => dirINIT, 
												resp_O => resp_O, 
												resp_m => resp_m, 
												pet_m => pet_m_s,
												suministro => suministro_c,
												acceso => acceso_campos
												); 

-- interconexion
respuesta <= (DL => cami_s.cam_DL,
			BL => cami_s.cam_DL_mem,
			dir_rec => '0'&peticion.dir(15 downto 1),
			val => resp.finalizada);

suministro_cache <= (DL => cami_s.cam_DL,
					BL => cami_s.cam_DL_mem,
					dir_rec => '0'&cami_s.cam_dir_rec,
					val => resp.finalizada,
					bloqueo => s_control_obs.bloq_bus,
					cancel_pme => '0');

pet_listo <= resp.listo;

end;


