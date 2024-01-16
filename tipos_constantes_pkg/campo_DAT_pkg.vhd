--
-- Copyright (c) 2017 XXXX, UPC
-- All rights reserved.
-- 

library ieee;
use ieee.std_logic_1164.all;

use work.param_disenyo_pkg.all;

package campo_DAT_pkg is

type tp_mdat_e is record
    acc: std_logic;
    dir: st_dir_conjunto;
    esc: std_logic_vector(tam_bloque_bytes-1 downto 0);	--allow 2 enable bits 
    DE: st_bloque_dat;
end record;

subtype DL is st_elem_dat;

type tp_Datos_e is record
	acc: std_logic;
	dir: st_dir_conjunto;
    esc : std_logic_vector(tam_bloque_bytes-1 downto 0);
    DE: st_bloque_dat;
end record;

end package campo_DAT_pkg;

