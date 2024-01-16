--
-- Copyright (c) 2017 XXXX, UPC
-- All rights reserved.
-- 

library ieee;
use ieee.std_logic_1164.all;

use work.interface_cache_bus_dir_pkg.all;
use work.bus_dir_pkg.all;
use work.retardos_bus_pkg.all;
use work.multis_pkg.all;
use work.cache_pkg.all;

package componentes_bus_multi_pkg is

component bus_multi is
port (e_info: in tp_bus_info;
	e_cntl: in tp_bus_control;
	e_suministra: in tp_bus_suministro;
	respuesta_cache: in tp_bus_suministro_cntl;
	s_info: out tp_peticion_info_dir;
	s_cntl: out tp_peticion_control;
	respuesta_cache_sum: out tp_suministro;
	s_suministra: out std_logic);
end component;

end package componentes_bus_multi_pkg;
