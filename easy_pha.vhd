----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 17.10.2023 12:37:11
-- Design Name: 
-- Module Name: easy_pha - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

entity ContadorPulsos is
    Port (
        clk       : in  STD_LOGIC;
        act       : in  STD_LOGIC;  -- Cambio de rst a act
        datain    : in  STD_LOGIC;
        myreg0    : out STD_LOGIC_VECTOR(7 downto 0);
        myreg1    : out STD_LOGIC_VECTOR(7 downto 0);
        myreg2    : out STD_LOGIC_VECTOR(7 downto 0);
        myreg3    : out STD_LOGIC_VECTOR(7 downto 0);
        myreg4    : out STD_LOGIC_VECTOR(7 downto 0);
        myreg5    : out STD_LOGIC_VECTOR(7 downto 0);
        myreg6    : out STD_LOGIC_VECTOR(7 downto 0);
        myreg7    : out STD_LOGIC_VECTOR(7 downto 0);
        myreg8    : out STD_LOGIC_VECTOR(7 downto 0);
        myreg9    : out STD_LOGIC_VECTOR(7 downto 0)
    );
end ContadorPulsos;

architecture Behavioral of ContadorPulsos is
    signal time_counter  : integer range 0 to 999999;  -- Contador de tiempo (10 ms)
    signal pulse_counter : std_logic_vector(7 downto 0);  -- Contador de pulsos (8 bits)
    signal last_datain   : STD_LOGIC := '0';           -- Almacena el valor anterior de datain
    signal state         : integer range 0 to 10;      -- Estado de la máquina de estados

begin
    process (clk, act, datain)
    begin
        if act = '1' then  
            time_counter <= 0;
            pulse_counter <= "00000000";
            last_datain <= '0';
            state <= 0;
        elsif rising_edge(clk) then
            if time_counter < 999999 then
                time_counter <= time_counter + 1;
            else
                time_counter <= 0;
                state <= state + 1;
            end if;

            if datain = '1' and last_datain = '0' then
                pulse_counter <= pulse_counter + 1;
            end if;

            last_datain <= datain;

            case state is
                when 0 =>
                    myreg0 <= std_logic_vector(pulse_counter);
                when 1 =>
                    myreg1 <= std_logic_vector(pulse_counter);
                when 2 =>
                    myreg2 <= std_logic_vector(pulse_counter);
                when 3 =>
                    myreg3 <= std_logic_vector(pulse_counter);
                when 4 =>
                    myreg4 <= std_logic_vector(pulse_counter);
                when 5 =>
                    myreg5 <= std_logic_vector(pulse_counter);
                when 6 =>
                    myreg6 <= std_logic_vector(pulse_counter);
                when 7 =>
                    myreg7 <= std_logic_vector(pulse_counter);
                when 8 =>
                    myreg8 <= std_logic_vector(pulse_counter);
                when 9 =>
                    myreg9 <= std_logic_vector(pulse_counter);
                when others =>
                    null;
            end case;
        end if;
    end process;
end Behavioral;

