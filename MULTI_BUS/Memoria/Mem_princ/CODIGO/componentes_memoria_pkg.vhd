--
-- Copyright (c) 2017 XXXX, UPC
-- All rights reserved.
-- 
library ieee;
use ieee.std_logic_1164.all;

use work.param_disenyo_pkg.all;

package componentes_memoria_pkg is

component RC_1 is						
	port (reloj: in std_logic;	
         e: in std_logic;
         s: out std_logic);
end component;

component memoria_mem is
	port (reloj	: in  std_logic;
		MPET: in std_logic;
		ED		: in  st_elem_dat;
		dir	: in  st_dir;
		pe		: in  std_logic;
		LD		: out st_elem_dat;
		suministra: in std_logic);
end component;

component controlador_memo is
	port (MPET: in  std_logic;
		MVAL: out std_logic;
		suministra: in std_logic;
		reloj : in std_logic);
end component;

component ensamblado_memoria is
	port (reloj: in  std_logic;
		ED: in  st_elem_dat;
		dir: in  st_dir;
		MPET, MLES, MESC: in  std_logic;
		MVAL: out std_logic;
		LD: out st_elem_dat;
		suministra: in std_logic);
end component;

end package componentes_memoria_pkg;
