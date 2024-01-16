--
-- Copyright (c) 2017 XXXX, UPC
-- All rights reserved.
-- 

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.interface_cache_bus_dir_pkg.all;
use work.retardos_RegDes_pkg.all;
use work.cache_pkg.all;
use work.componentes_interfaces_bus_multi_pkg.all;
--! @image html interface_cache_bus_control.png 

entity interface_cache_bus_control is
	port (reloj, pcero: in  std_logic;
		arb_conc: std_logic;
		mpet_cntl_e: in  tp_peticion_control;
		mpet_cntl_bus: out  tp_peticion_control;
		suministro_e: in std_logic;
		suministro_s: out std_logic;
		suministro_cntl_e : in tp_suministro;
		suministro_cntl_s : out tp_suministro;
		mresp_cntl_bus: in tp_respuesta_control_dir;
		mresp_cntl_s: out tp_respuesta_control_dir);
end interface_cache_bus_control;

architecture estruc of interface_cache_bus_control is
signal mpet_cntl_conc: tp_peticion_control;
begin

-- interface para emitir señal en el bus si se dispone de la concesion: control
and_conc_cntl: and_pet_control port map (conc => arb_conc, en => mpet_cntl_e, sal => mpet_cntl_conc);
reg_pet_cntl: RC_pet port map(reloj => reloj, pcero => pcero, e => mpet_cntl_conc, s => mpet_cntl_bus);

-- interface de respuesta: control
reg_resp_cntl: RC_resp port map(reloj => reloj, pcero => pcero, e => mresp_cntl_bus, s => mresp_cntl_s);

	process (reloj, pcero) begin
		if pcero = '1' then 
			suministro_s <= '0' after retREGDES;
		elsif rising_edge(reloj) then
			suministro_s <= suministro_e after retREGDES;
		end if;
	end process;
	
	
	
	process (reloj, pcero) begin
		if pcero = '1' then 
			suministro_cntl_s.bloqueo <= '0' after retREGDES;
			suministro_cntl_s.DL <= (others => '0') after retREGDES;
			suministro_cntl_s.BL <= (others => '0') after retREGDES;
			suministro_cntl_s.dir_rec <= (others => '0') after retREGDES;
			suministro_cntl_s.val <= '0' after retREGDES;
		elsif rising_edge(reloj) then
			suministro_cntl_s <= suministro_cntl_e after retREGDES;
		end if;
	end process;

end;

