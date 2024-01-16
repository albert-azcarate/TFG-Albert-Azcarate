--
-- Copyright (c) 2017 XXXX, UPC
-- All rights reserved.
-- 

library ieee;
use ieee.std_logic_1164.all;

use work.param_disenyo_pkg.all;
use work.camino_dat_pkg.all;
use work.controlador_multi_pkg.all;
use work.controlador_Obs_elim_pkg.all;
use work.cache_pkg.all;

package componentes_cache_multi_pkg is



component camino_datos_multi is 		 
port (reloj: in  std_logic;
	cami_e: in  tp_camino_e;
	cami_obs_e: in  tp_camino_e;
	cami_s: out tp_camino_s;
	cami_obs_s: out tp_camino_s;
	dirINI: in  st_dir_bloque);
end component;

component controlador_multi is
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
end component;

end package componentes_cache_multi_pkg;

