----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 24.02.2021 13:29:20
-- Design Name: 
-- Module Name: tb_mux_2bit_4to1 - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library ieee;
use ieee.std_logic_1164.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity tb_mux_2bit_new is
--  Port ( );
end entity tb_mux_2bit_new;

architecture testbench of tb_mux_2bit_new is
    signal s_a              : std_logic_vector(2 - 1 downto 0);
    signal s_b              : std_logic_vector(2 - 1 downto 0);
    signal s_c              : std_logic_vector(2 - 1 downto 0);
    signal s_d              : std_logic_vector(2 - 1 downto 0);
    signal s_addr           : std_logic_vector(2 - 1 downto 0);
    signal s_y              : std_logic_vector(2 - 1 downto 0);
begin
    uut_mux_2bit_new : entity work.mux_2bit_new
        port map(
            a_i         => s_a,
            b_i         => s_b,
            c_i         => s_c,
            d_i         => s_d,
            addr_i      => s_addr,
            y_o         => s_y
           );
           
           p_stimulus : process
           begin
                
                s_a <= "11"; 
                s_b <= "01";  
                s_c <= "10"; 
                s_d <= "00";
                
                s_addr <= "00"; 
                wait for 10ms;
                s_addr <= "01"; 
                wait for 10ms;
                s_addr <= "10"; 
                wait for 10ms;
                s_addr <= "11"; 
                wait for 10ms;
                
                wait;
           end process p_stimulus;
           
end architecture testbench;
