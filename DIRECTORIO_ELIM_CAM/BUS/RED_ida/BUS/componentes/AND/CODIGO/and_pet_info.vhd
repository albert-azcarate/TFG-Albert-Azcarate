--
-- Copyright (c) 2017 XXXX, UPC
-- All rights reserved.
-- 

library ieee;
use ieee.std_logic_1164.all;

use work.interface_cache_bus_dir_pkg.all;
use work.retardos_inter_proc_cache_pkg.all;

entity and_pet_info is 
port(conc: in	std_logic;			-- concesion
	en: in	tp_peticion_info_dir;
	sal: out tp_peticion_info_dir);
end and_pet_info;

architecture compor of and_pet_info is

begin
	sal.acc <= en.acc after retAND when conc = '1' else '0' after retAND;
	sal.dir <= en.dir after retAND when conc = '1' else (others => '0') after retAND;
	sal.dato_E <= en.dato_E after retAND when conc = '1' else (others => '0') after retAND;
end compor;
