--
-- Copyright (c) 2017 XXXX, UPC
-- All rights reserved.
-- 

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

use std.textio.all;
use ieee.std_logic_textio.all;

use work.param_disenyo_pkg.all;
use work.componentes_camino_pkg.all;
use work.camino_dat_pkg.all;
use work.campo_ET_pkg.all;
use work.campo_EST_pkg.all;
use work.campo_DAT_pkg.all;

entity prueba_camino_datos is 

end entity;

architecture prueba of prueba_camino_datos is

component camino_datos is 		 
port (reloj: in  std_logic;
	cami_e: in  tp_camino_e;
	cami_s: out tp_camino_s);
end component;

procedure wait_until_falling_edges(signal reloj: in std_logic; n: in integer) is
begin
    for i in 1 to n loop
        wait until falling_edge(reloj);
    end loop;
end procedure;

procedure escritura (signal camino_e: out tp_camino_e; signal reloj: in std_logic; dir :in st_dir_bloque; valor: in st_elem_dat; pm :in std_logic; byte: in std_logic; estado:in std_logic_vector(1 downto 0)) is
begin
    wait_until_falling_edges(reloj,1);
    -- access and enables
    camino_e.etiq_acc   <= '1';
    camino_e.est_acc    <= '1';
    camino_e.dat_acc    <= '1';
    camino_e.etiq_esc   <= '1';
    camino_e.est_esc    <= '1';
    camino_e.byte       <= byte;
    
    if pm = '1' then
        camino_e.dat_esc <= "11";
    elsif byte = '1' then
        camino_e.dat_esc <= "10";
    elsif byte = '0' then
        camino_e.dat_esc <= "01";
    else
        camino_e.dat_esc <= "00";
    end if;
    
    
    camino_e.dirB <= dir;
    camino_e.dat_DE <= valor(7 downto 0);
    camino_e.dat_mem_DE <= valor;
    camino_e.est_DE <= estado;
    camino_e.proc_mem <= pm;

end procedure;

procedure lectura_comprobacion (signal camino_e: out tp_camino_e; signal reloj: in std_logic; camino_s: in tp_camino_s; dir :in st_dir_bloque; byte : in std_logic; datoL: in st_elem_dat) is
variable L: line;
begin
    wait_until_falling_edges(reloj,1);
    camino_e.etiq_acc   <= '1';
    camino_e.est_acc    <= '1';
    camino_e.dat_acc    <= '1';
    camino_e.etiq_esc   <= '0';
    camino_e.est_esc    <= '0';
    camino_e.dat_esc    <= "00";
    
    camino_e.dirB       <= dir;
    camino_e.byte       <= byte;
    
    camino_e.proc_mem   <= '0';
    wait_until_falling_edges(reloj,1);
    if (camino_s.cam_DL /= datoL(7 downto 0) or camino_s.cam_AF = '0') then 
      assert false report "valor no esperado" severity warning;
      write(L, string'(", esperado:   "));
      write(L, camino_s.cam_DL);
      write(L, string'(", leido:   "));
      write(L, datoL(7 downto 0));
      write(L, string'(", AF:   "));
      write(L, camino_s.cam_AF);
      writeline(output, L);
    end if;
end procedure;

procedure lectura (signal camino_e: out tp_camino_e; signal reloj: in std_logic; camino_s: in tp_camino_s; dir :in st_dir_bloque; byte : in std_logic) is
variable L: line;
begin
    wait_until_falling_edges(reloj,1);
    camino_e.etiq_acc   <= '1';
    camino_e.est_acc    <= '1';
    camino_e.dat_acc    <= '1';
    camino_e.etiq_esc   <= '0';
    camino_e.est_esc    <= '0';
    camino_e.dat_esc    <= "00";
    
    camino_e.dirB       <= dir;
    camino_e.byte       <= byte;
    
    camino_e.proc_mem   <= '0';
    wait_until_falling_edges(reloj,1);
end procedure;

procedure lectura_completa(signal camino_e: out  tp_camino_e; camino_s :in tp_camino_s; signal reloj:in std_logic)is

variable dir: st_dir_bloque;
variable byte: std_logic;
variable L: line;
begin
    for container_index in 7 downto 0 loop
        -- Set the container index as the address
        dir := std_logic_vector(to_unsigned(container_index, st_dir_bloque'length));
        -- Set the byte to read
        byte := '0';
        -- Perform the read operation
        lectura(camino_e, reloj, camino_s, dir, byte);
    end loop;
end procedure;


signal camino_e: tp_camino_e;
signal camino_s: tp_camino_s;
signal byte : std_logic;
signal dir: st_dir_bloque;
signal DL: st_elem_dat;

signal reloj: std_logic;

shared variable final : boolean := false;

begin

camino :  camino_datos port map(reloj => reloj, cami_s => camino_s, cami_e => camino_e);


process
variable dir: st_dir_bloque;
variable valor: st_elem_dat;
variable v_dir: std_logic_vector(2 downto 0);
variable v_valor: st_dir_bloque;
variable direccion: st_dir;
variable etiqueta: st_elem_dat;
variable conjunto: st_dir_bloque;
variable pm : std_logic;
variable estado : std_logic_vector(1 downto 0);
variable byte: std_logic;

begin
    -- ESCRITURA
    -- camino_e, reloj, dir ,valor, pm, estado
    
    -- lec  IN:  Reloj, camino_s, dir, byte
    --      OUT: camino_e: 
    
    -- camino_e, reloj, camino_s, dir, byte ,datoL
    
    -- escrituras en memoria
	v_dir:= "000";
	valor:= "1010101001111111";
	dir:= std_logic_vector(resize(unsigned(v_dir), st_dir_bloque'length));
    pm := '1';
    byte := '0';
    estado := "10";
    
    escritura(camino_e, reloj, dir, valor, pm, byte, estado);

    -- lecturas en memoria
	v_dir:= "000";
	v_valor:= "000000001111111";
    byte := '0';
	dir:= std_logic_vector(resize(unsigned(v_dir), st_dir_bloque'length));
	valor:= std_logic_vector(resize(unsigned(v_valor), st_elem_dat'length));
    lectura_comprobacion(camino_e, reloj, camino_s, dir, byte, valor);
    
    
    
    for container_index in 0 to 7 loop
        -- Set the container index as the address
        dir := std_logic_vector(to_unsigned(container_index, st_dir_bloque'length));
        -- Set to write from memory
        pm := '1';
        byte := '0';
        -- Set the data value to write (0 to 7)
        valor := std_logic_vector(to_unsigned(container_index, valor'length));
        escritura(camino_e, reloj, dir, valor, pm, byte,estado);
    end loop;
    
    
    
    lectura_completa(camino_e, camino_s, reloj);
    
     for container_index in 0 to 7 loop
        -- Set the container index as the address
        dir := std_logic_vector(to_unsigned(container_index, st_dir_bloque'length));
        -- Set to write from memory
        pm := '0';
        byte := '1';
        -- Set the data value to write (0 to 7)
        valor := std_logic_vector(to_unsigned(container_index*2, valor'length));
        escritura(camino_e, reloj, dir, valor, pm, byte, estado);
    end loop;

    lectura_completa(camino_e, camino_s, reloj);
    
    
    -- Miss en escritura
	valor:= "1000000000000001";
	dir:= "000" & x"100";
    pm := '1';
    byte := '0';
    estado := "10";
    escritura(camino_e, reloj, dir, valor, pm, byte,estado);

    -- Miss en lectura
	dir:= "000" & x"000";
    byte := '0';
    lectura(camino_e, reloj, camino_s, dir, byte);
        
    
    lectura_completa(camino_e, camino_s, reloj);
    
    assert false report "Comprobacion finalizada." severity note;
	 final := true;
    wait;
end process;

  
rlj:process
begin
  if final = false then
    reloj <= '0';
    wait for 10 ns;
    reloj <= '1';
    wait for 10 ns;
	else
	  wait;
	end if;
end process;
 
end prueba;

