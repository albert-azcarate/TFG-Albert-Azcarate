--
-- Copyright (c) 2017 XXXX, UPC
-- All rights reserved.
-- 

library ieee;
use ieee.std_logic_1164.all;

use work.param_disenyo_pkg.all;
use work.componentes_cache_multi_interface_pkg.all;
use work.componentes_memoria_interface_pkg.all;
use work.cache_pkg.all;
use work.interface_cache_bus_dir_pkg.all;
use work.interface_observador_pkg.all;
use work.componentes_arbitro_pkg.all;
use work.multis_pkg.all;
use work.bus_dir_pkg.all;
use work.componentes_bus_multi_pkg.all;
use work.retardos_RegDes_pkg.all;
--! @image html sistema_multiprocesador.png 

entity ensamblado_multi is 										
	port(reloj, pcero: in  std_logic;
		arb_control: in st_arb_peticiones;
		pet_proc: in tp_peticiones_multi;
		pet_listo: out tp_cache_listo_multi;
		resp_cache: out tp_respuesta_multi);
end ensamblado_multi;


architecture estructural of ensamblado_multi is

signal mpet_cntl_bus: tp_peticion_control;
signal mpet_cntl_bus_sumi: tp_peticion_control;
signal mresp_cntl_bus_c: tp_bus_control_resp;
signal mresp_cntl_bus: tp_respuesta_control_dir;
signal mresp_cntl_bus_sumi: tp_respuesta_control_dir;
signal mresp_cntl_bus_bloq: tp_respuesta_control_dir;

signal mpet_info_bus: tp_peticion_info_dir;
signal mpet_info_bus_sumi: tp_peticion_info_dir;
signal mresp_info_bus_c: tp_bus_info_resp;
signal mresp_info_bus: tp_respuesta_info_dir;
signal mresp_info_bus_sumi: tp_respuesta_info_dir;
signal mresp_info_bus_bloq: tp_respuesta_info_dir;

signal mpet_cntl_bus_c: tp_bus_control;
signal mpet_info_bus_c: tp_bus_info;
signal suministra: tp_bus_suministro;
signal suministra_cntl_bus: tp_bus_suministro_cntl;
signal suministra_mem: std_logic;
signal respuesta_cache_sum: tp_suministro;
signal respuesta_cache_sum_ret: tp_suministro;

signal arb_peticiones: st_arb_peticiones;
signal arb_concesiones: st_arb_concesiones;

signal obs_bus: tp_bus_observacion;
signal bloq: std_logic;
signal prev_bloq: std_logic;
signal fin_trans: std_logic;

begin

--arbitro --[REVISAR aixo hauria de ser mresp bus_sumi?]
arbitraje: arbitro port map (reloj => reloj, pcero => pcero,
										--fin_trans => mresp_cntl_bus.m_val,
										--fin_trans => mresp_cntl_bus_sumi.m_val,
                                        fin_trans => fin_trans,
										arb_peticiones => arb_peticiones, 
										arb_concesiones => arb_concesiones);

--proc_multi: for i in 0 to Nproc-1 generate
-- cache con interfaces procesador y bus
--cache: cache_multi_con_interface_bus port map (reloj => reloj, pcero => pcero, 
--										arb_peticion => arb_peticiones(i), arb_concesion => arb_concesiones(i),
--										pet_proc => pet_proc(i), pet_listo => pet_listo(i), 
--										obs_bus => obs_bus,
--										resp_cache => resp_cache(i), 
--										suministro_cache => suministra_cntl_bus(i), 
--										mresp_cntl_bus => mresp_cntl_bus_sumi, mpet_cntl_bus => mpet_cntl_bus_c(i), suministro => suministra(i), 
--										mresp_info_bus => mresp_info_bus_sumi, mpet_info_bus => mpet_info_bus_c(i));
--end generate;
--
proc_multi: for i in 0 to Nproc-1 generate
-- cache con interfaces procesador y bus
cache: cache_multi_con_interface_bus port map (reloj => reloj, pcero => pcero, 
										arb_peticion => arb_peticiones(i), arb_concesion => arb_concesiones(i),
										pet_proc => pet_proc(i), pet_listo => pet_listo(i), 
										obs_bus => obs_bus(i),
										resp_cache => resp_cache(i), 
										suministro_cache => suministra_cntl_bus(i), 
										mresp_cntl_bus => mresp_cntl_bus_c(i), mpet_cntl_bus => mpet_cntl_bus_c(i), suministro => suministra(i), 
										mresp_info_bus => mresp_info_bus_c(i), mpet_info_bus => mpet_info_bus_c(i),
										identificador => i);
end generate;

-- memoria con interface al bus
memoria: mem_con_interface_bus port map (reloj => reloj, pcero => pcero, 
										mpet_info_bus => mpet_info_bus_sumi, mresp_info_bus_c => mresp_info_bus_c, 
										mpet_cntl_bus => mpet_cntl_bus_sumi, mresp_cntl_bus_c => mresp_cntl_bus_c, 
										obs_s => obs_bus, suministra => suministra_mem, suministra_bus => respuesta_cache_sum,
                                        fin_trans => fin_trans);
-- memoria con interface al bus
--memoria: mem_con_interface_bus port map (reloj => reloj, pcero => pcero, 
--										mpet_info_bus => mpet_info_bus_sumi, mresp_info_bus => mresp_info_bus, 
--										mpet_cntl_bus => mpet_cntl_bus_sumi, mresp_cntl_bus => mresp_cntl_bus, suministra => suministra_mem);




-- interconexiones: BUS
bus_mu: bus_multi port map (e_info => mpet_info_bus_c, e_cntl => mpet_cntl_bus_c, s_info => mpet_info_bus, s_cntl => mpet_cntl_bus, e_suministra => suministra, s_suministra => suministra_mem, respuesta_cache => suministra_cntl_bus, respuesta_cache_sum => respuesta_cache_sum);



-- bloqueos 
process (reloj) begin
	if rising_edge(reloj) then
		respuesta_cache_sum_ret <= respuesta_cache_sum;
		prev_bloq <= bloq;
	end if;
end process;



bloq <= respuesta_cache_sum_ret.bloqueo;

-- guardar la info de antes de la petición
process (reloj) begin
	if rising_edge(reloj) then
		if mresp_cntl_bus.m_val = '1' then
			mresp_info_bus_bloq <= mresp_info_bus after retREGDES;
			mresp_cntl_bus_bloq <= mresp_cntl_bus after retREGDES;
		elsif suministra_mem = '1' then
			mresp_cntl_bus_bloq.m_val <= '0' after retREGDES;
		end if;
	end if;
end process;




-- conexion de observacion
--obs_bus.dir <= mpet_info_bus.dir; 
--obs_bus.pet <= mpet_cntl_bus.mpet; 
--obs_bus.les <= mpet_cntl_bus.mles;
--obs_bus.esc <= mpet_cntl_bus.mesc; 



-- conexiones de suministro
mresp_info_bus_sumi.dir <= (others => '0') when respuesta_cache_sum.bloqueo = '1' else
						--respuesta_cache_sum.dir_rec when suministra_mem = '1' else 
						mresp_info_bus_bloq.dir when prev_bloq = '1' and bloq = '0' else
						mresp_info_bus.dir;
						
mresp_info_bus_sumi.mdato_bus <= (others => '0') when respuesta_cache_sum.bloqueo = '1' else
						--respuesta_cache_sum.BL  when suministra_mem = '1' else  
						mresp_info_bus_bloq.mdato_bus when prev_bloq = '1' and bloq = '0' else
						mresp_info_bus_bloq.mdato_bus when bloq = '1' and respuesta_cache_sum.bloqueo = '0' else
						mresp_info_bus.mdato_bus;

						
mresp_cntl_bus_sumi.m_val <= '0' when respuesta_cache_sum.bloqueo = '1' else
						--'1' when suministra_mem = '1' else
						mresp_cntl_bus_bloq.m_val when prev_bloq = '1' and bloq = '0' else
						mresp_cntl_bus_bloq.m_val when bloq = '1' and respuesta_cache_sum.bloqueo = '0' else
						mresp_cntl_bus.m_val;

						
-- suministro a memoria
mpet_info_bus_sumi.dir 	<= (others => '0') when respuesta_cache_sum.bloqueo = '1' else
						mpet_info_bus.dir when suministra_mem = '0' else
						--respuesta_cache_sum_ret.dir_rec; 
						respuesta_cache_sum.dir_rec; 
						
mpet_info_bus_sumi.dato_E <= (others => '0') when respuesta_cache_sum.bloqueo = '1' else
						mpet_info_bus.dato_E when suministra_mem = '0' else
						--respuesta_cache_sum_ret.BL;
						respuesta_cache_sum.BL;
                        
mpet_info_bus_sumi.id <= (others => '0') when respuesta_cache_sum.bloqueo = '1' else
						mpet_info_bus.id when suministra_mem = '0' else
						--respuesta_cache_sum_ret.BL;
						-- this ?respuesta_cache_sum.id;
                        (others => '0');
						
mpet_cntl_bus_sumi.mpet <= '0' when respuesta_cache_sum.bloqueo = '1' else
						mpet_cntl_bus.mpet when suministra_mem = '0' else
						--'1';
						'0';
						
mpet_cntl_bus_sumi.mles <= '0' when respuesta_cache_sum.bloqueo = '1' else
						mpet_cntl_bus.mles when suministra_mem = '0' else
						--'1';
						'0';

mpet_cntl_bus_sumi.mesc <= '0' when respuesta_cache_sum.bloqueo = '1' else
						'1' when mpet_cntl_bus.mesc = '1'  else
						--'1' when suministra_mem = '1' or mpet_cntl_bus.mesc = '1'  else
						'0';
                        
mpet_cntl_bus_sumi.mexp <= '0' when respuesta_cache_sum.bloqueo = '1' else
						--'1' when suministra_mem = '1' or mpet_cntl_bus.mexp = '1'  else
						'1' when mpet_cntl_bus.mexp = '1'  else
						'0';

end;

