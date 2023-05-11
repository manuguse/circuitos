library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

entity decod_C2 is
port (G: in std_logic_vector(3 downto 0);
F: out std_logic_vector(6 downto 0)
);
end decod_C2;

architecture circuito of decod_C2 is
begin
F <= 
"1000000" when G = "0000" else -- 0
"1111001" when G = "0001" else -- 1
"0100100" when G = "0010" else -- 2
"0110000" when G = "0011" else -- 3 
"0011001" when G = "0100" else -- 4
"0010010" when G = "0101" else -- 5
"0000010" when G = "0110" else -- 6 
"1111000" when G = "0111" else -- 7
"0000000" when G = "1000" else -- - 8
"1111000" when G = "1001" else -- - 7
"0000010" when G = "1010" else -- -6
"0010010" when G = "1011" else -- -5
"0011001" when G = "1100" else -- 4 (negativo)
"0110000" when G = "1101" else -- 3 (negativo)
"0100100" when G = "1110" else -- 2 (negativo)
"1111001"; --1 (negativo)
end circuito;