library IEEE;
use IEEE.Std_Logic_1164.all;

entity decoder is
port (C: in std_logic_vector(3 downto 0);      
	  F: out std_logic_vector(6 downto 0));
end decoder;

architecture decod of decoder is
begin 
	F <= "1000000" when C = "0000" else -- 0
		"1111001" when C = "0001" else -- 1
		"0100100" when C = "0010" else -- 2
		"0110000" when C = "0011" else -- 3
		"0011001" when C = "0100" else -- 4
		"0010010" when C = "0101" else -- 5
		"0000010" when C = "0110" else -- 6
		"1111000" when C = "0111";
end decod;
