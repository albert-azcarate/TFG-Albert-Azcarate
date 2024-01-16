--
-- Copyright (c) 2017 XXXX, UPC
-- All rights reserved.
-- 

library ieee;
use ieee.std_logic_1164.all;

use work.param_disenyo_pkg.all;
use work.controlador_Obs_elim_pkg.all;
use work.controlador_multi_pkg.all;
use work.acciones_pkg.all;

package procedimientos_observador_pkg is

-- comprobacion de condiciones  
function hay_peticion_escritura_bus (signal pet: tp_contro_Obs_e) return boolean;  
function hay_peticion_lectura_bus (signal pet: tp_contro_Obs_e) return boolean;  
function mismo_contenedor (signal pet: tp_contro_Obs_e; signal dir_proc: st_dir) return boolean;  
function procesador_accediendo_esc  (signal proc_acc: std_logic_vector(2 downto 0)) return boolean; 
function procesador_accediendo_exp  (signal proc_acc: std_logic_vector(2 downto 0)) return boolean;   
function procesador_accediendo_lect (signal proc_acc: std_logic_vector(2 downto 0)) return boolean;  
function procesador_accediendo_dat  (signal proc_acc: std_logic_vector(2 downto 0)) return boolean;  

function es_acierto_lectura_obs (signal derechos_acceso: std_logic; signal pet: tp_contro_Obs_e) return boolean;  
function es_acierto_escritura_obs (signal derechos_acceso: std_logic; signal pet: tp_contro_Obs_e) return boolean;  
function bloque_virgen (signal s_estado: tp_contro_cam_estado) return boolean;


function hay_transaccion (signal trans_bus: std_logic) return boolean;

-- realizacion de acciones
procedure interfaces_DES(variable v_resp: out tp_contro_Obs_s);
procedure interfaces_en_CURSO(variable v_resp: out tp_contro_Obs_s);


procedure por_defecto (variable v_s_control: inout tp_contro_cam_cntl; variable v_resp: out tp_contro_Obs_s;
						variable v_observacion: out std_logic;variable v_suministro: out std_logic;variable v_cancel_pme: out std_logic);
						
procedure lectura_etiq_estado (variable v_s_control: inout tp_contro_cam_cntl);
procedure lectura_datos (variable v_s_control: inout tp_contro_cam_cntl);
procedure suministra_bloque (variable v_suministro: out std_logic);

procedure actualizar_estado (variable v_s_control: inout tp_contro_cam_cntl; estado_conte: st_estado);

procedure observando (variable v_observacion: out std_logic);
procedure cancelar_pme (variable v_cancel_pme: out std_logic);
procedure bloquear_bus (variable v_s_control: out tp_contro_cam_cntl);

end package procedimientos_observador_pkg;

package body procedimientos_observador_pkg is

-- comprobacion de condiciones
function hay_peticion_escritura_bus (signal pet: tp_contro_Obs_e) return boolean is
variable hay_peticion: boolean:= FALSE;
begin
	hay_peticion := (pet.acc = '1' and pet.esc = '1');
return (hay_peticion);
end hay_peticion_escritura_bus;   

function hay_peticion_lectura_bus (signal pet: tp_contro_Obs_e) return boolean is
variable hay_peticion: boolean:= FALSE;
begin
	hay_peticion := (pet.acc = '1' and pet.esc = '0');
return (hay_peticion);
end hay_peticion_lectura_bus;  

function mismo_contenedor (signal pet: tp_contro_Obs_e; signal dir_proc: st_dir) return boolean is  
variable mismo: boolean:= FALSE;
begin
	mismo := (pet.dir(2 downto 0) = dir_proc(3 downto 1));
return (mismo);
end mismo_contenedor;  

function es_acierto_lectura_obs (signal derechos_acceso: std_logic; signal pet: tp_contro_Obs_e) return boolean is
variable es_acierto: boolean:= FALSE;
begin
	es_acierto := (pet.esc = lectura and derechos_acceso = derechos_acceso_lect_si);
return (es_acierto);
end es_acierto_lectura_obs;   

function es_acierto_escritura_obs (signal derechos_acceso: std_logic; signal pet: tp_contro_Obs_e) return boolean is
variable es_acierto: boolean:= FALSE;
begin
	es_acierto := (pet.esc = escritura and derechos_acceso = derechos_acceso_esc_si);
return (es_acierto);
end es_acierto_escritura_obs;


function bloque_virgen (signal s_estado: tp_contro_cam_estado) return boolean is
variable virgen: boolean:= FALSE;
begin
	virgen := (s_estado.EST /= "11");
return (virgen);
end bloque_virgen;


function hay_transaccion (signal trans_bus: std_logic) return boolean is
variable trans: boolean:= FALSE;
begin
	trans := (trans_bus = '1') ;
return (trans);
end hay_transaccion;

function procesador_accediendo_esc (signal proc_acc: std_logic_vector(2 downto 0)) return boolean is
variable acc: boolean:= FALSE;
begin
	acc := (proc_acc = "011") ;
return (acc);
end procesador_accediendo_esc;

function procesador_accediendo_lect (signal proc_acc: std_logic_vector(2 downto 0)) return boolean is
variable acc: boolean:= FALSE;
begin
	acc := (proc_acc = "001") ;
return (acc);
end procesador_accediendo_lect;

function procesador_accediendo_exp (signal proc_acc: std_logic_vector(2 downto 0)) return boolean is
variable acc: boolean:= FALSE;
begin
	acc := (proc_acc = "010") ;
return (acc);
end procesador_accediendo_exp;

function procesador_accediendo_dat (signal proc_acc: std_logic_vector(2 downto 0)) return boolean is
variable acc: boolean:= FALSE;
begin
	acc := (proc_acc = "100") ;
return (acc);
end procesador_accediendo_dat;

-- realizacion de acciones
procedure interfaces_DES(variable v_resp: out tp_contro_Obs_s) is
begin
	v_resp.listo := resp_cache_listo;
end procedure;

procedure interfaces_en_CURSO(variable v_resp: out tp_contro_Obs_s) is
begin
	v_resp.listo := resp_cache_ocupado;
end procedure;


procedure por_defecto (variable v_s_control: inout tp_contro_cam_cntl; variable v_resp: out tp_contro_Obs_s; variable v_observacion: out std_logic; variable v_suministro: out std_logic; variable v_cancel_pme: out std_logic) is
begin
	interfaces_DES(v_resp);
	v_s_control:= (DAT_acc => acceso_no,
				DAT_esc => escritura_no_permiso_dat,
				
				EST_acc => acceso_no,
				EST_esc => escritura_no_permiso,
				EST_DE => contenedor_no_valido,
				
				ET_acc => acceso_no,
				ET_esc => escritura_no_permiso,
				
				muxE => '0',
				muxINI => '0',
				bloq_bus => '0'
				);

	v_observacion:= '0';
	v_suministro:= '0';
	v_cancel_pme:= '0';
end procedure;

procedure lectura_etiq_estado (variable v_s_control: inout tp_contro_cam_cntl) is
begin
	v_s_control.ET_acc := acceso_si;
	v_s_control.EST_acc := acceso_si;
end procedure;

procedure lectura_datos (variable v_s_control: inout tp_contro_cam_cntl) is
begin
	v_s_control.DAT_acc := acceso_si;
end procedure;


procedure actualizar_estado (variable v_s_control: inout tp_contro_cam_cntl; estado_conte: st_estado) is
begin
	v_s_control.EST_acc := acceso_si;
	v_s_control.EST_esc := escritura_permiso;
	v_s_control.EST_DE := estado_conte;
end procedure;

procedure observando (variable v_observacion: out std_logic) is
begin
	v_observacion:= '1';
end procedure;

procedure suministra_bloque (variable v_suministro: out std_logic) is
begin
	v_suministro:= '1';
end procedure;

procedure bloquear_bus (variable v_s_control: out tp_contro_cam_cntl) is
begin
	v_s_control.bloq_bus := '1';
end procedure;

procedure cancelar_pme (variable v_cancel_pme: out std_logic) is
begin
	v_cancel_pme := '1';
end procedure;


end package body procedimientos_observador_pkg;

