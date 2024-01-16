--
-- Copyright (c) 2017 XXXX, UPC
-- All rights reserved.
-- 

library ieee;
use ieee.std_logic_1164.all;

use work.param_disenyo_pkg.all;
use work.interface_cache_bus_dir_pkg.all;
use work.bus_dir_pkg.all;
use work.cache_pkg.all;

package componentes_memoria_interface_pkg is

component mem_con_interface_bus is 										
	port(reloj, pcero: in  std_logic;
		mpet_info_bus: in tp_peticion_info_dir;
		mresp_info_bus_c: out tp_bus_info_resp;
		
		mpet_cntl_bus: in tp_peticion_control;
		mresp_cntl_bus_c: out tp_bus_control_resp;
		
		obs_s: out tp_bus_observacion;
        fin_trans: out std_logic;
		
		suministra_bus: in tp_suministro;
		suministra: in std_logic);
end component;

end package componentes_memoria_interface_pkg;
