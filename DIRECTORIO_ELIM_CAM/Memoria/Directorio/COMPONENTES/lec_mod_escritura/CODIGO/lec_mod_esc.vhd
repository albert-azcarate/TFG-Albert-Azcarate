--
-- Copyright (c) 2017 XXXX, UPC
-- All rights reserved.
-- 

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.multis_pkg.all;
use work.param_directorio_pkg.all;
use work.retardos_memorias_pkg.all;
use work.retardos_RegDes_pkg.all;
use work.param_disenyo_pkg.all;
--! @image html modificacion_A.png 

entity lec_mod_esc is
	port (reloj, pcero: in std_logic;
		dir: in st_dir;
		MPET: in  std_logic;
		pe: in  std_logic;
		
		ED_pres: in st_elem_dir;
		ED_mod:  in std_logic;
		
		LD_pres: out st_elem_dir;
		LD_mod:  out std_logic
		);
end lec_mod_esc;

architecture compor of lec_mod_esc is
signal mod_lec_dir, mod_esc_dir: st_elem_dir;

signal vec_presencia: dir_mem := (others => (others => '0'));
signal vec_mod: dir_mod := (others => '0');
signal t_indice, t_prev: natural;
signal s_dir: st_dir;


begin

-- simulacion del decodificador
t_indice <= to_integer(unsigned(dir)) after ret_deco_mem;

process (reloj)
begin
	
	if (rising_edge(reloj)) then
		if MPET = '1' or pe = '1' then
			if (pe = '1') then
				vec_presencia(t_indice) <= ED_pres after ret_mem;
				vec_mod(t_indice) 		<= ED_mod after ret_mem;
			end if;
			
			LD_pres <= vec_presencia(t_indice) after ret_mem;
			LD_mod 	<= vec_mod(t_indice) after ret_mem;
		end if;
	end if;
end process;



end;

