--
-- Copyright (c) 2017 XXXX, UPC
-- All rights reserved.
-- 

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

use work.multis_pkg.all;
use work.interface_cache_bus_dir_pkg.all;
use work.interface_observador_pkg.all;
use work.cache_pkg.all;

package bus_dir_pkg is
subtype st_indice is natural range 0 to Nproc - 1;

type tp_bus_info is array(st_indice) of tp_peticion_info_dir;
type tp_bus_control is array(st_indice) of tp_peticion_control;
type tp_bus_suministro is array(st_indice) of std_logic;
type tp_bus_suministro_cntl is array(st_indice) of tp_suministro;

type tp_bus_info_resp is array(st_indice) of tp_respuesta_info_dir;
type tp_bus_control_resp is array(st_indice) of tp_respuesta_control_dir;

type tp_bus_observacion is array(st_indice) of tp_observacion;

end package bus_dir_pkg;
