--
-- Copyright (c) 2017 XXXX, UPC
-- All rights reserved.
-- 

library ieee;
use ieee.std_logic_1164.all;

use work.param_disenyo_pkg.all;
use work.param_directorio_pkg.all;

package controlador_dir_elim_pkg is

type tipoestado is (DES, CMP, OBS_S, OBS_I, NUEV, EXP, ESPM, RES_M, RES_A, ESPS, RES_S, RES_X);


type tp_control_dir_s is record
	pe_dir: std_logic;
	ED_pres: st_elem_dir;
	ED_mod:  std_logic;
	enviar_obs: std_logic;
	enviar_res: std_logic;
	enviar_sum: std_logic;
    eest_sum: std_logic;
end record;


end package controlador_dir_elim_pkg;


