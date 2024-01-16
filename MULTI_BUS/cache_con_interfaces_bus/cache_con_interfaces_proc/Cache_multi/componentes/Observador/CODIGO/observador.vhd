--
-- Copyright (c) 2017 XXXX, UPC
-- All rights reserved.
-- 

library ieee;
use ieee.std_logic_1164.all;

use work.param_disenyo_pkg.all;
use work.controlador_Obs_pkg.all;
use work.controlador_multi_pkg.all;
use work.retardos_controlador_pkg.all;
use work.acciones_pkg.all;
use work.procedimientos_observador_pkg.all;
--! @image html observador.png 

entity observador is
port (reloj, pcero: in std_logic;
		pet: in tp_contro_Obs_e;
		s_estado: in tp_contro_cam_estado;
		trans_bus: in std_logic; -- una transaccion propia ocupa el bus
		acceso: in std_logic_vector(2 downto 0); -- Acceso a campos de datos o etiquetas
		dir_proc: in st_dir;
		observacion: out std_logic;
		suministro: out std_logic;
		s_control: out tp_contro_cam_cntl;
		cancel_pme: out std_logic;
		resp: out tp_contro_Obs_s);
end;
  
architecture compor of observador is

--type tipoestado_O is (DESO, CMPETO, EEST);
signal estado, prxestado: tipoestado_O;

signal derechos_acceso: std_logic;
signal cancel_pme_pre: std_logic;


begin
-- determinacion de los derechos de acceso al bloque
derechos_acceso <= 	'1' when s_estado.AF = '1' and s_estado.EST = LECT_E else 
					'1' when s_estado.AF = '1'and s_estado.EST = MODIF_E else
					'0';

	-- registro de estado
	reg_estado: process (reloj, pcero)
		variable v_estado: tipoestado_O;
	begin
		if pcero = puesta_cero then
			v_estado := DESO;
		elsif rising_edge(reloj) then
			v_estado := prxestado;
		end if;
		
		-- asignacion de variables a las senyales, indicando el retardo, mismo retardo que el agente procesador
		estado <= v_estado after retardo_estado;
	end process;    
   
   
   
   
	-- logica de proximo estado
	prx_esta: process(estado, pet, derechos_acceso, pcero, reloj, trans_bus, s_estado, acceso)
			variable v_prxestado	: tipoestado_O := DESO;
		begin
		if pcero = puesta_cero then
			v_prxestado := DESO;
		else
			v_prxestado := DESO;
			case estado is
				when DESO =>
					if hay_transaccion(trans_bus) then
                        v_prxestado := DESO;
                    elsif hay_peticion_escritura_bus(pet) or hay_peticion_lectura_bus(pet) then
						if procesador_accediendo_esc(acceso) then
							v_prxestado := B_CMPETO;
						else 
							v_prxestado := CMPETO;
						end if;
					end if;
				when CMPETO =>
					if es_acierto_lectura_obs(derechos_acceso,pet) then
						if bloque_virgen(s_estado) then
							-- Lectura en estado L
							v_prxestado := DESO;
						else
							-- Lectura en estado M
							if procesador_accediendo_lect(acceso) or procesador_accediendo_esc(acceso) or procesador_accediendo_dat(acceso) then
								v_prxestado := B_SUM;
							else
								v_prxestado := SUM;
							end if;
						end if;
					elsif es_acierto_escritura_obs(derechos_acceso,pet) then
						if bloque_virgen(s_estado) then
							-- Escritura en estado L
							if procesador_accediendo_lect(acceso) then
								v_prxestado := B_EEST;
							else
								v_prxestado := EEST;
							end if;
						else
							-- Escritura en estado M
							if procesador_accediendo_lect(acceso) or procesador_accediendo_esc(acceso) or procesador_accediendo_dat(acceso) then
								v_prxestado := B_SUM;
							else
								v_prxestado := SUM;
							end if;
						end if;
					else 
						v_prxestado := DESO;
					end if;
					
				when B_CMPETO =>
					v_prxestado := CMPETO;
					
				when EEST =>
					v_prxestado := DESO;
					
				when B_EEST =>	
					v_prxestado := EEST;
				
				when SUM => 
					v_prxestado := DESO;
				
				when B_SUM =>	
					if procesador_accediendo_esc(acceso) or procesador_accediendo_dat(acceso) then
						v_prxestado := B_SUM;
					else
						v_prxestado := SUM;
					end if;
					
			end case;
		end if;
	
		-- asignacion de variables a las senyales, indicando el retardo, mismo retardo que el agente procesador
		prxestado <= v_prxestado after retardo_logica_prx_estado;
	end process;
   
   
   
	-- logica de salida
	logi_sal: process(estado, pet, derechos_acceso, pcero, reloj, trans_bus, s_estado, acceso)
			variable v_resp 		: tp_contro_Obs_s;
			variable v_observacion 	: std_logic;
			variable v_suministro 	: std_logic;
			variable v_cancel_pme 	: std_logic;
			variable v_s_control 	: tp_contro_cam_cntl;
		begin
		if pcero = puesta_cero then
			por_defecto(v_s_control, v_resp, v_observacion, v_suministro, v_cancel_pme);
		else
			por_defecto(v_s_control, v_resp, v_observacion, v_suministro, v_cancel_pme);
			case estado is
				when DESO =>
                    if hay_transaccion(trans_bus) then
					
                    elsif hay_peticion_escritura_bus(pet) or hay_peticion_lectura_bus(pet) then
						if procesador_accediendo_esc(acceso) then
							observando(v_observacion);
							--bloquear_bus(v_s_control);
						else
							observando(v_observacion);
							lectura_etiq_estado(v_s_control);
						end if;
					end if;
				when CMPETO =>
					interfaces_en_CURSO(v_resp);
					observando(v_observacion);
					
					if es_acierto_lectura_obs(derechos_acceso,pet)  then
						if bloque_virgen(s_estado) then
							-- Nada a hacer
						else
							if procesador_accediendo_lect(acceso) or procesador_accediendo_esc(acceso) or procesador_accediendo_dat(acceso) then
								bloquear_bus(v_s_control);
								--v_prxestado := B_SUM;
							else
								--v_prxestado := SUM;
								-- pasar dato i avisar a memoria
								if cancel_pme_pre = '1' or (procesador_accediendo_exp(acceso) and mismo_contenedor(pet, dir_proc)) then
									cancelar_pme(v_cancel_pme);
									actualizar_estado(v_s_control,INV_E);
								else
									actualizar_estado(v_s_control,LECT_E);
								end if;
								
								lectura_datos(v_s_control);
							end if;
						end if;
					elsif es_acierto_escritura_obs(derechos_acceso,pet) then
						if bloque_virgen(s_estado) then
							if procesador_accediendo_lect(acceso) then
								bloquear_bus(v_s_control);	
								--v_prxestado := B_EEST;
							else
								--v_prxestado := EEST;
								actualizar_estado(v_s_control,INV_E);
							end if;
						else
						
							if procesador_accediendo_lect(acceso) or procesador_accediendo_esc(acceso)  or procesador_accediendo_dat(acceso) then
								bloquear_bus(v_s_control);
								--v_prxestado := B_SUM;
							else
								--v_prxestado := SUM;
								-- pasar dato i avisar a memoria
								if cancel_pme_pre = '1' or (procesador_accediendo_exp(acceso) and mismo_contenedor(pet, dir_proc)) then
									cancelar_pme(v_cancel_pme);
								end if;
								actualizar_estado(v_s_control,INV_E);
								lectura_datos(v_s_control);
							end if;
						end if;
					end if;
					

				when B_CMPETO =>
					interfaces_en_CURSO(v_resp);
					observando(v_observacion);
					bloquear_bus(v_s_control);
					
					lectura_etiq_estado(v_s_control);
				
				when EEST =>
					interfaces_en_CURSO(v_resp);
					observando(v_observacion);
					
				when B_EEST =>
					observando(v_observacion);
					interfaces_en_CURSO(v_resp);
					
					actualizar_estado(v_s_control,LECT_E);
					
				when SUM =>
					interfaces_en_CURSO(v_resp);
					observando(v_observacion);
					
					suministra_bloque(v_suministro);
					
					
				when B_SUM =>
					observando(v_observacion);
					interfaces_en_CURSO(v_resp);
					
					if procesador_accediendo_esc(acceso) or procesador_accediendo_dat(acceso) then
						bloquear_bus(v_s_control);
					else
						lectura_datos(v_s_control);
						
						if hay_peticion_escritura_bus(pet) then
							if cancel_pme_pre = '1' or (procesador_accediendo_exp(acceso) and mismo_contenedor(pet, dir_proc)) then
								cancelar_pme(v_cancel_pme);
							end if;
							actualizar_estado(v_s_control,INV_E);
						else
							if cancel_pme_pre = '1' or (procesador_accediendo_exp(acceso) and mismo_contenedor(pet, dir_proc)) then
								cancelar_pme(v_cancel_pme);
								actualizar_estado(v_s_control,INV_E);
							else
								actualizar_estado(v_s_control,LECT_E);
							end if;
						end if;
					end if;
					
			end case;
		end if;
	
		-- asignacion de variables a las senyales, indicando el retardo, mismo retardo que el agente procesador
		s_control 	<= v_s_control 		after retardo_logica_salida;
		resp 		<= v_resp 			after retardo_logica_salida;
		observacion <= v_observacion 	after retardo_logica_salida;
		suministro 	<= v_suministro 	after retardo_logica_salida;
		cancel_pme_pre 	<= v_cancel_pme 	after retardo_logica_salida;
	end process;
	
cancel_pme <= cancel_pme_pre;
	
end;