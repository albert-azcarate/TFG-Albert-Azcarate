library ieee;
use ieee.std_logic_1164.all;

use work.param_disenyo_pkg.all;
use work.controlador_Obs_elim_pkg.all;
use work.controlador_multi_pkg.all;
use work.componentes_controlador_cache_multi_pkg.all;
--! @image html controlador_multi.png 

entity controlador_multi is
port (reloj, pcero: in std_logic;
		arb_peticion: out std_logic;
		arb_concesion: in std_logic;
		pet: in tp_contro_e;
		pet_bus: in tp_contro_Obs_e;
		s_estado: in tp_contro_cam_estado;
		s_estado_obs: in tp_contro_cam_estado;
		s_control: out tp_contro_cam_cntl;
		s_control_obs: out tp_contro_cam_cntl;
		mxO: out std_logic;
		suministro: out std_logic;
		acceso: out std_logic_vector(2 downto 0); -- Acceso a campos de datos o etiquetas
		resp: out tp_contro_s;
		dirINI: out st_dir_bloque;
		resp_O: out tp_contro_Obs_s;
		resp_m: in tp_cntl_memoria_e;
		pet_m: out tp_cntl_memoria_s;
		identificador: in natural;
		cancel_pme: out std_logic);
end;

architecture estruc of controlador_multi is
signal cntl: std_logic;
signal s_control_P, s_control_O: tp_contro_cam_cntl;
signal observacion:std_logic;

signal trans_bus: std_logic;
signal acceso_campos: std_logic_vector(2 downto 0);
signal cancelar_pme: std_logic;
begin

contro_proc: procesador port map (reloj => reloj, 
									pcero => pcero, 
									arb_pet => arb_peticion, 
									arb_conc => arb_concesion, 
									trans_bus => trans_bus,
									acceso => acceso_campos,
									pet => pet, 
									s_estado => s_estado, 
									s_control => s_control_P, 
									dirINI => dirINI, 
									resp => resp,
									resp_m => resp_m, 
									cancel_pme => cancelar_pme,
									pet_m => pet_m, 
									observacion => observacion
									);

contro_obser: observador port map (reloj => reloj, 
									pcero => pcero, 
									pet => pet_bus, 
									s_estado => s_estado_obs, 
									dir_proc => pet.dir,
									trans_bus => trans_bus,
									acceso => acceso_campos,
									observacion => observacion, 
									suministro => suministro, 
									cancel_pme => cancelar_pme,
									s_control => s_control_O, 
									resp => resp_O
									);

mxO <= observacion and (not trans_bus);

--cntl <=  '1' when acceso_campos /= "00" and s_control_O.EST_esc = '0' else
cntl <=  '1' when acceso_campos /= "000" else
			'0';
-- Usamos las senyales de control del procesador excepto cuando no estamos accediendo desde el procesador y el observador quiere escribir
s_control <= s_control_P when cntl = '1' else s_control_O; 
s_control_obs <= s_control_O;
acceso <= acceso_campos;
cancel_pme <= cancelar_pme;
-- control muxC
--cntl <= observacion and (not trans_bus);
-- muxC
--s_control <= s_control_P when cntl = '0' else s_control_O; --[HERE]
--s_control <= s_control_P when s_control_O.EST_esc = '0' else s_control_O; --[HERE]
--s_control_obs <= s_control_O;
end;

