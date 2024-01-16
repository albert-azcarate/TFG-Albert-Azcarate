--
-- Copyright (c) 2017 XXXX, UPC
-- All rights reserved.
-- 

library ieee;
use ieee.std_logic_1164.all;

use work.param_disenyo_pkg.all;

package controlador_multi_pkg is

type tipoestado is (INI, DES, CMPET, PAE, PAN, ABN, ESC, LEC, ESBN, ESBE);
constant INV_E: std_logic_vector(1 downto 0) := "00";
constant LECT_E: std_logic_vector(1 downto 0) := "01";
constant MODIF_E: std_logic_vector(1 downto 0) := "11";

type tp_contro_e is record
	acc: std_logic;
    esc : std_logic;
	ini: std_logic;
	dir: st_dir;
end record;

type tp_contro_s is record
    listo : std_logic;
	finalizada: std_logic;
end record;

type tp_contro_cam_estado is record
	BYTE: std_logic;
	AF: std_logic;
	EST: st_estado;
end record;

type tp_contro_cam_cntl is record
    DAT_acc: std_logic;
    DAT_esc: std_logic_vector(tam_bloque_bytes-1 downto 0);

    EST_acc: std_logic;
    EST_esc: std_logic;
    EST_DE: st_estado;

	ET_acc: std_logic;
    ET_esc : std_logic;

	muxE: std_logic;
	muxINI: std_logic;
	bloq_bus: std_logic;
end record;

type tp_cntl_memoria_s is record
	m_acc: std_logic;
	m_pet: std_logic;
	m_esc: std_logic;
	m_exp: std_logic;
end record;

type tp_cntl_memoria_e is record
	m_val: std_logic;
end record;

end package controlador_multi_pkg;


