--
-- Copyright (c) 2017 XXXX, UPC
-- All rights reserved.
-- 

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.param_disenyo_pkg.all;
use work.acciones_pkg.all;
use work.componentes_memoria_pkg.all;
use work.retardos_controlador_pkg.all;
use work.retardos_memorias_pkg.all;
use work.procedimientos_dir_pkg.all;
use work.controlador_dir_elim_pkg.all;
use work.multis_pkg.all;
use work.param_directorio_pkg.all;
--! @image html acceso_A.png 

entity acceso_dir is
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
		LD_mod:  in std_logic
		);
end acceso_dir;

architecture estruc of acceso_dir is
signal reg_dir: st_dir;
signal reg_MPET: std_logic;
signal estado, prxestado: tipoestado; 
signal id_indice : integer;
signal cero: st_elem_dir;
signal despla: integer range 0 to 2*(Nproc) -1;
signal uno: st_elem_dir;
signal vector_indice: st_elem_dir;


begin

cero <= (others => '0');
uno <= (Nproc-1 downto 1 => '0', 0 => '1');
despla <= to_integer(unsigned(iden_deco));
vector_indice <= std_logic_vector(shift_left(unsigned(uno), despla));

-- simulacion del decodificador
id_indice <= to_integer(unsigned(iden_deco)) after ret_deco_mem;




-- registro de estado
	reg_estado: process (reloj, pcero)
		variable v_estado: tipoestado;
	begin
		if pcero = puesta_cero then
			v_estado := DES;	
		elsif rising_edge(reloj) then
			v_estado := prxestado;	
		end if;
		estado <= v_estado after retardo_estado;
	end process;  


-- logica proximo estado
	process (reloj, pcero, estado, suministra, MPET, MVAL, MESC, LD_pres, LD_mod, cero, id_indice, MEXP)
			variable v_prxestado	: tipoestado := DES;
		begin		
		
		if pcero = puesta_cero then
			v_prxestado := DES;
		else	
			v_prxestado := DES;
			
			case estado is

				when DES =>
					if MPET = '1' then
						v_prxestado := CMP;
					end if;
					
				when CMP =>
					-- si expulsio:
					if MEXP = '1' then
						v_prxestado := EXP;
						
					elsif LD_pres /=  cero then
						-- bloque en M 
						if LD_mod = '1' then
							v_prxestado := OBS_S;
						
						-- bloque en L
						else
							if MESC = '1' then
								v_prxestado := OBS_I;
							-- lectura
							else 
								v_prxestado := NUEV;
							end if;
						end if;
				
					-- bloque no presente
					else
						v_prxestado := NUEV;
					end if;
					
				when OBS_S =>
					-- fer la escritura al dir
					v_prxestado := ESPS;
					
				when OBS_I =>
					-- esperar a memoria
					v_prxestado := ESPM;
					
				when NUEV =>
					-- fer la escritura al dir
					v_prxestado := ESPM;
				
				when EXP =>
					-- fer la escritura al dir
					v_prxestado := RES_X;
					
				when ESPM =>
					if MVAL /= '1' then
						v_prxestado := ESPM;
					else
						v_prxestado := RES_M;
					end if;
				
				when  ESPS => 
					if suministra /= '1' then
						v_prxestado := ESPS;
					else
                        if cancel_pme = '1' then
                            v_prxestado := RES_A;
                        else
                            v_prxestado := RES_S;
                        end if;
					end if;
				
				when RES_A =>
					v_prxestado := DES;
                    
				when RES_S =>
					v_prxestado := DES;
					
				when RES_M =>
					v_prxestado := DES;
					
				when RES_X =>
					v_prxestado := DES;
					
			end case;
		end if;
		
		
		prxestado <= v_prxestado after retardo_logica_prx_estado;
	end process;
	
-- logica salidas estado
	process (reloj, pcero, estado, suministra, MPET, MVAL, MESC, LD_pres, LD_mod, cero, id_indice, MEXP, vector_indice)
		variable v_s_control: tp_control_dir_s;
	
		begin

		if pcero = puesta_cero then
			por_defecto(v_s_control);
		else
			por_defecto(v_s_control);
			
			case estado is

				when DES =>
					
					if MPET = '1' then
						-- la lectura ja es fa de forma automatica
					end if;
					
				when CMP =>
					v_s_control.pe_dir := '1';
					
					-- si expulsio:
					if MEXP = '1' then
						--v_prxestado := EXP;
						v_s_control.ED_pres := LD_pres xor vector_indice;
						v_s_control.ED_pres(id_indice) := '0';
						-- sempre marcarem com No mod, perque si id ho tenia en L o M, ara ha de ser 0 
						v_s_control.ED_mod := '0';
						
					elsif LD_pres /=  cero then
						
						-- bloque en M 
						if LD_mod = '1' then
							-- enviamos la observacion a la cache
							v_s_control.enviar_obs := '1';
							v_s_control.eest_sum   := '1';
							
							--v_prxestado := OBS_S;
							if MESC = '1' then
								-- mod = 1 and VP = id;
								v_s_control.ED_mod := '1';
								--v_s_control.ED_pres := (others => '0'); implicit
								v_s_control.ED_pres(id_indice) := '1';
							-- lectura
							else 
								-- mod = 1 and VP = id;
								v_s_control.ED_mod := '0';
								v_s_control.ED_pres := LD_pres or vector_indice;
							
							end if;
						-- bloque en L
						else
							if MESC = '1' then 
                                v_s_control.eest_sum := '0';
                                
								--v_prxestado := OBS_I;
								-- enviamos la observacion a la cache
								v_s_control.enviar_obs := '1';
								
								-- mod = 1 and VP = id;
								v_s_control.ED_mod := '1';
								--v_s_control.ED_pres := (others => '0'); implicit
								v_s_control.ED_pres(id_indice) := '1';
							-- lectura
							else 
								--v_prxestado := NUEV;
								-- mod = 1 and VP = id;
								v_s_control.ED_mod := '0';
								v_s_control.ED_pres := LD_pres or vector_indice;
							end if;
						end if;
						-- bloque no presente
					else
						-- v_prxestado := NUEV;
						if MESC = '1' then
							-- mod = 1 and VP = id;
							v_s_control.ED_mod := '1';
							--v_s_control.ED_pres := (others => '0');
							v_s_control.ED_pres(id_indice) := '1';
						-- lectura
						else 
							-- mod = 1 and VP = id;
							v_s_control.ED_mod := '0';
							v_s_control.ED_pres := LD_pres or vector_indice;
						end if;
					end if;
					
				when OBS_S =>
					-- es fa la escritura al dir
					--v_prxestado := ESPS;
					
				when OBS_I =>
					-- es fa la escritura al dir
					-- esperar a memoria
					-- v_prxestado := ESPM;
					
				when NUEV =>
					-- es fa la escritura al dir
					-- esperar a memoria
					--v_prxestado := ESPM;
					
				when EXP =>
					-- es fa la escritura al dir
					-- esperar a memoria
					-- v_prxestado := RES_M;
					v_s_control.enviar_res := '1';
					
				when ESPM =>
					if MVAL /= '1' then
						-- v_prxestado := ESPM;
					else
						--v_prxestado := RES_M;
						v_s_control.enviar_res := '1';
					end if;
				
				when  ESPS => 
					if cancel_pme = '1' then
						v_s_control.pe_dir := '1';
						v_s_control.ED_mod := '0';
						v_s_control.ED_pres(id_indice) := '1';
					end if;
					
					if suministra /= '1' then
						--v_prxestado := ESPS;
					else
						--v_prxestado := RES_S;
						v_s_control.enviar_sum := '1';
					end if;
				
				when RES_A =>
					--v_prxestado := DES;
                    
				when RES_S =>
					--v_prxestado := DES;
					
				when RES_M =>
					--v_prxestado := DES;
					
				when RES_X =>
					--v_prxestado := DES;
					
			end case;
			
		end if;
		
		
	s_control 	<= v_s_control 	after retardo_logica_salida;
		
	end process;

end;


