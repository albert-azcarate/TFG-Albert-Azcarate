--
-- Copyright (c) 2017 XXXX, UPC
-- All rights reserved.
-- 

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

use work.param_disenyo_pkg.all;
use work.campo_ET_pkg.all;
use work.campo_EST_pkg.all;
use work.campo_DAT_pkg.all;

package componentes_camino_dir_pkg is

component etiquetas_dir is
port (reloj: in std_logic;
	Etiq_ent: in tp_Etiq_e;
	Etiq_obs: in tp_Etiq_e;
	dir_rec: out st_dir_bloque;
	AF: out std_logic);
end component;


end package componentes_camino_dir_pkg;

