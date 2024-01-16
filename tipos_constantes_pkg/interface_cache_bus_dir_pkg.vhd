--
-- Copyright (c) 2017 XXXX, UPC
-- All rights reserved.
-- 

library ieee;
use ieee.std_logic_1164.all;

use work.param_disenyo_pkg.all;

package interface_cache_bus_dir_pkg is

type tp_peticion_info_dir is record
	id: std_logic_vector(1 downto 0);
	acc: std_logic; -- quitar
	dir: st_dir;
    dato_E : st_bloque_dat; 
end record;

type tp_respuesta_info_dir is record
    mdato_bus : st_bloque_dat; 
	dir: st_dir;
end record;

type tp_peticion_control is record
	mpet: std_logic;
	mles: std_logic;
	mexp: std_logic;
    mesc: std_logic;
end record;

type tp_respuesta_control_dir is record
    m_val : std_logic; 
end record;

type tp_respuesta_control is record
    m_val : std_logic; 
end record;

type tp_peticion_mem is record
	m_acc: std_logic; -- quitar
	m_pet: std_logic;
	m_esc: std_logic;
	m_exp: std_logic;
	m_dir: st_dir;
    m_DE : st_bloque_dat; 
end record;

end package interface_cache_bus_dir_pkg;

