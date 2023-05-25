library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity frequencia is
port (
	reset, clock: in std_logic;
	C2Hz: out std_logic);
end frequencia;

architecture divFreq of frequencia is

	signal contador: std_logic_vector(27 downto 0);
	
	begin 
	
	P1: process(clock, reset, contador)
	begin
		if reset = '0' 
			then contador <= x"0000000";
		elsif clock'event and clock = '1'
			then contador <= contador + 1;
			if contador = x"17D783F" then 
				contador <= x"0000000";
				c2hz <= '1';
			else
				c2hz <= '0';
			end if;
		end if;
	end process;
end divFreq;