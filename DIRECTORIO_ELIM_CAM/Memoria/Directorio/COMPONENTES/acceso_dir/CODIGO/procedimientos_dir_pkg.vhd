--
-- Copyright (c) 2017 XXXX, UPC
-- All rights reserved.
-- 

library ieee;
use ieee.std_logic_1164.all;

use work.param_disenyo_pkg.all;
use work.controlador_multi_pkg.all;
use work.controlador_dir_elim_pkg.all;
use work.acciones_pkg.all;

package procedimientos_dir_pkg is

-- comprobacion de condiciones
function hay_peticion_procesador (signal pet: tp_contro_e) return boolean;  


-- realizacion de acciones
procedure por_defecto (variable v_s_control: inout tp_control_dir_s);


end package procedimientos_dir_pkg;

package body procedimientos_dir_pkg is

-- comprobacion de condiciones
function hay_peticion_procesador (signal pet: tp_contro_e) return boolean is
variable hay_peticion: boolean:= FALSE;
begin
	hay_peticion := (pet.acc = peticion_proc);
return (hay_peticion);
end hay_peticion_procesador;   


procedure por_defecto (variable v_s_control: inout tp_control_dir_s) is
begin
	v_s_control:= (pe_dir => '0',
				ED_pres => (others => '0'),
				ED_mod => '0',
				enviar_obs => '0',
				enviar_res => '0',
				enviar_sum => '0',
				eest_sum => '0'
				);
end procedure;


end package body procedimientos_dir_pkg;

