----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 30.09.2023 18:43:27
-- Design Name: 
-- Module Name: myMUX - Behavioral
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

entity Multiplexor_2to1 is
    Port ( ADC_signal : in STD_LOGIC_VECTOR(11 downto 0);
           MA_signal : in STD_LOGIC_VECTOR(11 downto 0);
           other_signal  : in STD_LOGIC_VECTOR(11 downto 0);
           modo : in STD_LOGIC_VECTOR(1 downto 0);
           salida : out STD_LOGIC_VECTOR(11 downto 0));
end Multiplexor_2to1;

architecture Behavioral of Multiplexor_2to1 is
begin
    process(ADC_signal, MA_signal, other_signal, modo)
    begin
        if modo = "00" then
            salida <= ADC_signal;
        elsif modo = "01" then
            salida <= MA_signal;
        elsif modo = "10" then
            salida <= other_signal;
        else
            -- Opcional: Manejo de error en caso de modo no válido.
            salida <= (others => 'X'); 
        end if;
    end process;
end Behavioral;

