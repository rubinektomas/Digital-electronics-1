----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 17.03.2021 10:51:11
-- Design Name: 
-- Module Name: tb_top - Behavioral
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


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity tb_top is
--  Port ( );
end tb_top;

architecture Behavioral of tb_top is
    constant c_CLK_100MHZ_PERIOD : time    := 10 ns;
    
    signal s_clk    : std_logic;
    signal s_reset  : std_logic;
    signal s_data0  : std_logic_vector(4 - 1 downto 0);
    signal s_data1  : std_logic_vector(4 - 1 downto 0);
    signal s_data2  : std_logic_vector(4 - 1 downto 0);
    signal s_data3  : std_logic_vector(4 - 1 downto 0);
    signal s_dpi    : std_logic_vector(4 - 1 downto 0);
    signal s_seg  : std_logic_vector(7 - 1 downto 0);
    signal s_digo  : std_logic_vector(4 - 1 downto 0);
    signal s_dpo  : std_logic;
begin

 uut_top : entity work.top
      port map(
           CLK100MHZ    => s_clk,
           BTNC => s_reset,
           SW(4-1 downto 0) => s_data0,
           SW(8-1 downto 4) => s_data1,
           SW(12-1 downto 8) => s_data2,
           SW(16-1 downto 12) => s_data3,
           CA                   => s_seg(0), 
           CB                   => s_seg(1),  
           CC                   => s_seg(2), 
           CD                   => s_seg(3), 
           CE                   => s_seg(4), 
           CF                   => s_seg(5), 
           CG                   => s_seg(6), 
           DP                   => s_dpo, 
           AN                   => s_digo 
        );
        
        
     p_clk_gen : process
    begin
        while now < 750 ns loop         -- 75 periods of 100MHz clock
            s_clk <= '0';
            wait for c_CLK_100MHZ_PERIOD / 2;
            s_clk <= '1';
            wait for c_CLK_100MHZ_PERIOD / 2;
        end loop;
        wait;
    end process p_clk_gen;

    
    
    
        
        
     
        
end Behavioral;
