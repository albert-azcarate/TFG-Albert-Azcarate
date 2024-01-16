--
-- Copyright (c) 2017 XXXX, UPC
-- All rights reserved.
-- 

library ieee;
use ieee.std_logic_1164.all;

use work.param_disenyo_pkg.all;
use work.retardos_RegDes_pkg.all;
use work.componentes_memoria_pkg.all;
--! @image html mem_mas_contro.png 

entity ensamblado_memoria is
	port (reloj: in  std_logic;
		ED: in  st_elem_dat;
		dir: in  st_dir;
		MPET, MLES: in  std_logic;
		
		MVAL: out std_logic;
		LD: out st_elem_dat);
end ensamblado_memoria;

architecture estruc of ensamblado_memoria is
--signal PEM: std_logic;
--signal reg_MPET: std_logic;
--begin
--
---- registro asociado al controlador de memoria
--regMPET: RC_1 port map (reloj => reloj, e => MPET , s => reg_MPET);
----controlador de memoria
--contro: controlador_memo port map(MPET => reg_MPET, MVAL => MVAL);
--
----memoria
--mem: memoria_mem port map (reloj => reloj, MPET => MPET, ED => ED, dir => dir, pe => MLES, LD => LD);
signal PEM: std_logic;
signal reg_MPET: std_logic;
signal reg_MPET_0: std_logic;
signal reg_MPET_1: std_logic;
signal reg_MPET_2: std_logic;
signal reg_MVAL: std_logic;
signal reg_MLES_0: std_logic;
signal reg_MLES_1: std_logic;
signal reg_MLES: std_logic;

signal DE: st_elem_dat;
signal DE_0: st_elem_dat;
signal DE_1: st_elem_dat;
signal dir_0: st_dir;
signal dir_1: st_dir;
signal dir_2: st_dir;
begin

-- registro asociado al controlador de memoria
regMPET: RC_1 port map (reloj => reloj, e => reg_MPET_2 , s => reg_MPET);
regMPET_2: RC_1 port map (reloj => reloj, e => reg_MPET_1 , s => reg_MPET_2);
regMPET_1: RC_1 port map (reloj => reloj, e => reg_MPET_0 , s => reg_MPET_1);
regMPET_0: RC_1 port map (reloj => reloj, e => MPET , s => reg_MPET_0);

regMLES: RC_1 port map (reloj => reloj, e => reg_MLES_1 , s => reg_MLES);
regMLES_1: RC_1 port map (reloj => reloj, e => reg_MLES_0 , s => reg_MLES_1);
regMLES_0: RC_1 port map (reloj => reloj, e => MLES , s => reg_MLES_0);


--controlador de memoria
contro: controlador_memo port map(MPET => reg_MPET, MVAL => MVAL);

-- 1 ciclo de retardo

	process (reloj) begin
		if rising_edge(reloj) then
			DE_1 <= ED after retREGDES;
			DE_0 <= DE_1 after retREGDES;
			DE <= DE_0 after retREGDES;
			dir_0 <= dir after retREGDES;
			dir_1 <= dir_0 after retREGDES;
			dir_2 <= dir_1 after retREGDES;
		end if;
	end process;


--memoria
mem: memoria_mem port map (reloj => reloj, MPET => reg_MPET_2, ED => DE, dir => dir_2, pe => reg_MLES, LD => LD);



end;


