--
-- Copyright (c) 2017 XXXX, UPC
-- All rights reserved.
-- 

library ieee;
use ieee.std_logic_1164.all;

use work.param_disenyo_pkg.all;
use work.multis_pkg.all;
use work.param_directorio_pkg.all;
use work.componentes_directorio_pkg.all;
use work.controlador_dir_elim_pkg.all;
use work.retardos_RegDes_pkg.all;
--! @image html ensam_directorio_A_2.png 

entity directorio is
	port (reloj, pcero: in  std_logic;
		dir: in  st_dir;
		iden_deco: in std_logic_vector(Nproc-1 downto 0);
		MPET: in  std_logic;
		MESC: in  std_logic;
		MEXP: in  std_logic;
		MVAL: in std_logic;
		suministra: in std_logic;
		cancel_pme: in std_logic;
		
		LD: out st_elem_dir;
		
		s_control: out tp_control_dir_s
		);
end directorio;

architecture estruc of directorio is
signal ED_pres_c, LD_pres_c: st_elem_dir;
signal ED_mod_c, LD_mod_c: std_logic;
signal pe_dir: std_logic;
signal s_MPET: std_logic;
signal s_ESC: std_logic;
signal s_EXP: std_logic;
signal s_dir: st_dir;
signal mux_dir: st_dir;

signal scontrol: tp_control_dir_s;

begin

-- interface fin
process (reloj, MESC) begin
	if rising_edge(reloj) then
		if MESC = '1' then
			s_ESC <= '1' after retREGDES;
		else 
			s_ESC <= '0' after retREGDES;
		end if;
		if MEXP = '1' then
			s_EXP <= '1' after retREGDES;
		else 
			s_EXP <= '0' after retREGDES;
		end if;
	end if;
end process;
process (reloj, dir) begin
	if rising_edge(reloj) then
			s_dir <= dir after retREGDES;
	end if;
end process;


mux_dir <= dir when MPET = '1' or cancel_pme = '1' else
			s_dir;

-- acceso al directorio
acc_dir: acceso_dir port map (reloj => reloj, pcero => pcero, iden_deco => iden_deco, MPET => MPET, MESC => s_ESC, MVAL => MVAL, MEXP => s_EXP, suministra => suministra, cancel_pme => cancel_pme, s_control => scontrol,  LD_pres => LD_pres_c, LD_mod => LD_mod_c);

--modificacion_escritura
mod_dir: lec_mod_esc port map (reloj => reloj, pcero => pcero, dir => mux_dir, MPET => MPET, pe => pe_dir, ED_pres => ED_pres_c, ED_mod => ED_mod_c, LD_pres => LD_pres_c, LD_mod => LD_mod_c);

pe_dir <= scontrol.pe_dir;
ED_pres_c <= scontrol.ED_pres;
ED_mod_c <= scontrol.ED_mod;
LD <= LD_pres_c;
s_control <= scontrol;


end;


