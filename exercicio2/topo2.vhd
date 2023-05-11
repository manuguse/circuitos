library IEEE;
use IEEE.Std_Logic_1164.all;
use IEEE.std_logic_signed.all; -- Para poder usar o operador +

entity topo2 is
port(CLOCK_50:in std_logic;
     CLK_500Hz:in std_logic;
     KEY:in std_logic_vector(3 downto 0);
     SW:in std_logic_vector(17 downto 0);
     LEDR:out std_logic_vector(17 downto 0);
     HEX0,HEX1,HEX2,HEX3,HEX4,HEX5,HEX6,HEX7: out std_logic_vector(6 downto 0));
end topo2;

architecture circuito_exe2 of topo2 is
signal A, F, F1, F2, F3, F4: std_logic_vector(3 downto 0); --vetores intermediários
signal C: std_logic_vector(1 downto 0); --vetores intermediários

component decod_C2 is
port (G: in std_logic_vector(3 downto 0);
F: out std_logic_vector(6 downto 0)
);
end component;

component  decod is
port (C: in std_logic_vector(1 downto 0);
F: out std_logic_vector(6 downto 0)
);
end component;

begin

A <= SW(3 downto 0);
C <= SW(9 downto 8);
			
HEX6 <= (not F(3))&'1'&'1'&'1'&'1'&'1'&'1';

HEX4 <= '0'&SW(9)&SW(9)&'1'&'1'&'1'&'1';
			
HEX1 <= (not F(3))&'1'&'1'&'1'&'1'&'1'&'1';

DEC2a: decod_C2 port map(SW(3 downto 0), HEX5);
DEC2b: decod_C2 port map(F, HEX0);

DEC: decod port map(SW(9 downto 8), HEX3);

HEX2 <= "0110111";

F <= (SW(9)&'1'&SW(9)&SW(8)) + A;

end circuito_exe2;