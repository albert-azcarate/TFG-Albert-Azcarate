--
-- Copyright (c) 2017 XXXX, UPC
-- All rights reserved.
-- 

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

use work.param_disenyo_pkg.all;
use work.controlador_pkg.all;
use work.retardos_controlador_pkg.all;
use work.acciones_pkg.all;
use work.procedimientos_controlador_pkg.all;

use std.textio.all;
use ieee.std_logic_textio.all;



entity prueba_controlador is 

end entity;

architecture prueba of prueba_controlador is

component controlador is 		 
port (reloj, pcero: in std_logic;
		pet: in tp_contro_e;
		s_estado: in tp_contro_cam_estado;
		s_control: out tp_contro_cam_cntl;
		resp: out tp_contro_s;
		resp_m: in tp_cntl_memoria_e;
		pet_m: out tp_cntl_memoria_s);
end component;

procedure wait_until_falling_edges(signal reloj: in std_logic; n: in integer) is
begin
    for i in 1 to n loop
        wait until falling_edge(reloj);
    end loop;
end procedure;


signal pzero : std_logic;
signal peti : tp_contro_e ;
signal s_est : tp_contro_cam_estado;
signal s_cont : tp_contro_cam_cntl;
signal resp : tp_contro_s;
signal resp_m : tp_cntl_memoria_e;
signal pet_m : tp_cntl_memoria_s;

signal reloj: std_logic;

shared variable final : boolean := false;

begin


contr : controlador port map (reloj => reloj, pcero => pzero, pet => peti, s_estado => s_est, s_control => s_cont, resp => resp, resp_m => resp_m, pet_m => pet_m);

process


begin
    
	
	pzero <= '0';
    wait_until_falling_edges(reloj,8);
	
-- LECTURA HIT
	-- pet from CPU
	peti.acc <= '1';
	peti.esc <= '0';
    wait_until_falling_edges(reloj,1);
	
	-- Hit on READ
	s_est.AF <= '1';
	s_est.EST <= "01";
    wait_until_falling_edges(reloj,1);
	
	-- stop peti
	peti.acc <= '0';
    wait_until_falling_edges(reloj,5);
	
-- LECTURA MISS
	-- pet from CPU
	peti.acc <= '1';
	peti.esc <= '0';
    wait_until_falling_edges(reloj,1);
	
	-- mis on READ CMPET
	s_est.AF <= '0';
	s_est.EST <= "00";
    wait_until_falling_edges(reloj,1);
	
	-- PMN
	resp_m.m_val <= '0';
    wait_until_falling_edges(reloj,2);
	resp_m.m_val <= '1';
	
	-- ABN
    wait_until_falling_edges(reloj,1);
	resp_m.m_val <= '0';
	
	-- stop peti
	peti.acc <= '0';
    wait_until_falling_edges(reloj,5);
	

-- LECTURA MISS i EXPULSION
	-- pet from CPU
	peti.acc <= '1';
	peti.esc <= '0';
    wait_until_falling_edges(reloj,1);
	
	-- mis on READ CMPET
	s_est.AF <= '0';
	s_est.EST <= "11";
    wait_until_falling_edges(reloj,1);
	
	-- LBE
    wait_until_falling_edges(reloj,1);
	
	-- AME
	resp_m.m_val <= '0';
    wait_until_falling_edges(reloj,2);
	resp_m.m_val <= '1';
	
	-- AME
    wait_until_falling_edges(reloj,1);
	resp_m.m_val <= '0';
    wait_until_falling_edges(reloj,2);
	resp_m.m_val <= '1';
	
	-- ABN
    wait_until_falling_edges(reloj,1);
	resp_m.m_val <= '0';
	
	-- stop peti
	peti.acc <= '0';
    wait_until_falling_edges(reloj,5);
	

-- ESCRITURA HIT
	-- pet from CPU
	peti.acc <= '1';
	peti.esc <= '1';
    wait_until_falling_edges(reloj,1);
	
	-- Hit on WRITE
	s_est.AF <= '1';
	s_est.EST <= "01";
    wait_until_falling_edges(reloj,1);
	
	-- stop peti
	peti.acc <= '0';
    wait_until_falling_edges(reloj,5);
	
-- ESCRITURA MISS
	-- pet from CPU
	peti.acc <= '1';
	peti.esc <= '1';
    wait_until_falling_edges(reloj,1);
	
	-- miss on WRITE CMPET
	s_est.AF <= '1';
	s_est.EST <= "00";
    wait_until_falling_edges(reloj,1);
	
	-- PMN
	resp_m.m_val <= '0';
    wait_until_falling_edges(reloj,2);
	resp_m.m_val <= '1';
	
	-- ABN
    wait_until_falling_edges(reloj,1);
	resp_m.m_val <= '0';
	
	-- stop peti
	peti.acc <= '0';
    wait_until_falling_edges(reloj,5);
	
	
-- ESCRITURA MISS i EXPULSION
	-- pet from CPU
	peti.acc <= '1';
	peti.esc <= '1';
    wait_until_falling_edges(reloj,1);
	
	-- miss on WRITE CMPET
	s_est.AF <= '0';
	s_est.EST <= "11";
    wait_until_falling_edges(reloj,1);
	
	-- LBE
    wait_until_falling_edges(reloj,1);
	
	-- AME
	resp_m.m_val <= '0';
    wait_until_falling_edges(reloj,2);
	resp_m.m_val <= '1';
	
	-- AME
    wait_until_falling_edges(reloj,1);
	resp_m.m_val <= '0';
    wait_until_falling_edges(reloj,2);
	resp_m.m_val <= '1';
	
	-- ABN
    wait_until_falling_edges(reloj,1);
	resp_m.m_val <= '0';
	
	-- stop peti
	peti.acc <= '0';
    wait_until_falling_edges(reloj,5);
	
	
	
	
	
    assert false report "Comprobacion finalizada." severity note;
	 final := true;
    wait;
end process;

  
rlj:process
begin
  if final = false then
    reloj <= '0';
    wait for 10 ns;
    reloj <= '1';
    wait for 10 ns;
	else
	  wait;
	end if;
end process;
 
end prueba;

