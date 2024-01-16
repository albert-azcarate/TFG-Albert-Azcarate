--
-- Copyright (c) 2017 XXXX, UPC
-- All rights reserved.
-- 

library ieee;
use ieee.std_logic_1164.all;

package acciones_pkg is

constant puesta_cero: std_logic:= '1';

constant peticion_proc: std_logic:= '1';
constant peticion_proc_ini: std_logic:= '1';
constant no_peticion_proc: std_logic:= '0';

constant resp_cache_listo: std_logic:= '1';
constant resp_cache_ocupado: std_logic:= '0';

constant lectura : std_logic := '0';      
constant escritura : std_logic := '1';
      
constant derechos_acceso_lect_si : std_logic:= '1'; 
constant derechos_acceso_esc_si : std_logic := '1'; 
constant derechos_acceso_no : std_logic := '0';

constant acceso_si: std_logic:= '1';
constant acceso_no: std_logic:= '0';
constant escritura_permiso: std_logic:= '1';
constant escritura_no_permiso: std_logic:= '0';
constant escritura_permiso_m: std_logic_vector(1 downto 0):= "11";
constant escritura_permiso_1: std_logic_vector(1 downto 0):= "10";
constant escritura_permiso_0: std_logic_vector(1 downto 0):= "01";
constant escritura_no_permiso_dat: std_logic_vector(1 downto 0):= "00";



constant escritura_ini: std_logic:= '1';
constant escritura_no_ini: std_logic:= '0';

constant peticion_memoria_si : std_logic := '1';      
constant peticion_memoria_no : std_logic := '0';
--constant memoria_lista: std_logic:= '1';

constant contenedor_valido_lect: std_logic_vector(1 downto 0) := "01";
constant contenedor_valido_esc: std_logic_vector(1 downto 0) := "11";
constant contenedor_no_valido: std_logic_vector(1 downto 0) := "00";

constant actualizar_campo_datos_desde_proc: std_logic := '0';
constant actualizar_campo_datos_desde_bus: std_logic := '1';
end package acciones_pkg;

