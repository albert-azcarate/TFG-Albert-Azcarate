--
-- Copyright (c) 2017 XXXX, UPC
-- All rights reserved.
-- 
library ieee;
use ieee.std_logic_1164.all;

use work.param_disenyo_pkg.all;
use work.multis_pkg.all;
use work.interface_observador_pkg.all;
use work.interface_cache_bus_dir_pkg.all;
use work.bus_dir_pkg.all;
use work.cache_pkg.all;
use work.param_directorio_pkg.all;
use work.controlador_dir_elim_pkg.all;

package componentes_directorio_pkg is

--component RC_1 is						
--	port (reloj: in std_logic;	
--         e: in std_logic;
--         s: out std_logic);
--end component;
--
component RD_obser_cntl_mem is							
  port (reloj: in std_logic;		
         e: in tp_suministro;
         s: out tp_suministro);
end component;

component RD_direc is							
  port (reloj: in std_logic;		
         e: in st_dir;
         s: out st_dir);
end component;

component lec_mod_esc is
	port (reloj,pcero: in std_logic;
		dir: in st_dir;
		MPET: in  std_logic;
		pe: in  std_logic;
		
		ED_pres: in st_elem_dir;
		ED_mod:  in std_logic;
		
		LD_pres: out st_elem_dir;
		LD_mod:  out std_logic);
end component;

component acceso_dir is
	port (reloj, pcero: in  std_logic;
		iden_deco: in std_logic_vector(Nproc-1 downto 0);
		MPET: in  std_logic;
		MESC: in  std_logic;
		MEXP: in  std_logic;
		MVAL: in std_logic;
		suministra: in std_logic;
		cancel_pme: in std_logic;
		
		s_control: out tp_control_dir_s;
		
		LD_pres: in st_elem_dir;
		LD_mod:  in std_logic);
end component;

component directorio is
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
		s_control: out tp_control_dir_s);
end component;

end package componentes_directorio_pkg;
