--
-- Copyright (c) 2017 XXXX, UPC
-- All rights reserved.
-- 

library ieee;
use ieee.std_logic_1164.all;

use work.param_disenyo_pkg.all;
use work.retardos_memorias_pkg.all;
use work.retardos_RegDes_pkg.all;

entity controlador_memo is
	port (MPET: in  std_logic;
		MVAL: out std_logic;
		suministra: in std_logic;
		reloj : in std_logic);
end controlador_memo;



architecture compor of controlador_memo is


signal suministro_control: std_logic := '0';

begin


	process (reloj, suministra) begin
		if rising_edge(reloj) then
			-- quan ens arriba que una cache suministra, ens apuntem que la seguent peticio de memoria no hem d'avisar que es valida
			if suministra = '1' then
				suministro_control <= '1' after retREGDES;
			
			-- quan suministrem, al cap de 3 cicles arribara una peticio de escritura, que es el bloc suministrat
			elsif suministro_control = '1' and MPET = '1' then
				suministro_control <= '0' after retREGDES;
			end if;
		end if;
	end process;

	MVAL <= MPET after retcnt_mem;
	--MVAL <= MPET after retcnt_mem when suministra = '0' and suministro_control = '0' else
	--		'0' after retcnt_mem;
end;

