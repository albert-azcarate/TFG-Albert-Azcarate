--
-- Copyright (c) 2017 XXXX, UPC
-- All rights reserved.
-- 

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.param_disenyo_pkg.all;
use work.retardos_RegDes_pkg.all;
use work.bus_dir_pkg.all;
use work.interface_cache_bus_dir_pkg.all;
use work.componentes_interfaces_bus_multi_pkg.all;
use work.componentes_directorio_pkg.all;
use work.componentes_memoria_pkg.all;
use work.controlador_dir_elim_pkg.all;
use work.cache_pkg.all;
use work.param_directorio_pkg.all;
--! @image html mem_inter_bus.png 

entity mem_con_interface_bus is 										
	port(reloj, pcero: in  std_logic;
		mpet_info_bus: in tp_peticion_info_dir;
		mresp_info_bus_c: out tp_bus_info_resp;
		
		mpet_cntl_bus: in tp_peticion_control;
		mresp_cntl_bus_c: out tp_bus_control_resp;
		
		obs_s: out tp_bus_observacion;
        fin_trans: out std_logic;
		
		suministra_bus: in tp_suministro;
		suministra: in std_logic);
end mem_con_interface_bus;


architecture estructural of mem_con_interface_bus is

signal mpet_info_s: tp_peticion_info_dir;
signal mresp_info_e: tp_bus_info_resp;
signal mpet_cntl_s: tp_peticion_control;
signal mresp_cntl_e: tp_bus_control_resp;

signal suministra_s: std_logic;
signal suministra_bus_s: tp_suministro;
signal LD_DIR: st_elem_dir;

signal LD, ED_mem: st_elem_dat;
signal id_mem: std_logic_vector(1 downto 0);
signal dir_mem: st_dir;
signal dir_dir: st_dir;
signal MVAL_mem, MPET_mem, MLES_mem, MESC_mem, MESC_dir: std_logic;
signal indice_id: natural;
signal esperar_dato: std_logic;
signal fin, cancelar_pme: std_logic;
signal mpet_obs_info: tp_peticion_info_dir;
signal mpet_obs_control: tp_peticion_control;


signal scontrol_dir: tp_control_dir_s;

begin

-- interface fin
process (reloj, fin) begin
	if rising_edge(reloj) then
		if fin = '1' then
			fin_trans <= '1' after retREGDES;
		else 
			fin_trans <= '0' after retREGDES;
		end if;
	end if;
end process;



process (reloj, mpet_cntl_s, mpet_info_s) begin
    
	mresp_info_e <= (others => (dir => (others => '0'), 
								mdato_bus => (others => '0')
								)
					 );
	obs_s <= (others => (dir => (others => '0'), 
						pet => '0',
						les => '0',
						esc => '0',
						exp => '0')
			 );
    mresp_cntl_e <= (others => (m_val => '0'));
	
	
	indice_id <= to_integer(unsigned(id_mem));
	fin <= '0';
	
	-- 1 = estem esperant a que memoria contesti amb la dada
	if esperar_dato =  '1' then
	
		if scontrol_dir.enviar_obs = '1' then
			
			-- broadcast de observacion
			for i in obs_s'range loop
				-- si estas present al vector, enviem
				if i /= indice_id and LD_DIR(i) = '1' then
					obs_s(i) <= (dir => (mpet_obs_info.dir), 
								 pet => (mpet_obs_control.mpet),
								 les => (mpet_obs_control.mles),
								 esc => (mpet_obs_control.mesc),
								 exp => (scontrol_dir.eest_sum));
				else
					obs_s(i) <= (dir => (others => '0'), 
								 pet => '0',
								 les => '0',
								 esc => '0',
								 exp => '0');
				end if;
			end loop;
		
		elsif scontrol_dir.enviar_res = '1' then
			fin <= '1';
			
			-- broadcast de respuesta
			for i in mresp_info_e'range loop
				if i = indice_id then
					mresp_info_e(i).mdato_bus <= LD;
					mresp_info_e(i).dir <= (others => '0');
					mresp_cntl_e(i).m_val <= '1';
				else
					mresp_info_e(i).dir <= (others => '0');
					mresp_info_e(i).mdato_bus <= (others => '0');
					mresp_cntl_e(i) <= (m_val => '0');
				end if;
			end loop;
		
		elsif scontrol_dir.enviar_sum = '1' then
			fin <= '1';
		
			-- broadcast de respuesta
			for i in mresp_info_e'range loop
				if i = indice_id then
					mresp_info_e(i).mdato_bus <= suministra_bus_s.BL;
					mresp_info_e(i).dir <= suministra_bus_s.dir_rec;
					mresp_cntl_e(i).m_val <= '1';
				else
					mresp_info_e(i).dir <= (others => '0');
					mresp_info_e(i).mdato_bus <= (others => '0');
					mresp_cntl_e(i) <= (m_val => '0');
				end if;
			end loop;
		
		-- wait
		else
			mresp_info_e <= (others => (dir => (others => '0'), 
										mdato_bus => (others => '0')
										)
							 );
			obs_s <= (others => (dir => (others => '0'), 
								 pet => '0',
								 les => '0',
								 esc => '0',
								 exp => '0')
					 );
			mresp_cntl_e <= (others => (m_val => '0'));
		end if;		
	end if;
end process;


process (reloj, mpet_cntl_s, mpet_info_s) begin
	if rising_edge(reloj) then
		if esperar_dato = '1' then
			id_mem 				<= id_mem;
			mpet_obs_info 		<= mpet_obs_info;
			mpet_obs_control 	<= mpet_obs_control;
			
			if scontrol_dir.enviar_res = '1' or scontrol_dir.enviar_sum = '1' then
				esperar_dato <= '0';
			else 
				esperar_dato <= esperar_dato;
			end if;
		
		else 
			id_mem 				<= mpet_info_s.id 	after retREGDES;
			mpet_obs_info		<= mpet_info_s 		after retREGDES;
			mpet_obs_control 	<= mpet_cntl_s 		after retREGDES;
			
			if mpet_cntl_s.mpet = '1' then
				esperar_dato <= '1' after retREGDES;
			else
				esperar_dato <= '0';
			end if;
		end if;
	end if;
end process;

-- interface con respuesta observacion
inter_mem_bus_res_obs: RD_obser_cntl_mem port map (reloj => reloj, e => suministra_bus, s => suministra_bus_s);
inter_mem_bus_sum:	   RC_1 port map (reloj => reloj, e => suministra, s => suministra_s);


-- interface con el bus: informacion
inter_Mem_BUS_IN: interface_mem_bus_info port map(reloj => reloj, pcero => pcero, 
												mpet_info_bus => mpet_info_bus, mpet_info_s => mpet_info_s, 
												mresp_info_e => mresp_info_e, mresp_info_bus => mresp_info_bus_c);
-- interconexiones
dir_dir <= mpet_info_s.dir;
dir_mem <= mpet_info_s.dir when suministra_s = '0' else
			mpet_obs_info.dir; 
ED_mem <= mpet_info_s.dato_E;



--mresp_info_e.mdato_bus <= LD;
--mresp_info_e.dir <= (others => 'Z');


-- interface con el bus: informacion
inter_Mem_BUS_CON: interface_mem_bus_control port map (reloj => reloj, pcero => pcero, 
												mpet_cntl_bus => mpet_cntl_bus, mpet_cntl_s => mpet_cntl_s, 
												mresp_cntl_e => mresp_cntl_e, mresp_cntl_bus => mresp_cntl_bus_c);
-- interconexiones
MPET_mem <= mpet_cntl_s.mpet;
MLES_mem <= mpet_cntl_s.mles;
-- aixo es mexp perque nomes actualizem memoria a mexp
MESC_mem <= mpet_cntl_s.mexp;
MESC_dir <= mpet_cntl_s.mesc;


--mresp_cntl_e.m_val <= MVAL_mem; --this goes out

cancelar_pme <= suministra_bus_s.cancel_pme;

-- directorio
direct: directorio port map (pcero => pcero, 
							reloj => reloj, 
							dir => dir_mem, 
							iden_deco => id_mem,
							MPET => MPET_mem,
							MESC => MESC_dir,
							MEXP => MESC_mem,
							MVAL => MVAL_mem,  
							suministra => suministra_s,
							cancel_pme => cancelar_pme,
							
							LD => LD_DIR,
							s_control => scontrol_dir
							);

-- memoria
memoria: ensamblado_memoria port map (reloj => reloj, ED => ED_mem, dir => dir_mem, MPET => MPET_mem, MLES => MLES_mem, MESC => MESC_mem, MVAL => MVAL_mem, LD => LD, suministra => suministra);

end;

