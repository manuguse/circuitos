library IEEE;
use IEEE.Std_Logic_1164.all;

entity decod is
port (C: in std_logic_vector(1 downto 0);
F: out std_logic_vector(6 downto 0)
);
end decod;

architecture circuito of decod is
begin
F <= "0011001" when C(1) = '0' and C(0) = '0' else
		"0010010" when C(1) = '0' and C(0) = '1' else
		"0100100" when C(1) = '1' and C(0) = '0' else
		"1111001" when C(1) = '1' and C(0) = '1';
end circuito;