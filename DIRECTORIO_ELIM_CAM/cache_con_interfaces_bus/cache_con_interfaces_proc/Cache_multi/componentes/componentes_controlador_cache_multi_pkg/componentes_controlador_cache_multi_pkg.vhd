--
-- Copyright (c) 2017 XXXX, UPC
-- All rights reserved.
-- 

library ieee;
use ieee.std_logic_1164.all;

use work.param_disenyo_pkg.all;
use work.controlador_Obs_elim_pkg.all;
use work.controlador_multi_pkg.all;

package componentes_controlador_cache_multi_pkg is

component procesador is
port (reloj, pcero: in std_logic;
		arb_pet: out std_logic; 	-- peticion
		acceso: out std_logic_vector(2 downto 0); -- Acceso a campos de datos o etiquetas
		arb_conc: in std_logic; 	-- concesion
		trans_bus: out std_logic; 	-- utilizando el bus
		observacion: in std_logic;  --indicacion de que se esta observando una transaccion
		pet: in tp_contro_e;
		s_estado: in tp_contro_cam_estado;
		s_control: out tp_contro_cam_cntl;
		resp: out tp_contro_s;
		dirINI: out st_dir_bloque;
		resp_m: in tp_cntl_memoria_e;
		cancel_pme: in std_logic;
		pet_m: out tp_cntl_memoria_s);
end component;

component observador is
port (reloj, pcero: in std_logic;
		pet: in tp_contro_Obs_e;
		s_estado: in tp_contro_cam_estado;
		trans_bus: in std_logic; 	-- utilizando el bus
		acceso: in std_logic_vector(2 downto 0); -- Acceso a campos de datos o etiquetas
		dir_proc: in st_dir;
		observacion: out std_logic;
		suministro: out std_logic;
		s_control: out tp_contro_cam_cntl;
		cancel_pme: out std_logic;
		resp: out tp_contro_Obs_s);
end component;

end package componentes_controlador_cache_multi_pkg;
