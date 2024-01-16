--
-- Copyright (c) 2017 XXXX, UPC
-- All rights reserved.
-- 

library ieee;
use ieee.std_logic_1164.all;

use work.cache_pkg.all;
use work.componentes_interface_proc_cache_pkg.all;

entity interface_cache_proc_multi is
	port (suministro: in tp_suministro;
		sum_cache: out tp_suministro);
end interface_cache_proc_multi;

architecture estruc of interface_cache_proc_multi is

begin
sum_cache <= suministro;

end;

