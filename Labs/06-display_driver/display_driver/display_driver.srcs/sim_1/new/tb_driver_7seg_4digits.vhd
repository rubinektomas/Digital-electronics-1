----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 17.03.2021 11:13:58
-- Design Name: 
-- Module Name: tb_driver_7seg_4digits - Behavioral
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


entity tb_driver_7seg_4digits is
    -- Entity of testbench is always empty
end entity tb_driver_7seg_4digits;

architecture testbench of tb_driver_7seg_4digits is

    -- Local constants
    constant c_CLK_100MHZ_PERIOD : time    := 10 ns;

    --Local signals
    signal s_clk_100MHz : std_logic;
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

uut_top : entity work.driver_7seg_4digits
      port map(
           clk    => s_clk_100MHz,
           reset => s_reset,
                      
            data0_i => s_data0,
            data1_i => s_data1,
            data2_i => s_data2,
            data3_i => s_data3,
        -- 4-bit input value for decimal points
            dp_i    => s_dpi,
        -- Decimal point for specific digit
            dp_o    => s_dpo,
        -- Cathode values for individual segments
            seg_o   => s_seg, 
        -- Common anode signals to individual displays
            dig_o   => s_digo


        );

    p_reset_gen : process
    begin
        s_reset <= '1';
        wait for 128 ns;
        
        -- Reset activated
        s_reset <= '1';
        wait for 53 ns;

        -- Reset deactivated
        s_reset <= '0';

        wait;
    end process p_reset_gen;
    
    

    p_clk_gen : process
    begin
        while now < 750 ns loop         -- 75 periods of 100MHz clock
            s_clk_100MHz <= '0';
            wait for c_CLK_100MHZ_PERIOD / 2;
            s_clk_100MHz <= '1';
            wait for c_CLK_100MHZ_PERIOD / 2;
        end loop;
        wait;
    end process p_clk_gen;

    
    
    p_stimulus : process
    begin
        report "Stimulus process started" severity note;

        
        
        s_data0 <= "0011";
        s_data1 <= "0001";
        s_data2 <= "0100";
        s_data3 <= "0010";
        
        s_dpi <= "0111";
        
        report "Stimulus process finished" severity note;
        wait;
    end process p_stimulus;
        
        
     
        
end testbench;

