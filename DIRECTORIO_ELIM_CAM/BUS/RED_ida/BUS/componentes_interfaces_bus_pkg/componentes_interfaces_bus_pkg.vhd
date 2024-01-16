--
-- Copyright (c) 2017 XXXX, UPC
-- All rights reserved.
-- 

library ieee;
use ieee.std_logic_1164.all;

use work.interface_cache_bus_dir_pkg.all;

use work.interface_observador_pkg.all;

package componentes_interfaces_bus_pkg is

-- registros utilizados en las intefaces 
-- control
component RC_resp is			
  port (reloj, pcero: in std_logic;	
         e: in tp_respuesta_control_dir;
         s: out tp_respuesta_control_dir);
end component;

component RC_pet is						
  port (reloj, pcero: in std_logic;	
         e: in tp_peticion_control;
         s: out tp_peticion_control);
end component;

-- informacion
component RD_pet_info is	
  port (reloj, pcero: in std_logic;	
         e: in tp_peticion_info_dir;
         s: out tp_peticion_info_dir);
end component;

component RD_resp_info is		
  port (reloj, pcero: in std_logic;
         e: in tp_respuesta_info_dir;
         s: out tp_respuesta_info_dir);
end component;

-- interfaces memoria-bus: informacion y control
component interface_mem_bus_control is
	port (reloj, pcero	: in  std_logic;
		mpet_cntl_bus: in  tp_peticion_control;
		mpet_cntl_s: out  tp_peticion_control;
		obs_e: in tp_observacion;
		obs_s: out tp_observacion;
		mresp_cntl_e: in tp_respuesta_control_dir;
		mresp_cntl_bus: out tp_respuesta_control_dir);
end component;

component interface_mem_bus_info is
	port (reloj, pcero	: in  std_logic;
		mpet_info_bus: in  tp_peticion_info_dir;
		mpet_info_s: out  tp_peticion_info_dir;
		mresp_info_e: in tp_respuesta_info_dir;
		mresp_info_bus: out tp_respuesta_info_dir);
end component;

end package componentes_interfaces_bus_pkg;
