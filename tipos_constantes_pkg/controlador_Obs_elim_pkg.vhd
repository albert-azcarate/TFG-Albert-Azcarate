--
-- Copyright (c) 2017 XXXX, UPC
-- All rights reserved.
-- 

library ieee;
use ieee.std_logic_1164.all;

use work.param_disenyo_pkg.all;

package controlador_Obs_elim_pkg is

type tipoestado_O is (DESO, EEST, SUM, B_EEST, B_SUM);

type tp_contro_Obs_e is record
	acc: std_logic;
    esc : std_logic;
	dir: st_dir;
    eest_sum: std_logic;
end record;

type tp_contro_Obs_s is record
	listo: std_logic;
end record;

end package controlador_Obs_elim_pkg;


