------------------------------------------------------------------------
--
-- Example of 2-bit binary comparator using the when/else assignment.
-- EDA Playground
--
-- Copyright (c) 2020-2021 Tomas Fryza
-- Dept. of Radio Electronics, Brno University of Technology, Czechia
-- This work is licensed under the terms of the MIT license.
--
------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

------------------------------------------------------------------------
-- Entity declaration for 2-bit binary comparator
------------------------------------------------------------------------
entity mux_2bit_new is
    port(
        a_i			: in  std_logic_vector(2 - 1 downto 0);         
        b_i			: in  std_logic_vector(2 - 1 downto 0);
        c_i			: in  std_logic_vector(2 - 1 downto 0);         
        d_i			: in  std_logic_vector(2 - 1 downto 0);        
        addr_i		: in  std_logic_vector(2 - 1 downto 0); 
        y_o         : out std_logic_vector(2 - 1 downto 0)
    );
end entity mux_2bit_new;

------------------------------------------------------------------------
-- Architecture body for 2-bit binary comparator
------------------------------------------------------------------------
architecture testbench of mux_2bit_new is
begin
   y_o <= a_i when (addr_i = "00") else
          b_i when (addr_i = "01") else
          c_i when (addr_i = "10") else
          d_i;  
end architecture testbench;
