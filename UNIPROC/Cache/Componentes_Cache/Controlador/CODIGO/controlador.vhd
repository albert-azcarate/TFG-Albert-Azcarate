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
--! @image html controlador.png 

entity controlador is
port (reloj, pcero: in std_logic;
		pet: in tp_contro_e;
		s_estado: in tp_contro_cam_estado;
		s_control: out tp_contro_cam_cntl;
		resp: out tp_contro_s;
		dirINI: out st_dir_bloque;
		resp_m: in tp_cntl_memoria_e;
		pet_m: out tp_cntl_memoria_s);
end;

architecture compor of controlador is

--type tipoestado is (INI, DES, CMPET, LBE, PME, PMN, ABN, ESC, LEC);
signal estado, prxestado: tipoestado;
signal derechos_acceso: std_logic;
signal init, prxinit : std_logic_vector(2 downto 0) := "000";


begin

	-- registro de estado
	reg_estado: process (reloj, pcero)
		variable v_estado: tipoestado;
		variable v_init : std_logic_vector(2 downto 0);
	begin
		if pcero = puesta_cero then
			v_estado := INI;	
			v_init := "000";
		elsif rising_edge(reloj) then
			v_estado := prxestado;	
			v_init := prxinit;
		end if;
		estado <= v_estado after retardo_estado;
		init <= v_init after retardo_estado;
	end process;    




	-- logica proximo estado
	process (reloj, pcero, pet, derechos_acceso, s_estado, resp_m, init, estado)
			variable v_prxestado	: tipoestado := DES;
			variable v_prxinit	:std_logic_vector(2 downto 0);
		begin
		if pcero = puesta_cero then
			v_prxestado := INI;
			v_prxinit := "000";
		else 
			v_prxinit := "000";
			
			case estado is
				when INI =>
					if init = "111" then
						v_prxestado := DES;
					else 
						v_prxestado := INI;
						v_prxinit := init + '1';
					end if;
				when DES =>
					if hay_peticion_procesador(pet) then
						v_prxestado := CMPET;
					else
						v_prxestado := DES;
					end if;
					
				when CMPET =>
					if es_acierto_lectura(pet,derechos_acceso) then
						v_prxestado := LEC;
					elsif es_acierto_escritura(pet,derechos_acceso) then
						--if bloque_virgen(s_estado) then 
						--	-- BusUpgr 
						--	v_prxestado := PMN;
						--else
							v_prxestado := ESC;
						--end if;
					elsif es_fallo_lectura(pet,derechos_acceso) then
						if bloque_virgen(s_estado) then
							v_prxestado := PMN;
						else
							v_prxestado := LBE;
						end if;
					--elsif es_fallo_escritura(pet,derechos_acceso) then
					else
						if bloque_virgen(s_estado) then
							v_prxestado := PMN;
						else
							v_prxestado := LBE;
						end if;
					end if;
				
				when LBE =>
					v_prxestado := PME;
					
				when PME =>
					v_prxestado := ESBE;
					
				when ESBE =>
					if hay_respuesta_memoria(resp_m) then
						v_prxestado := PMN;
					else
						v_prxestado := ESBE;
					end if;	
					
				when PMN =>
					v_prxestado := ESBN;
					
				when ESBN =>
					if hay_respuesta_memoria(resp_m) then
						v_prxestado := ABN;
					else
						v_prxestado := ESBN;
					end if;	
					
				when ABN =>
					if es_lectura(pet) then
						v_prxestado := LEC;
					--elsif es_escritura(pet) then
					else
						v_prxestado := ESC;
					end if;
					
				when ESC =>
					v_prxestado := DES;
					
				when LEC =>
					v_prxestado := DES;
			
			end case;
		end if;
		
		prxestado <= v_prxestado after retardo_logica_prx_estado;
		prxinit <= v_prxinit after retardo_logica_prx_estado;
	end process;
	
	
	
	-- logica salidas
	process (reloj, pcero, pet, estado, derechos_acceso, s_estado, resp_m )
		variable v_s_control : tp_contro_cam_cntl;
		variable v_resp : tp_contro_s;
		variable v_pet_m : tp_cntl_memoria_s;
	begin
		if pcero = puesta_cero then
			por_defecto(v_s_control, v_pet_m, v_resp);
		else 

			
			por_defecto(v_s_control, v_pet_m, v_resp);
		
			case estado is
				when INI =>
					interfaces_en_CURSO(v_resp);
					actualizar_estado(v_s_control,INV_E);
					actualizar_etiqueta(v_s_control);
					actu_datos_ini(v_s_control);
				when DES =>
					if hay_peticion_procesador(pet) then
						lectura_etiq_estado(v_s_control);
					end if;
					
				when CMPET =>
					interfaces_en_CURSO(v_resp);
					if es_acierto_lectura(pet,derechos_acceso) then
						lectura_datos(v_s_control);
						
					elsif es_acierto_escritura(pet,derechos_acceso) then
						actualizar_estado(v_s_control,MODIF_E);
						if (s_estado.BYTE = '0') then
							actualizar_dato_0(v_s_control);
						else
							actualizar_dato_1(v_s_control);
						end if;
					elsif es_fallo_lectura(pet,derechos_acceso) then
						if bloque_virgen(s_estado) then
							peticion_memoria_lectura(v_pet_m);
						else
							lectura_datos(v_s_control);
						end if;
						
					--elsif es_fallo_escritura(pet,derechos_acceso) then
					else
						if bloque_virgen(s_estado) then
							peticion_memoria_lectura(v_pet_m);
						else
							lectura_datos(v_s_control);
						end if;
					end if;
				
		
				when LBE =>
					interfaces_en_CURSO(v_resp);
					peticion_memoria_escritura(v_pet_m);
				
				when PME =>
					interfaces_en_CURSO(v_resp);
					
					
				when ESBE =>
					interfaces_en_CURSO(v_resp);
					
					if hay_respuesta_memoria(resp_m) then
						peticion_memoria_lectura(v_pet_m);
					end if;
				
				when PMN =>
					interfaces_en_CURSO(v_resp);
					
					
				when ESBN =>
					interfaces_en_CURSO(v_resp);
					
					if hay_respuesta_memoria(resp_m) then
						actu_datos_desde_bus(v_s_control);
						actualizar_dato_m(v_s_control);
						actualizar_estado(v_s_control,LECT_E);
						actualizar_etiqueta(v_s_control);
					end if;
				
				when ABN =>
					interfaces_en_CURSO(v_resp);
					
					if es_lectura(pet) then
						lectura_datos(v_s_control);
						
					--elsif es_escritura(pet) then
					else
						actualizar_estado(v_s_control,MODIF_E);
						if (s_estado.BYTE = '0') then
							actualizar_dato_0(v_s_control);
						else
							actualizar_dato_1(v_s_control);
						end if;
					end if;
				
				when ESC =>
					interfaces_HECHOE(v_resp);
				when LEC =>
					interfaces_HECHOL(v_resp);
				
			end case;

		end if;
		
	resp 		<= v_resp after retardo_logica_salida;
	s_control 	<= v_s_control after retardo_logica_salida;
	pet_m 		<= v_pet_m after retardo_logica_salida;
	
	end process;


-- determinacion de los derechos de acceso al bloque
-- 00 no der, 01 lectura, 11 esc,
derechos_acceso <= 	'1' after retardo_logica_salida when s_estado.AF = '1' and s_estado.EST = "01" else 
					'1' after retardo_logica_salida when s_estado.AF = '1'and s_estado.EST = "11" else
					'0' after retardo_logica_salida;

dirINI(14 downto 3) <= "000000000000" after retardo_logica_salida;
dirINI(2 downto 0) <= init after retardo_logica_salida;

	
end;
