--
-- Copyright (c) 2017 XXXX, UPC
-- All rights reserved.
-- 

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.param_disenyo_pkg.all;
use work.camino_dat_pkg.all;
use work.controlador_pkg.all;
use work.componentes_cache_pkg.all;
use work.cache_pkg.all;
--! @image html cache.png 

package cache_unif_pkg is

component cache is
port (reloj, pcero: in std_logic;
		peticion: in tp_peticion;
		mdato: in st_elem_dat;
		resp_m: in tp_cntl_memoria_e;

		respuesta: out tp_respuesta;	-- DL i val
		pet_listo: out st_cache_listo;	-- listo
		pet_m: out tp_cntl_memoria_s	-- m_acc, m_pet, m_esc
		);
end component;
  

end package cache_unif_pkg;

