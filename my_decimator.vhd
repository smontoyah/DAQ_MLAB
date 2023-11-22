----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 29.09.2023 13:04:27
-- Design Name: 
-- Module Name: my_decimator - Behavioral
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

entity Decimador is
  
  Port (
    clock     : in STD_LOGIC;
    prender   : in STD_LOGIC;
    N         : in STD_LOGIC_VECTOR(11 downto 0);
    data_in   : in STD_LOGIC_VECTOR(15 downto 0); -- Entrada del ADC de 12 bits
    data_out  : out STD_LOGIC_VECTOR(15 downto 0); -- Salida del decimador
    valid_out : out STD_LOGIC                    -- Señal de validación de salida
  );
end entity Decimador;

architecture Behavioral of Decimador is
  signal counter : integer;
  signal input_buffer : STD_LOGIC_VECTOR(15 downto 0);
begin
  process (clock, prender)
  begin
    if prender = '1' then
      counter <= 0;
      input_buffer <= (others => '0');
      valid_out <= '0';
    elsif rising_edge(clock) then
      if counter = N-1 then
        input_buffer <= data_in;
        valid_out <= '1';
        counter <= 0;
      else
        counter <= counter + 1;
        valid_out <= '0';
      end if;
    end if;
  end process;

  data_out <= input_buffer; -- La salida es la última muestra válida almacenada
end Behavioral;
