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

entity tb_d_latch is
--  Port ( );
end tb_d_latch;

architecture Behavioral of tb_d_latch is

           signal s_en       : STD_LOGIC;
           signal s_arst     : STD_LOGIC;
           signal s_d        : STD_LOGIC;
           signal s_q        : STD_LOGIC;
           signal s_q_bar    : STD_LOGIC;

begin

uut_d_latch : entity work.d_latch
      port map(
           en => s_en,
           arst => s_arst,
           d => s_d,
           q => s_q,
           q_bar => s_q_bar


        );
        
        
        
    p_reset_gen : process
    begin
        s_arst <= '0';
        wait for 128 ns;
        
        -- Reset activated
        s_arst <= '1';
        wait for 53 ns;

        -- Reset deactivated
        s_arst <= '0';
        
        wait for 520 ns;
        
        -- Reset activated
        s_arst <= '1';
        wait for 53 ns;

        -- Reset deactivated
        s_arst <= '0';
        
        wait;
    end process p_reset_gen;
        
        
        
            p_stimulus : process
    begin
        report "Stimulus process started" severity note;

        
        
        s_en <= '0';
        s_d <= '0';
       while now < 300 ns loop
        s_d <= '0';
        wait for 10 ns;
        s_d <= '1';
        wait for 10 ns;
        end loop;
        
        s_en <= '1';
       
        while now < 600 ns loop
            s_d <= '0';
            wait for 10 ns;
            s_d <= '1';
            wait for 10 ns;
        end loop;
        
        
        s_en <= '0';
        s_d <= '1';
        while now < 900 ns loop
            s_d <= '0';
            wait for 10 ns;
            s_d <= '1';
            wait for 10 ns;
        end loop;    
        
        
        
        s_en <= '1';
        s_d <= '1';
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
