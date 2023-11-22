----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 28.09.2023 15:57:20
-- Design Name: 
-- Module Name: trigger - Behavioral
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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Osciloscope is
    Port (
        clk : in STD_LOGIC;
        prender : in STD_LOGIC;
        trigger_level : in STD_LOGIC_VECTOR(11 downto 0); -- Nivel de disparo (12 bits)
        adc_data : in STD_LOGIC_VECTOR(11 downto 0); -- Datos del ADC (12 bits)
        acquisition_flag : out STD_LOGIC -- Bandera de adquisición
    );
end entity;

architecture Behavioral of Osciloscope is
    signal trigger_condition_met : STD_LOGIC := '0';
begin
    
    process (clk, prender)
    begin
        if prender = '1' then
            trigger_condition_met <= '0';
        elsif rising_edge(clk) then
            if adc_data > trigger_level then
                trigger_condition_met <= '1';
            else
                trigger_condition_met <= '0';
            end if;
        end if;
    end process;

    process (clk)
    begin
        if rising_edge(clk) then
            if trigger_condition_met = '1' then
                acquisition_flag <= '1';
            else
                acquisition_flag <= '0';
            end if;
        end if;
    end process;
end Behavioral;

