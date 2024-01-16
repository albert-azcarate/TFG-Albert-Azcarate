--
-- Copyright (c) 2017 XXXX, UPC
-- All rights reserved.
-- 

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.param_disenyo_pkg.all;
use work.componentes_camino_pkg.all;
use work.componentes_camino_dir_pkg.all;
use work.camino_dat_pkg.all;
use work.campo_ET_pkg.all;
use work.campo_EST_pkg.all;
use work.campo_DAT_pkg.all;
--! @image html camino_datos.png 
--! @image html componentes_camino.png 

entity camino_datos_multi is 		 
port (reloj: in  std_logic;
	cami_e: in  tp_camino_e;
	cami_obs_e: in  tp_camino_e;
	cami_s: out tp_camino_s;
	cami_obs_s: out tp_camino_s;
	dirINI: in  st_dir_bloque);
end camino_datos_multi;

architecture estructural of camino_datos_multi is

signal Etiq_ent: tp_Etiq_e;
signal Etiq_ent_obs: tp_Etiq_e;
signal Etiq_obs: tp_Etiq_e;
signal AF: std_logic;
signal AF_obs: std_logic;

signal DAT_e: tp_Datos_e; 
signal DL: st_bloque_dat;

signal EST_e: tp_mest_e;
signal EST_obs_e: tp_mest_e;
signal EST: st_estado;
signal EST_obs: st_estado;

signal DAT_DE: st_bloque_dat;
signal ETIQ_DE: st_etiqueta;
signal DIR_REC: st_dir_bloque;
signal DIR_REC_obs: st_dir_bloque;

signal hit : std_logic;
signal dir_bloque : st_dir_bloque;
signal dir_bloque_obs : st_dir_bloque;

begin

dir_bloque <= dirINI when cami_e.muxINI = '1' else
				cami_e.dirB;
				
dir_bloque_obs <= dirINI when cami_e.muxINI = '1' else
				cami_obs_e.dirB;

DAT_DE <= 	(others => '0') when cami_e.muxINI = '1' else
			cami_e.dat_mem_DE when cami_e.proc_mem = '1' else
			(cami_e.dat_DE & cami_e.dat_DE);							

-- interconexión
Etiq_ent <= (acc => cami_e.etiq_acc,
			dirB => cami_e.dirB, -- passem tota la dir perque es fa la comprobacio de la etiq a dins
			esc => cami_e.etiq_esc);
			-- interconexión
Etiq_obs <= (acc => cami_e.etiq_acc,
			dirB => cami_obs_e.dirB, -- passem tota la dir perque es fa la comprobacio de la etiq a dins
			esc => cami_obs_e.etiq_esc);
			
Etiq_ent_obs <= (acc => cami_obs_e.etiq_acc,
			dirB => cami_obs_e.dirB, -- passem tota la dir perque es fa la comprobacio de la etiq a dins
			esc => cami_obs_e.etiq_esc);

DAT_e <= (acc => cami_e.dat_acc, -- [REVISAR] Aixo pot donar problemes, depenent de com es generin les direccions
		dir => dir_bloque(dir_bloque_bits - etiq_bits - 1 downto dir_bloque_bits - etiq_bits - indice_bits), --conjunto (15 - 12 - 1) = 2 downto 0 = (15 - 12 - 3) 
		esc => cami_e.dat_esc, 
		DE => DAT_DE);

EST_e <= (acc => cami_e.est_acc,
		dir => dir_bloque(dir_bloque_bits - etiq_bits - 1 downto dir_bloque_bits - etiq_bits - indice_bits), --conjunto
		esc => cami_e.est_esc, 
		DE => cami_e.est_DE);
		
EST_obs_e <= (acc => cami_obs_e.est_acc,
		dir => dir_bloque_obs(dir_bloque_bits - etiq_bits - 1 downto dir_bloque_bits - etiq_bits - indice_bits),
		esc => cami_obs_e.est_esc, 
		DE => cami_obs_e.est_DE);

-- componentes 
etiq: etiquetas port map(reloj => reloj, Etiq_ent => Etiq_ent, AF => AF, dir_rec => DIR_REC);
--etiq_obs_rep: etiquetas_dir port map(reloj => reloj, Etiq_ent => Etiq_ent_obs, Etiq_obs => Etiq_obs, AF => AF_obs, dir_rec => DIR_REC_obs);

estado: m_EST port map(reloj => reloj, M_e => EST_e, DL => EST);
--estado_obs: m_EST port map(reloj => reloj, M_e => EST_obs_e, DL => EST_obs);

datos_ca: datos port map(reloj => reloj, Dat_ent => DAT_e, DL => DL);

-- interconexión
cami_s.cam_AF <= AF; 
cami_s.cam_DL_mem <= DL;
cami_s.cam_DL <= DL((tam_bloque_bits / 2) - 1 downto 0) when cami_e.byte = '0' else DL(tam_bloque_bits - 1 downto (tam_bloque_bits / 2));
cami_s.cam_EST <= EST;
cami_s.cam_dir_rec <= DIR_REC;

--cami_obs_s.cam_AF <= AF_obs; 
--cami_obs_s.cam_DL_mem <= (others => '0'); 	-- Observador no tiene replica de datos
--cami_obs_s.cam_DL <= (others => '0');		-- Observador no tiene replica de datos
--cami_obs_s.cam_EST <= EST_obs;
--cami_obs_s.cam_dir_rec <= DIR_REC_obs;
cami_obs_s.cam_AF <= AF; 
cami_obs_s.cam_DL_mem <= (others => '0'); 	-- Observador no tiene replica de datos
cami_obs_s.cam_DL <= (others => '0');		-- Observador no tiene replica de datos
cami_obs_s.cam_EST <= EST;
cami_obs_s.cam_dir_rec <= DIR_REC;


 
end estructural;
