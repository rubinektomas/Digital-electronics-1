----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 24.03.2021 13:21:01
-- Design Name: 
-- Module Name: tb_d_latch - Behavioral
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

entity tb_d_ff_rst is
--  Port ( );
end tb_d_ff_rst;

architecture Behavioral of tb_d_ff_rst is

           signal s_clk      : STD_LOGIC;
           signal s_en       : STD_LOGIC;
           signal s_rst     : STD_LOGIC;
           signal s_d        : STD_LOGIC;
           signal s_q        : STD_LOGIC;
           signal s_q_bar    : STD_LOGIC;

begin

uut_d_ff_arst : entity work.d_ff_rst
      port map(
           clk => s_clk,
           en => s_en,
           rst => s_rst,
           d => s_d,
           q => s_q,
           q_bar => s_q_bar


        );
        
        
            p_clk_gen : process
    begin
        while now < 750 ns loop         -- 75 periods of 100MHz clock
            s_clk <= '0';
            wait for 10ns / 2;
            s_clk <= '1';
            wait for 10ns / 2;
        end loop;
        wait;
    end process p_clk_gen;
    
    
        
    p_reset_gen : process
    begin
        s_rst <= '0';
        wait for 128 ns;
        
        -- Reset activated
        s_rst <= '1';
        wait for 53 ns;

        -- Reset deactivated
        s_rst <= '0';

        wait;
    end process p_reset_gen;
        
        
        
            p_stimulus : process
    begin
        report "Stimulus process started" severity note;

        
        
        s_en <= '0';
        s_d <= '0';
       while now < 300 ns loop
        s_d <= '0';
        wait for 36 ns;
        s_d <= '1';
        wait for 36 ns;
        end loop;
        
        s_en <= '1';
       
        while now < 600 ns loop
            s_d <= '0';
            wait for 36 ns;
            s_d <= '1';
            wait for 36 ns;
        end loop;
        
        
        s_en <= '0';
      
        while now < 900 ns loop
            s_d <= '0';
            wait for 10 ns;
            s_d <= '1';
            wait for 10 ns;
        end loop;    
        
        
        
        s_en <= '1';
       
        while now < 1200 ns loop
            s_d <= '0';
            
             wait for 10 ns;
            s_d <= '1';
            wait for 10 ns;
        end loop;           
       
        
        report "Stimulus process finished" severity note;
        wait;
    end process p_stimulus;
end Behavioral;
